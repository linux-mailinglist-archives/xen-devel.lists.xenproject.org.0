Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704C279FD74
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 09:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602093.938471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgh63-0005qH-Ow; Thu, 14 Sep 2023 07:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602093.938471; Thu, 14 Sep 2023 07:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgh63-0005ng-LW; Thu, 14 Sep 2023 07:49:07 +0000
Received: by outflank-mailman (input) for mailman id 602093;
 Thu, 14 Sep 2023 07:46:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzIX=E6=igalileo.cz=radoslav.bodo@srs-se1.protection.inumbo.net>)
 id 1qgh3G-0004pd-QJ
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 07:46:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2071b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::71b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c49b8cee-52d2-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 09:46:09 +0200 (CEST)
Received: from AM8PR07MB8074.eurprd07.prod.outlook.com (2603:10a6:20b:3d9::15)
 by DU0PR07MB8572.eurprd07.prod.outlook.com (2603:10a6:10:316::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Thu, 14 Sep
 2023 07:46:05 +0000
Received: from AM8PR07MB8074.eurprd07.prod.outlook.com
 ([fe80::55a1:f531:f1e1:292]) by AM8PR07MB8074.eurprd07.prod.outlook.com
 ([fe80::55a1:f531:f1e1:292%3]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 07:46:03 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c49b8cee-52d2-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMDBYuC7zpJgU0zCb7/YxfZgN8HdpwIRdYDniUuyvRjeua/5esMQ2Mt0P3FGLwX3y0xmHGKFS5d8bnCJz2IpT/Hezupz9hbpOAj0owuI6K2CuabC3bxzVJyVUnxUSgHgqC4ukLEFSNk84CBaX1lNy8sWDmHCSMAf3vaY/M+5w184o444DCjsVx0PdfOHJ8w+XEKtxCIdJrOK0gT+xV67T/cUoGte8y8RRm97rYR7xgOJuylrwQKjTIDJs8O5KQ7ANRR2uybPM+rzdbgcnif23YY9rH0aFpenwxYg8SUtR0xkSYkjZovT8l1YLkrh9ua60banUzi1YqozNAkA4yOWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYNse05wDlxB3wdYktaKvIja6iO9Z3jkSPXa1biJFr0=;
 b=CoLjicG281W+/Mj5svfE1pVu8MdGi6QS+aK4hDP1RyvyIIcr8lbqUrjZd6nGOoA/fZFZEp09wFvPwAWNlS//zGv0xaC4grFJvFrfOlrJtcE5zTzxIYYZ6cQAZJCQP2twkXWKxKaJgTVQNUgWi/ifnKqTpZ9nVL9GpYQMuYV1LrIOjQF1aqSjZi3/USPUVQNkPemMNr7kcSi9+TEL7KGG+OZqcteSURC3gFw1aIeOfU6iX/N52qxBaUDkwk2tkcq2+IBCLD2WPaUY2g4zDNq9/x/WRGJWcf6/+RPtyX67ma8G8TkD8+O9rnQiFGL/1hAxEnxYRjvmhOiVxyshbLZTxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=igalileo.cz; dmarc=pass action=none header.from=igalileo.cz;
 dkim=pass header.d=igalileo.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=igalileo.cz;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYNse05wDlxB3wdYktaKvIja6iO9Z3jkSPXa1biJFr0=;
 b=jx9zpd1b7syqmSpCCNBdJAKiSgqa+g5ExZnmmMIRmhei/bjObXbqApPloOLPQFJPGw6K49o/+tENruwqFTOeR25CVPvlGTiIIQnSy9PIYuN+2a47/bGryAXXXXpMnbbf8xDU0NJGe+HVAbxxBhy+agcj4FGg4v+WdHLCMsbyaXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=igalileo.cz;
Content-Type: multipart/mixed; boundary="------------FsVuRGpDg0hCPbc1SuNfHgGC"
Message-ID: <129f1ee6-8bb4-aa53-b6f3-aa94c35c60e0@igalileo.cz>
Date: Thu, 14 Sep 2023 09:46:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: Hans van Kranenburg <hans@knorrie.org>, 1051862@bugs.debian.org,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <abd6fb7e-bd03-7bf0-b43f-5e4914f6aadf@igalileo.cz>
 <676789d2-a054-2b44-69be-c458ef236d50@knorrie.org>
From: =?UTF-8?Q?Radoslav_Bod=c3=b3?= <radoslav.bodo@igalileo.cz>
Subject: Re: (Debian) Bug#1051862: server flooded with xen_mc_flush warnings
 with xen 4.17 + linux 6.1
In-Reply-To: <676789d2-a054-2b44-69be-c458ef236d50@knorrie.org>
X-ClientProxiedBy: VI1P195CA0085.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::38) To AM8PR07MB8074.eurprd07.prod.outlook.com
 (2603:10a6:20b:3d9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR07MB8074:EE_|DU0PR07MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: d917eff8-91e2-475b-5724-08dbb4f6a527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vEY+JrUj1YVd4oEvgH47vXknlCuOAuQiSYWcHPS7tkXhYsAPtJXWa+KhU8wBTfdTn3s2p70ErAWLCg9IIbj00RA/fmauQ11WfNF1F5J6E4h6BggevBzqFomYAW501FLfQ93lsj78hKx+KMvVkQvtoiyTwJioGu5/rpilp1Vt5E6pU8+3cC/5JIhuMtzrZMDNguuec3JY8FiNMLS97OtolGolujSlUOSbYFZxZ0dT5fRgEFyeDB0VFu7gVwu+W2lye+UZ+RvA0gPxfLjL9T8qCrJxb5A1G5AIS2vBe2dU3iV6QhmVn5A09LoDJK403oRUfvgzw4gL60oETmBp0ihv0z5XOhA5Uk3WUxn80lrzJb+gwB/PUaS6FC9SaHkJbPQ10j6K190owjM/ikhxwMBlYCFggTM4o+ebsFLLcq04AAwb0mSfspwW64VL2l+IIDBVjZTDufY7NDk5CwKCwZwLz5O1bOzdfDFRIOFeCt8L9BMQfH30LKYLX8Y6YvwoqNn4XHUJcAPsxWn6mrvGWpjKabILtn/o9NmdvXtbqLDGNpaRM6esY36oeqHzc7eS06a4Bz0Xbc+UOnB8GPsVts8xaaqnS+QPewcxymLON5VDNvs9ExNrh12xxsx4FMUhxMthhrc5bP8dKm2ewQdMoPTbTfcQAzT1WUiV0Vs5MqJiMk7+V/IC+bS8dkWESKpW4mVlBKnoQNmcN+ACdNJmFprkbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR07MB8074.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39850400004)(186009)(451199024)(1800799009)(86362001)(36756003)(31696002)(31686004)(478600001)(2616005)(38100700002)(6486002)(6512007)(21480400003)(2906002)(83380400001)(5660300002)(41300700001)(6506007)(53546011)(33964004)(235185007)(66946007)(110136005)(786003)(66556008)(66476007)(4326008)(8936002)(316002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NElocWhYNHNxaWtTMy9KM243N0JFUlNXYVRPbGlsZlRmM0lwSHB5a01mUE5W?=
 =?utf-8?B?Sm5IbEdEa1RuSGlpcWFsbUJSNEtISncwNm9JYTIxWmVHUHNVTFh0aHJ6U1Ju?=
 =?utf-8?B?WmlnQ0Zsc1NkL3VGd1kzQmlZaFdQSFM1ZXUrN0tzc0w5Ync3SlNuR3NrdUZz?=
 =?utf-8?B?akxuc1MySWcydFVYVzBpNGJ5M2Y1Q1RhVUlpQ2p3K3lIV3dZYVdzeC9pNVZD?=
 =?utf-8?B?U1FpVEhwWW94MUFOMnpHc2dJSE1PanBEU0h1NjVtYlBGSEVDNHpkUkwxS1Ri?=
 =?utf-8?B?N244SEgvZmhmaEUxRldSQUFid3o3TkRITENiMjNIVktRTFNSWWcwb3NTeUJF?=
 =?utf-8?B?cDBSQUlJRlgvblVoSk12YUNOdGhxR2xET1U4OGg3ODhCS3Z2T1dSWFNjQlhr?=
 =?utf-8?B?WTZIdEppQjVPSDREU2NKVEFab2RMUFlzMDYreWQ1c3U5anhreG9ZY2g4S1Iw?=
 =?utf-8?B?VHVBMUJBMkRmRElhMCtPSjN6QW04Ti9PbzBTbkxKSnRmSTA2czVqMFZwM1B0?=
 =?utf-8?B?NWxLV2lqMWd2cnprME1TaHhVaERadVlad043VnYwRVBYb2RwdDZtL0Y4U25V?=
 =?utf-8?B?Wm5IMWVSWVlKbTNwdjZzY3JYZTJWNHM1VUNjUFV6OWFqRlpNQW5nU1lJNmpv?=
 =?utf-8?B?c3BoYW5TbFBjcG5ISVNFZlZqeStRc2NwSld4SHRsOFZtRnVIWXpnMTN6Rjh5?=
 =?utf-8?B?WWczZG1pbXZMSkppczNaMmVmdXFoVk83RWhtWk1DT3k1MjhobzRXc3ZDMDlL?=
 =?utf-8?B?SHFCVG00bUxJT1lPak9qSnB3NmdsQm1SWEdubStoYm82OVpDek1NNFNPL0Rq?=
 =?utf-8?B?THdPN2l6SlV6STFqZjRIaHZLbHF3ajdVak5uaFlpSEd2dWZMZG1yV3JqVzdO?=
 =?utf-8?B?cEJCM2VlVWVDaUt5WFFnZ3d0YWV2cGZKNU5rWHp4ZmZUa2Zrall6RVNHWXNZ?=
 =?utf-8?B?SitJK0tlalZPbE5VVndqR0FBeE1uYUFGUnIzbHZPeTdHN0xzU0VjWndQbWVt?=
 =?utf-8?B?N1NXNTRQS29LWWd2bTFOYVFnOGphSnN2MGdRZE1PWFV6UjhTcGpoYW5VVy9C?=
 =?utf-8?B?WUxtaml5RnR1RlhoWXViZlF3Mis2eHA5Rm5KOW9tYXhzTzVtc1FmaktqejR0?=
 =?utf-8?B?cDBGa2tsK0k3d25RM09vUERpc1NMcVlPbE5pSFB2VEZmd0dlWlBFZkI0VFdW?=
 =?utf-8?B?UGNETTJWYk5qNWU5b0QxTysxSDBsVFhTaTRhWTByY0w0VnJQc3pOenJvYTda?=
 =?utf-8?B?K3dSNXA5NVhtQXdOTGZMOExqL1NCWmVmeEpramNWSmJjdlRyU0g2NklTT004?=
 =?utf-8?B?czM0TWJUbGZua0laTHltN2hrYnZIQjlHOENiSXd6WGdjVHNrcDlqRGtscUxr?=
 =?utf-8?B?RW1HVXUwT2JKcFhmVHN0UjJ3V2I1SXlpQi94c2ljNjRoMWNIeWJjamw3RkN3?=
 =?utf-8?B?aUlEOGE3TGZJSXhNTVNmZzRnc1UvcFNjbDY0NGJlS2FmTnRodEN1dXBrS0RS?=
 =?utf-8?B?UU42RWVMZHF1MktuYU5sYVl4dXdCSnNWeW5VK3JOMHkzc09obThja1RHN0lM?=
 =?utf-8?B?OTFwM2hZcmM3bzk4ZkZZdXlvUllzMGpxOS96QVkxc20wdnJtTlB4Q1hMY1J4?=
 =?utf-8?B?K2xYTDF6WTZ4eGd4aDBtOTN5eENtNEkwK00rOVlsVCtxcFhDeVBIakRkNGR6?=
 =?utf-8?B?OE9IaVl6d0FFZUJnMGJPd283bXVRM21nRXYzWkQ1eWoxZVFmb1U2TGVGRUgr?=
 =?utf-8?B?Zyt6RjBhWmh0a0grbXVVQzE5SlJXeHdKSnRDSzF0T1Fhc0g5Ykg1aW9tMnpS?=
 =?utf-8?B?UEJTa1BWcEN4VGd4YnVrV25qbXBibTltMjR5a2NaQUlQeE5tdm5BbVNMdFMz?=
 =?utf-8?B?RU1ZQ3hSN1lxblZnWnB3SGRZcG0zb1gyWjJCQzlsUDRZS0huMWozRHd2N0I0?=
 =?utf-8?B?dUNaM0ZYcTh5d2dPeGRpWDJFSEcxT1RPOHlLcW4zSHlVY3ptSnF3b3E1QlZG?=
 =?utf-8?B?UTdWWG9OTmJ5ems2ZzdIZ3RVaVEzWVJLdG5uV1VNUUxWWDlZajl0YU00UVAy?=
 =?utf-8?B?TENxcHY4N0MxWVBZTGFnNllxdUpvUmxGSExvTlZVMkVJVzA0WlhIcW9kSmZr?=
 =?utf-8?B?QWR5WHBucWVhSzVYTVBhSUNoS0lnNU5OV1lxRURQa0E4UFRtYlNLOFhnU05P?=
 =?utf-8?Q?/g8PnkOn73Q232yXs5uyzp8=3D?=
X-OriginatorOrg: igalileo.cz
X-MS-Exchange-CrossTenant-Network-Message-Id: d917eff8-91e2-475b-5724-08dbb4f6a527
X-MS-Exchange-CrossTenant-AuthSource: AM8PR07MB8074.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 07:46:03.0353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b38a1c5-bd56-4cc3-ad51-1991f5feafa6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2xpOSp++6w1JCvFw747AS9AKns3dht1OQplCVO/GIR2fCY4IOIL8tGRHAVIVS+ek2CqLgEF8GGu+WqxGbgQji8x7Szq9kKnQovSSz/d1ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8572

--------------FsVuRGpDg0hCPbc1SuNfHgGC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

hopefully it's ok to reply-all at this point


On 9/13/23 23:38, Hans van Kranenburg wrote:
> I have a few quick additional questions already:
> 
> 1. For clarification.. From your text, I understand that only this one
> single server is showing the problem after the Debian version upgrade.
> Does this mean that this is the only server you have running with
> exactly this combination of hardware (and BIOS version, CPU microcode
> etc etc)? Or, is there another one with same hardware which does not
> show the problem?

This is the unique HW combination in terms of server type Dell R750xs 
and CPU type 'Intel Xeon Silver 4310'


> 2. Can you reply with the output of 'xl dmesg' when the problem happens?
> Or, if the system gets unusable too quick, do you have a serial console
> connection to capture the output?

in attachment


> 3. To confirm... I understand that there are many of these messages.
> Since you pasted only one, does that mean that all of them look exactly
> the same, with "1 of 1 multicall(s) failed: cpu 10" "call  1: op=1
> arg=[ffff8888a1a9eb10] result=-22"? Or are there variations? If so, can
> you reply with a few different ones?

all looks exacly same, only 1 of 1 multicalls failed with same result



On 9/14/23 07:43, Juergen Gross wrote:
 >>> kernel: [   99.768181] Call Trace:
 >>> kernel: [   99.768436]  <TASK>
 >>> kernel: [   99.768691]  ? __warn+0x7d/0xc0
 >>> kernel: [   99.768947]  ? xen_mc_flush+0x196/0x220
 >>> kernel: [   99.769204]  ? report_bug+0xe6/0x170
 >>> kernel: [   99.769460]  ? handle_bug+0x41/0x70
 >>> kernel: [   99.769713]  ? exc_invalid_op+0x13/0x60
 >>> kernel: [   99.769967]  ? asm_exc_invalid_op+0x16/0x20
 >>> kernel: [   99.770223]  ? xen_mc_flush+0x196/0x220
 >>> kernel: [   99.770478]  xen_mc_issue+0x6d/0x70
 >>> kernel: [   99.770726]  xen_set_pmd_hyper+0x54/0x90
 >>> kernel: [   99.770965]  do_set_pmd+0x188/0x2a0
 >
 > This looks like an attempt to map a hugepage, which isn't supported
 > when running as a Xen PV guest (this includes dom0).
 >
 > Are transparent hugepages enabled somehow? In a Xen PV guest there
 > should be no /sys/kernel/mm/transparent_hugepage directory. Depending 
 > on the presence of that directory either hugepage_init() has a bug, 
or > a test for hugepages being supported is missing in 
filemap_map_pages() > or do_set_pmd().
 >
 >>> kernel: [   99.771200]  filemap_map_pages+0x1a9/0x6e0
 >>> kernel: [   99.771434]  xfs_filemap_map_pages+0x41/0x60 [xfs]
 >>> kernel: [   99.771714]  do_fault+0x1a4/0x410
 >>> kernel: [   99.771947]  __handle_mm_fault+0x660/0xfa0

in faulty state (linux 6.1) and also in good state (linux 5.10), the 
directory /sys/kernel/mm/transparent_hugepage is not present

we have also tried to boot with 'transparent_hugepage=never', but it 
make no difference


best regards
bodik
--------------FsVuRGpDg0hCPbc1SuNfHgGC
Content-Type: text/plain; charset=UTF-8; name="xen-mcflush-xldmesg.txt"
Content-Disposition: attachment; filename="xen-mcflush-xldmesg.txt"
Content-Transfer-Encoding: base64

KFhFTikgWGVuIHZlcnNpb24gNC4xNy4yLXByZSAoRGViaWFuIDQuMTcuMSsyLWdiNzczYzQ4ZTM2
LTEpIChwa2cteGVuLWRldmVsQGxpc3RzLmFsaW90aC5kZWJpYW4ub3JnKSAoeDg2XzY0LWxpbnV4
LWdudS1nY2MgKERlYmlhbiAxMi4yLjAtMTQpIDEyLjIuMCkgZGVidWc9biBUaHUgTWF5IDE4IDE5
OjI2OjMwIFVUQyAyMDIzCihYRU4pIEJvb3Rsb2FkZXI6IEdSVUIgMi4wNi0xMwooWEVOKSBDb21t
YW5kIGxpbmU6IHBsYWNlaG9sZGVyIGRvbTBfbWVtPTMyRyxtYXg6MzJHCihYRU4pIFhlbiBpbWFn
ZSBsb2FkIGJhc2UgYWRkcmVzczogMHg1ZTgwMDAwMAooWEVOKSBWaWRlbyBpbmZvcm1hdGlvbjoK
KFhFTikgIFZHQSBpcyB0ZXh0IG1vZGUgODB4MjUsIGZvbnQgOHgxNgooWEVOKSAgVkJFL0REQyBt
ZXRob2RzOiBub25lOyBFRElEIHRyYW5zZmVyIHRpbWU6IDAgc2Vjb25kcwooWEVOKSAgRURJRCBp
bmZvIG5vdCByZXRyaWV2ZWQgYmVjYXVzZSBubyBEREMgcmV0cmlldmFsIG1ldGhvZCBkZXRlY3Rl
ZAooWEVOKSBEaXNjIGluZm9ybWF0aW9uOgooWEVOKSAgRm91bmQgMiBNQlIgc2lnbmF0dXJlcwoo
WEVOKSAgRm91bmQgMiBFREQgaW5mb3JtYXRpb24gc3RydWN0dXJlcwooWEVOKSBYZW4tZTgyMCBS
QU0gbWFwOgooWEVOKSAgWzAwMDAwMDAwMDAwMDAwMDAsIDAwMDAwMDAwMDAwOThmZmZdICh1c2Fi
bGUpCihYRU4pICBbMDAwMDAwMDAwMDA5OTAwMCwgMDAwMDAwMDAwMDA5ZmZmZl0gKHJlc2VydmVk
KQooWEVOKSAgWzAwMDAwMDAwMDAwZTAwMDAsIDAwMDAwMDAwMDAwZmZmZmZdIChyZXNlcnZlZCkK
KFhFTikgIFswMDAwMDAwMDAwMTAwMDAwLCAwMDAwMDAwMDRhNDEzZmZmXSAodXNhYmxlKQooWEVO
KSAgWzAwMDAwMDAwNGE0MTQwMDAsIDAwMDAwMDAwNGI0MTNmZmZdIChBQ1BJIE5WUykKKFhFTikg
IFswMDAwMDAwMDRiNDE0MDAwLCAwMDAwMDAwMDRiZmMyZmZmXSAodXNhYmxlKQooWEVOKSAgWzAw
MDAwMDAwNGJmYzMwMDAsIDAwMDAwMDAwNGMwYzhmZmZdIChyZXNlcnZlZCkKKFhFTikgIFswMDAw
MDAwMDRjMGM5MDAwLCAwMDAwMDAwMDRjZmZmZmZmXSAodXNhYmxlKQooWEVOKSAgWzAwMDAwMDAw
NGQwMDAwMDAsIDAwMDAwMDAwNGQxZmZmZmZdIChyZXNlcnZlZCkKKFhFTikgIFswMDAwMDAwMDRk
MjAwMDAwLCAwMDAwMDAwMDVlZWZkZmZmXSAodXNhYmxlKQooWEVOKSAgWzAwMDAwMDAwNWVlZmUw
MDAsIDAwMDAwMDAwNmUzZmVmZmZdIChyZXNlcnZlZCkKKFhFTikgIFswMDAwMDAwMDZlM2ZmMDAw
LCAwMDAwMDAwMDZmM2ZlZmZmXSAoQUNQSSBOVlMpCihYRU4pICBbMDAwMDAwMDA2ZjNmZjAwMCwg
MDAwMDAwMDA2ZjdmZWZmZl0gKEFDUEkgZGF0YSkKKFhFTikgIFswMDAwMDAwMDZmN2ZmMDAwLCAw
MDAwMDAwMDZmN2ZmZmZmXSAodXNhYmxlKQooWEVOKSAgWzAwMDAwMDAwNmY4MDAwMDAsIDAwMDAw
MDAwOGZmZmZmZmZdIChyZXNlcnZlZCkKKFhFTikgIFswMDAwMDAwMGZkMDAwMDAwLCAwMDAwMDAw
MGZlN2ZmZmZmXSAocmVzZXJ2ZWQpCihYRU4pICBbMDAwMDAwMDBmZWMwMDAwMCwgMDAwMDAwMDBm
ZWMwMGZmZl0gKHJlc2VydmVkKQooWEVOKSAgWzAwMDAwMDAwZmVjODAwMDAsIDAwMDAwMDAwZmVk
MDBmZmZdIChyZXNlcnZlZCkKKFhFTikgIFswMDAwMDAwMGZlZDQwMDAwLCAwMDAwMDAwMGZlZDQ0
ZmZmXSAocmVzZXJ2ZWQpCihYRU4pICBbMDAwMDAwMDBmZjAwMDAwMCwgMDAwMDAwMDBmZmZmZmZm
Zl0gKHJlc2VydmVkKQooWEVOKSAgWzAwMDAwMDAxMDAwMDAwMDAsIDAwMDAwMDQwN2ZmZmZmZmZd
ICh1c2FibGUpCihYRU4pIEFDUEk6IFJTRFAgMDAwRkUzMjAsIDAwMjQgKHIyIERFTEwgICkKKFhF
TikgQUNQSTogWFNEVCA2RjQwQTE4OCwgMDBGNCAocjEgREVMTCAgIFBFX1NDMyAgICAgICAgICAw
IERFTEwgIDEwMDAwMTMpCihYRU4pIEFDUEk6IEZBQ1AgNkY3RjYwMDAsIDAxMTQgKHI2IERFTEwg
ICBQRV9TQzMgICAgICAgICAgMCBERUxMICAgICAgICAxKQooWEVOKSBBQ1BJOiBEU0RUIDZGNzcw
MDAwLCA3RkFEMyAocjIgREVMTCAgIFBFX1NDMyAgICAgICAgICAzIERFTEwgICAgICAgIDEpCihY
RU4pIEFDUEk6IEZBQ1MgNkYzNzMwMDAsIDAwNDAKKFhFTikgQUNQSTogU1NEVCA2RjdGQjAwMCwg
MTU3MSAocjIgIElOVEVMIFJBU19BQ1BJICAgICAgICAxIElOVEwgMjAyMTAzMzEpCihYRU4pIEFD
UEk6IFNTRFQgNkY3RkEwMDAsIDA3NDUgKHIyICBJTlRFTCBBRERSWExBVCAgICAgICAgMSBJTlRM
IDIwMjEwMzMxKQooWEVOKSBBQ1BJOiBFSU5KIDZGN0Y5MDAwLCAwMTUwIChyMSBERUxMICAgUEVf
U0MzICAgICAgICAgIDEgSU5UTCAgICAgICAgMSkKKFhFTikgQUNQSTogQkVSVCA2RjdGODAwMCwg
MDAzMCAocjEgREVMTCAgIFBFX1NDMyAgICAgICAgICAxIElOVEwgICAgICAgIDEpCihYRU4pIEFD
UEk6IEVSU1QgNkY3RjcwMDAsIDAyMzAgKHIxIERFTEwgICBQRV9TQzMgICAgICAgICAgMSBJTlRM
ICAgICAgICAxKQooWEVOKSBBQ1BJOiBITUFUIDZGN0Y1MDAwLCAwMTgwIChyMSBERUxMICAgUEVf
U0MzICAgICAgICAgIDEgREVMTCAgICAgICAgMSkKKFhFTikgQUNQSTogSFBFVCA2RjdGNDAwMCwg
MDAzOCAocjEgREVMTCAgIFBFX1NDMyAgICAgICAgICAxIERFTEwgICAgICAgIDEpCihYRU4pIEFD
UEk6IE1DRkcgNkY3RjMwMDAsIDAwM0MgKHIxIERFTEwgICBQRV9TQzMgICAgICAgICAgMSBERUxM
ICAgICAgICAxKQooWEVOKSBBQ1BJOiBNSUdUIDZGN0YyMDAwLCAwMDQwIChyMSBERUxMICAgUEVf
U0MzICAgICAgICAgIDAgREVMTCAgICAgICAgMSkKKFhFTikgQUNQSTogTVNDVCA2RjdGMTAwMCwg
MDA5MCAocjEgREVMTCAgIFBFX1NDMyAgICAgICAgICAxIERFTEwgICAgICAgIDEpCihYRU4pIEFD
UEk6IFdTTVQgNkY3RjAwMDAsIDAwMjggKHIxIERFTEwgICBQRV9TQzMgICAgICAgICAgMCBERUxM
ICAgICAgICAxKQooWEVOKSBBQ1BJOiBBUElDIDZGNzZGMDAwLCAwMzVFIChyNCBERUxMICAgUEVf
U0MzICAgICAgICAgIDAgREVMTCAgICAgICAgMSkKKFhFTikgQUNQSTogU0xJVCA2Rjc2RTAwMCwg
MDAzMCAocjEgREVMTCAgIFBFX1NDMyAgICAgICAgICAxIERFTEwgIDEwMDAwMTMpCihYRU4pIEFD
UEk6IFNSQVQgNkY3NjcwMDAsIDY0MzAgKHIzIERFTEwgICBQRV9TQzMgICAgICAgICAgMiBERUxM
ICAxMDAwMDEzKQooWEVOKSBBQ1BJOiBPRU00IDZGNURGMDAwLCAxODdBNjEgKHIyICBJTlRFTCBD
UFUgIENTVCAgICAgMzAwMCBJTlRMIDIwMjEwMzMxKQooWEVOKSBBQ1BJOiBPRU0xIDZGNENCMDAw
LCAxMTM0ODkgKHIyICBJTlRFTCBDUFUgRUlTVCAgICAgMzAwMCBJTlRMIDIwMjEwMzMxKQooWEVO
KSBBQ1BJOiBPRU0yIDZGNDg0MDAwLCA0NjAzMSAocjIgIElOVEVMIENQVSAgSFdQICAgICAzMDAw
IElOVEwgMjAyMTAzMzEpCihYRU4pIEFDUEk6IFNTRFQgNkY0MEQwMDAsIDc2NEE1IChyMiAgSU5U
RUwgU1NEVCAgUE0gICAgIDQwMDAgSU5UTCAyMDIxMDMzMSkKKFhFTikgQUNQSTogU1NEVCA2RjQw
QzAwMCwgMEFBMyAocjIgREVMTCAgIFBFX1NDMyAgICAgICAgICAwIERFTEwgICAgICAgIDEpCihY
RU4pIEFDUEk6IEhFU1QgNkY0MEIwMDAsIDAxN0MgKHIxIERFTEwgICBQRV9TQzMgICAgICAgICAg
MSBJTlRMICAgICAgICAxKQooWEVOKSBBQ1BJOiBTU0RUIDZGN0ZEMDAwLCAwNjIzIChyMiBERUxM
ICAgVHBtMlRhYmwgICAgIDEwMDAgSU5UTCAyMDIxMDMzMSkKKFhFTikgQUNQSTogVFBNMiA2RjQw
OTAwMCwgMDA0QyAocjQgREVMTCAgIFBFX1NDMyAgICAgICAgICAyIERFTEwgIDEwMDAwMTMpCihY
RU4pIEFDUEk6IFNTRFQgNkY0MDEwMDAsIDcyOTkgKHIyICBJTlRFTCBTcHNObSAgICAgICAgICAg
MiBJTlRMIDIwMjEwMzMxKQooWEVOKSBBQ1BJOiBTU0RUIDZGNDAwMDAwLCAwNkVBIChyMiBERUxM
ICAgUEVfU0MzICAgICAgICAgIDIgREVMTCAgICAgICAgMSkKKFhFTikgQUNQSTogRE1BUiA2RjNG
RjAwMCwgMDE4OCAocjEgREVMTCAgIFBFX1NDMyAgICAgICAgICAxIERFTEwgICAgICAgIDEpCihY
RU4pIFN5c3RlbSBSQU06IDI2MTU5NU1CICgyNjc4NzM4NjRrQikKKFhFTikgRG9tYWluIGhlYXAg
aW5pdGlhbGlzZWQgRE1BIHdpZHRoIDMyIGJpdHMKKFhFTikgeDJBUElDIG1vZGUgaXMgYWxyZWFk
eSBlbmFibGVkIGJ5IEJJT1MuCihYRU4pIEFDUEk6IDMyLzY0WCBGQUNTIGFkZHJlc3MgbWlzbWF0
Y2ggaW4gRkFEVCAtIDZmMzczMDAwLzAwMDAwMDAwMDAwMDAwMDAsIHVzaW5nIDMyCihYRU4pIElP
QVBJQ1swXTogYXBpY19pZCA4LCB2ZXJzaW9uIDMyLCBhZGRyZXNzIDB4ZmVjMDAwMDAsIEdTSSAw
LTExOQooWEVOKSBDUFUwOiBUU0M6IHJhdGlvOiAxNjggLyAyCihYRU4pIENQVTA6IGJ1czogMTAw
IE1IeiBiYXNlOiAyMTAwIE1IeiBtYXg6IDMzMDAgTUh6CihYRU4pIENQVTA6IDgwMCAuLi4gMjEw
MCBNSHoKKFhFTikgeHN0YXRlOiBzaXplOiAweGE4OCBhbmQgc3RhdGVzOiAweDJlNwooWEVOKSBV
bnJlY29nbmlzZWQgQ1BVIG1vZGVsIDB4NmEgLSBhc3N1bWluZyB2dWxuZXJhYmxlIHRvIExhenlG
UFUKKFhFTikgU3BlY3VsYXRpdmUgbWl0aWdhdGlvbiBmYWNpbGl0aWVzOgooWEVOKSAgIEhhcmR3
YXJlIGhpbnRzOiBSRENMX05PIElCUlNfQUxMIFNLSVBfTDFERkwgTURTX05PIFRBQV9OTyBTQkRS
X1NTRFBfTk8gUFNEUF9OTwooWEVOKSAgIEhhcmR3YXJlIGZlYXR1cmVzOiBJQlBCIElCUlMgU1RJ
QlAgU1NCRCBQU0ZEIEwxRF9GTFVTSCBNRF9DTEVBUiBUU1hfQ1RSTCBGQl9DTEVBUiBGQl9DTEVB
Ul9DVFJMCihYRU4pICAgQ29tcGlsZWQtaW4gc3VwcG9ydDogSU5ESVJFQ1RfVEhVTksgU0hBRE9X
X1BBR0lORwooWEVOKSAgIFhlbiBzZXR0aW5nczogQlRJLVRodW5rIEpNUCwgU1BFQ19DVFJMOiBJ
QlJTKyBTVElCUCsgU1NCRC0gUFNGRC0gVFNYKywgT3RoZXI6IElCUEItY3R4dCBCUkFOQ0hfSEFS
REVOCihYRU4pICAgU3VwcG9ydCBmb3IgSFZNIFZNczogTVNSX1NQRUNfQ1RSTCBNU1JfVklSVF9T
UEVDX0NUUkwgUlNCIEVBR0VSX0ZQVQooWEVOKSAgIFN1cHBvcnQgZm9yIFBWIFZNczogTVNSX1NQ
RUNfQ1RSTCBFQUdFUl9GUFUKKFhFTikgICBYUFRJICg2NC1iaXQgUFYgb25seSk6IERvbTAgZGlz
YWJsZWQsIERvbVUgZGlzYWJsZWQgKHdpdGggUENJRCkKKFhFTikgICBQViBMMVRGIHNoYWRvd2lu
ZzogRG9tMCBkaXNhYmxlZCwgRG9tVSBkaXNhYmxlZAooWEVOKSBVc2luZyBzY2hlZHVsZXI6IFNN
UCBDcmVkaXQgU2NoZWR1bGVyIHJldjIgKGNyZWRpdDIpCihYRU4pIEluaXRpYWxpemluZyBDcmVk
aXQyIHNjaGVkdWxlcgooWEVOKSBQbGF0Zm9ybSB0aW1lciBpcyAyNC4wMDBNSHogSFBFVAooWEVO
KSBEZXRlY3RlZCAyMDk1LjA3OCBNSHogcHJvY2Vzc29yLgooWEVOKSBJbnRlbCBWVC1kIGlvbW11
IDggc3VwcG9ydGVkIHBhZ2Ugc2l6ZXM6IDRrQiwgMk1CLCAxR0IKKFhFTikgSW50ZWwgVlQtZCBp
b21tdSA3IHN1cHBvcnRlZCBwYWdlIHNpemVzOiA0a0IsIDJNQiwgMUdCCihYRU4pIEludGVsIFZU
LWQgaW9tbXUgNiBzdXBwb3J0ZWQgcGFnZSBzaXplczogNGtCLCAyTUIsIDFHQgooWEVOKSBJbnRl
bCBWVC1kIGlvbW11IDUgc3VwcG9ydGVkIHBhZ2Ugc2l6ZXM6IDRrQiwgMk1CLCAxR0IKKFhFTikg
SW50ZWwgVlQtZCBpb21tdSA0IHN1cHBvcnRlZCBwYWdlIHNpemVzOiA0a0IsIDJNQiwgMUdCCihY
RU4pIEludGVsIFZULWQgaW9tbXUgMyBzdXBwb3J0ZWQgcGFnZSBzaXplczogNGtCLCAyTUIsIDFH
QgooWEVOKSBJbnRlbCBWVC1kIGlvbW11IDIgc3VwcG9ydGVkIHBhZ2Ugc2l6ZXM6IDRrQiwgMk1C
LCAxR0IKKFhFTikgSW50ZWwgVlQtZCBpb21tdSAxIHN1cHBvcnRlZCBwYWdlIHNpemVzOiA0a0Is
IDJNQiwgMUdCCihYRU4pIEludGVsIFZULWQgaW9tbXUgMCBzdXBwb3J0ZWQgcGFnZSBzaXplczog
NGtCLCAyTUIsIDFHQgooWEVOKSBJbnRlbCBWVC1kIGlvbW11IDkgc3VwcG9ydGVkIHBhZ2Ugc2l6
ZXM6IDRrQiwgMk1CLCAxR0IKKFhFTikgSW50ZWwgVlQtZCBTbm9vcCBDb250cm9sIGVuYWJsZWQu
CihYRU4pIEludGVsIFZULWQgRG9tMCBETUEgUGFzc3Rocm91Z2ggbm90IGVuYWJsZWQuCihYRU4p
IEludGVsIFZULWQgUXVldWVkIEludmFsaWRhdGlvbiBlbmFibGVkLgooWEVOKSBJbnRlbCBWVC1k
IEludGVycnVwdCBSZW1hcHBpbmcgZW5hYmxlZC4KKFhFTikgSW50ZWwgVlQtZCBQb3N0ZWQgSW50
ZXJydXB0IG5vdCBlbmFibGVkLgooWEVOKSBJbnRlbCBWVC1kIFNoYXJlZCBFUFQgdGFibGVzIGVu
YWJsZWQuCihYRU4pIEkvTyB2aXJ0dWFsaXNhdGlvbiBlbmFibGVkCihYRU4pICAtIERvbTAgbW9k
ZTogUmVsYXhlZAooWEVOKSBJbnRlcnJ1cHQgcmVtYXBwaW5nIGVuYWJsZWQKKFhFTikgRW5hYmxl
ZCBkaXJlY3RlZCBFT0kgd2l0aCBpb2FwaWNfYWNrX29sZCBvbiEKKFhFTikgRW5hYmxpbmcgQVBJ
QyBtb2RlOiAgQ2x1c3RlcmVkLiAgVXNpbmcgMSBJL08gQVBJQ3MKKFhFTikgRU5BQkxJTkcgSU8t
QVBJQyBJUlFzCihYRU4pICAtPiBVc2luZyBvbGQgQUNLIG1ldGhvZAooWEVOKSBBbGxvY2F0ZWQg
Y29uc29sZSByaW5nIG9mIDEyOCBLaUIuCihYRU4pIFZNWDogU3VwcG9ydGVkIGFkdmFuY2VkIGZl
YXR1cmVzOgooWEVOKSAgLSBBUElDIE1NSU8gYWNjZXNzIHZpcnR1YWxpc2F0aW9uCihYRU4pICAt
IEFQSUMgVFBSIHNoYWRvdwooWEVOKSAgLSBFeHRlbmRlZCBQYWdlIFRhYmxlcyAoRVBUKQooWEVO
KSAgLSBWaXJ0dWFsLVByb2Nlc3NvciBJZGVudGlmaWVycyAoVlBJRCkKKFhFTikgIC0gVmlydHVh
bCBOTUkKKFhFTikgIC0gTVNSIGRpcmVjdC1hY2Nlc3MgYml0bWFwCihYRU4pICAtIFVucmVzdHJp
Y3RlZCBHdWVzdAooWEVOKSAgLSBBUElDIFJlZ2lzdGVyIFZpcnR1YWxpemF0aW9uCihYRU4pICAt
IFZpcnR1YWwgSW50ZXJydXB0IERlbGl2ZXJ5CihYRU4pICAtIFBvc3RlZCBJbnRlcnJ1cHQgUHJv
Y2Vzc2luZwooWEVOKSAgLSBWTUNTIHNoYWRvd2luZwooWEVOKSAgLSBWTSBGdW5jdGlvbnMKKFhF
TikgIC0gVmlydHVhbGlzYXRpb24gRXhjZXB0aW9ucwooWEVOKSAgLSBQYWdlIE1vZGlmaWNhdGlv
biBMb2dnaW5nCihYRU4pICAtIFRTQyBTY2FsaW5nCihYRU4pICAtIEJ1cyBMb2NrIERldGVjdGlv
bgooWEVOKSBIVk06IEFTSURzIGVuYWJsZWQuCihYRU4pIEhWTTogVk1YIGVuYWJsZWQKKFhFTikg
SFZNOiBIYXJkd2FyZSBBc3Npc3RlZCBQYWdpbmcgKEhBUCkgZGV0ZWN0ZWQKKFhFTikgSFZNOiBI
QVAgcGFnZSBzaXplczogNGtCLCAyTUIsIDFHQgooWEVOKSBCcm91Z2h0IHVwIDQ4IENQVXMKKFhF
TikgU2NoZWR1bGluZyBncmFudWxhcml0eTogY3B1LCAxIENQVSBwZXIgc2NoZWQtcmVzb3VyY2UK
KFhFTikgSW5pdGlhbGl6aW5nIENyZWRpdDIgc2NoZWR1bGVyCihYRU4pIERvbTAgaGFzIG1heGlt
dW0gMTM2OCBQSVJRcwooWEVOKSAgWGVuICBrZXJuZWw6IDY0LWJpdCwgbHNiCihYRU4pICBEb20w
IGtlcm5lbDogNjQtYml0LCBQQUUsIGxzYiwgcGFkZHIgMHgxMDAwMDAwIC0+IDB4NGEwMDAwMAoo
WEVOKSBQSFlTSUNBTCBNRU1PUlkgQVJSQU5HRU1FTlQ6CihYRU4pICBEb20wIGFsbG9jLjogICAw
MDAwMDA0MDIwMDAwMDAwLT4wMDAwMDA0MDI4MDAwMDAwICg4MzQ1NTgwIHBhZ2VzIHRvIGJlIGFs
bG9jYXRlZCkKKFhFTikgIEluaXQuIHJhbWRpc2s6IDAwMDAwMDQwN2Q3ZWMwMDAtPjAwMDAwMDQw
N2ZmZmY2OWUKKFhFTikgVklSVFVBTCBNRU1PUlkgQVJSQU5HRU1FTlQ6CihYRU4pICBMb2FkZWQg
a2VybmVsOiBmZmZmZmZmZjgxMDAwMDAwLT5mZmZmZmZmZjg0YTAwMDAwCihYRU4pICBQaHlzLU1h
Y2ggbWFwOiAwMDAwMDA4MDAwMDAwMDAwLT4wMDAwMDA4MDA0MDAwMDAwCihYRU4pICBTdGFydCBp
bmZvOiAgICBmZmZmZmZmZjg0YTAwMDAwLT5mZmZmZmZmZjg0YTAwNGI4CihYRU4pICBQYWdlIHRh
YmxlczogICBmZmZmZmZmZjg0YTAxMDAwLT5mZmZmZmZmZjg0YTJhMDAwCihYRU4pICBCb290IHN0
YWNrOiAgICBmZmZmZmZmZjg0YTJhMDAwLT5mZmZmZmZmZjg0YTJiMDAwCihYRU4pICBUT1RBTDog
ICAgICAgICBmZmZmZmZmZjgwMDAwMDAwLT5mZmZmZmZmZjg0YzAwMDAwCihYRU4pICBFTlRSWSBB
RERSRVNTOiBmZmZmZmZmZjgzMDcyMWMwCihYRU4pIERvbTAgaGFzIG1heGltdW0gNDggVkNQVXMK
KFhFTikgSW5pdGlhbCBsb3cgbWVtb3J5IHZpcnEgdGhyZXNob2xkIHNldCBhdCAweDQwMDAgcGFn
ZXMuCihYRU4pIFNjcnViYmluZyBGcmVlIFJBTSBpbiBiYWNrZ3JvdW5kCihYRU4pIFN0ZC4gTG9n
bGV2ZWw6IEVycm9ycyBhbmQgd2FybmluZ3MKKFhFTikgR3Vlc3QgTG9nbGV2ZWw6IE5vdGhpbmcg
KFJhdGUtbGltaXRlZDogRXJyb3JzIGFuZCB3YXJuaW5ncykKKFhFTikgKioqIFNlcmlhbCBpbnB1
dCB0byBET00wICh0eXBlICdDVFJMLWEnIHRocmVlIHRpbWVzIHRvIHN3aXRjaCBpbnB1dCkKKFhF
TikgRnJlZWQgNjI0a0IgaW5pdCBtZW1vcnkK

--------------FsVuRGpDg0hCPbc1SuNfHgGC--

