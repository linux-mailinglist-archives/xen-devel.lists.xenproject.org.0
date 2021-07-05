Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD63BBD3A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 15:01:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150209.277759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0OE5-0007Vk-ON; Mon, 05 Jul 2021 13:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150209.277759; Mon, 05 Jul 2021 13:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0OE5-0007Tu-KX; Mon, 05 Jul 2021 13:01:29 +0000
Received: by outflank-mailman (input) for mailman id 150209;
 Mon, 05 Jul 2021 13:01:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0OE3-0007To-QQ
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 13:01:27 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f99ed801-f7ad-428b-84f2-c2833e2b7ab9;
 Mon, 05 Jul 2021 13:01:26 +0000 (UTC)
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
X-Inumbo-ID: f99ed801-f7ad-428b-84f2-c2833e2b7ab9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625490086;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=m3jpDvQLw9xYzPTPWM+y2B2j74+F/Yyap4tkoG69O7Q=;
  b=LEZiEQ2IBZmKSsa/YlDKE2McszRGaKF5dcfD0s6FV09gS7ArxL2lYrxK
   jCMPiFBW2ZerdRj+SQ9AlYlvlx3akUSgyc+wpR+TGzKW0T5w73Vj2hTZ7
   5rdFUL5+zJFRqKIfbcsRf2IHi8kOqaAH5OI3bagUid09ovVCyAdtXdD2t
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TSZHqcEvbQP+N4NddP8TD8qKOgGXq+uRh5I9VBGwgGEL6LEB3znKz11mlVOr9PKmnxEXIdHgZM
 zWk3GwzGmNfYdKR1KfIXtWwE0UiN1i0BhflOcsDi7BG4BjOReoRn0QmKhbOzzJ0OdWSbyOAfsn
 9+PcF3GH7xfEaxE9TXgXgebVLwPOfYemyctHIolvi1eQf7dgVZw7+wGAyKnxLOEj64oTW+DogY
 68gGv3DlOcDIrRrZZYcDo5VtG2L1wUBjET+18NgedTd5AAEdL/mQgnWTtzXgNOVSpoQon0nqzf
 EoU=
X-SBRS: 5.1
X-MesageID: 47582778
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0s+PWqCcLTuUplzlHehHsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LW90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkdK1kJ
 0QCZSWa+eAfmSS7/yKmTVQeuxIqLLskNHK9JLjJjVWPGVXgslbnndE422gYytLrWd9dPgE/d
 anl7F6T23KQwVnUi33PAhIY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX222oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iCnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeol8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4K4uZkRkIM4jgYJq3MgiFBs/KuZGIMu60vFnLA
 BWNrCf2B4MGmnqKUww1wJUsa6RtndaJGbMfqFNgL3N79FspgEP86Iv/r1Wop4xzuNId3B63Z
 WzDk1JrsAFciZEV9MxOA8+KfHHQ1AlFii8Tl56Z26XTJ06Bw==
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47582778"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaTSSIQ1VwC8xANgLr/qhpIaOtK9EwuX+iJHqtcZpXlyZeTLFDxyOU0mztmn+vxDJLX92TOY42Gu5hgSKz+Q5s9y685t0rcF8HM5mN5YE4mMoeNoik1httrRrYRDmXhCiSGK/bT7113EJzvZpnt7heje438FnH9f+5jTZlyzzDhtt9cyIs6zYAgTq7qBeQENWLYSj1qJyAEtT9aIOpbN7hb4R3OWKv+gujCoJSDdGK6hAfhvvmFMnESfchukMt5XEXtRG54eDn4qmlC5rbBg0uY2lO5v6XiyxwqOjiJkfX8GjUWHdYmZIBRNbQ2XxIFySc3q7AgI18HRk5JIOUsLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3jpDvQLw9xYzPTPWM+y2B2j74+F/Yyap4tkoG69O7Q=;
 b=lR4iwzGsCV9O9qluLx8dgkC6TOtRdivMshQj/G+1CtUz8iPxj9Izp1hMERGMmiyWUz2t0bMnyc+WCN+kYRCIT7qtbn094pUFD9IH2r09zjRz9ZLgmb/F7zEPobPY0PJ+9nj8IAIUPQGPVU4JHUyOf882n+c2O5HNbAVK9aEFJZcjAP5IU3Yg35sOcnMifuOFTssVtBNWgi9fl6FE6+XxHIdxmkTvWl8ePAp7Mje2IRbcM720+KPLkhzhvJEN4YtZ4fPRImgJqCZPDPkeazVgD0Wt7exszIeqsyAuoAYmKbcNFbqjQtqa9jX1tPljWcKpjhvCedipd4J5EBLh2Vf2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3jpDvQLw9xYzPTPWM+y2B2j74+F/Yyap4tkoG69O7Q=;
 b=tDdL7h/wWmYKC67Ig8Q08eVjx6GSsokdBwtHg7ACnHtclwbniwkbJ+JhpEFi5EeOPL0vFSVtEvSA/Lww3+rw79M66IgHpA/MLnrRzAuzeBWnJnkNhx/+B/zN4LDr2vabbUYTFlPbV1gxoX99taQQHH/KFPWzmX9cW9ri9dT40y8=
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-16-olaf@aepfle.de>
 <644a7a4c-4fab-07be-2e69-2637254de859@citrix.com>
 <20210705132700.05d92744.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v20210701 15/40] tools: prepare to allocate saverestore
 arrays once
Message-ID: <6bd5fbb4-881f-e41c-46f5-d31c93a7ff7a@citrix.com>
Date: Mon, 5 Jul 2021 14:01:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705132700.05d92744.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0199.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e763b231-f892-4e45-0f39-08d93fb4fa07
X-MS-TrafficTypeDiagnostic: BY5PR03MB5079:
X-Microsoft-Antispam-PRVS: <BY5PR03MB507966A8AB2259100ABCF04CBA1C9@BY5PR03MB5079.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H5HuoszauNgQFapCtX9SoQcuMThRfr0m8zgCFFFV8LK3JDv1hYYviMKpMOrIHE8zwfsP+A3YLStXlTHNjIPvmIktFrlL/Xxhyg8a877+bfq0IxcvIoT68uS7VuKaE9+UK4n8GLhuXbwcCZCMb/+wahSFAHxG85sg6o2GsIkAYKsoKSeNXXaNOPJMBGpV0HDQ4oIyLFD2SqXh+QjTxgGoiFEQaTIFfiON7ir2PCSHHsfp7TiNvVqC2wd8dn5u3kHzR8HNjt8QcwG/AQhuJfLHowzAdrGRiUu6jhvJzbP6kKYwNqs51DiGDYNe5VsI29RMagG/pL145aDSSwxXrpCDyKvJH0uUa9xhgXwxkhkjGvslSCFEj98QL0bTQ9g6nRPvGcTgRod3mq2eQs29lTGonc4wx2qby7F5Y7l6QFxDuhX0VrNenSYeemDphGHFfQ1CvXbNLXmsNOPOyxXSbfPZ2l/oKmFK8A7YgvaNcuO4XsJLh/yWufx+HCXE2KCF0zki5kFy+pn6n4gd1m/MGrJGGzY49QxcKAY+oKTzv2mq/PVCFsG0SamcySaP0/YhICLnjLy2ZSMLKYr0LAFJc/qRSmyzli4LylNbb3lw2In05ahffd8fMWgKeaa3qSD6LE60IVQM1aGk24S5xlhFoxPomRyXW+xkBXIPOGAAl1fNCMZotldIfRyHxlAT0Bw5vtqntJPk5L2IiUWSogilb9by66qYP3GUy3YYCTCzZZV5ooU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(6486002)(26005)(31696002)(8936002)(16526019)(186003)(83380400001)(956004)(2616005)(53546011)(31686004)(86362001)(36756003)(8676002)(66946007)(54906003)(16576012)(316002)(478600001)(5660300002)(38100700002)(66556008)(66476007)(4326008)(6666004)(6916009)(4001150100001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVV4ZytONnhLdEV3WjdneUxjcGZoT2ZIMjhxZFFkVGd1OHFGU2Nod1N2MUc0?=
 =?utf-8?B?dE1YMVBNNnpsYUlDelE3UTVFT0ZSM1FIZ0wxMGFCaUpRYUlNQVNHY0FtZCs5?=
 =?utf-8?B?OHcxcm5YZHlsNEtuYkxsdnBuNnFyY3M4Z0N4UUlSTFgvbmRjTGRydzduRktR?=
 =?utf-8?B?Z1VMcGhLcnFVeUZLbWRmY3p2eHJaZU40bFJvS0crdUFxUjJ2UWNJRzE5RUFM?=
 =?utf-8?B?ZUd6N3lOSzdwc1VoL2dLM3dGNmR5clpNOVJYU1liTFhZUVhQWGpTdlozMlFT?=
 =?utf-8?B?NjQzem9RM0tudWwzNVNEZnFibGJTTEhnc1NOak8xNUVGZHo2OGkvZWdxMHRD?=
 =?utf-8?B?QVJWbkQyYlNkSk10Q0xZRHlUVUlnazE5YWw4ZTRUM3dyTktXS1daNDR6SVN2?=
 =?utf-8?B?cVdEckVBRXJOQjNtbFJqczFTazZMbFRLR2VsWWlCK3ZveFQvSlZtTm9BZEJT?=
 =?utf-8?B?VmRVd3ZuM0hFcEs3VWEvdXUrRzkzYXA1UDBIanRWZEo0Vzh4cFBlWlBQelds?=
 =?utf-8?B?b2VFTlFOQkFqWFRSRGlHTEt1S0RxTVk2RW9Ebi8xQ0Uyc0VxMVd0S1ZzMWZn?=
 =?utf-8?B?VDlVdmxFbDlTWnlXa0JicWtFT1dhbm9CNXpoMHA4L0YyVGR4YldJVFJDYmNl?=
 =?utf-8?B?WDRKSnQ0bTFvdnZ4b0Y3Tm1TVHdDUGYvRmVHRWpLTWhrQlduUkluSTNQZjVD?=
 =?utf-8?B?dW5zUlVuN2ZVMm1Td0pSWGFTb21ZNmFGbTFtT2Vyd0QrL083K2FWNFZkeENs?=
 =?utf-8?B?Q2VzdVllNjNLWFgxOFltTWFQNkZZek9EdVUrNmRTeWpHYnd5M3pySkZJVWhw?=
 =?utf-8?B?K2pMaXZlQlh3VlYxUnAwN3NBM1pIY01jdkhyMjEyS3RJeUdENlZTNDhxN3RG?=
 =?utf-8?B?UWI1SlcxeHQ0OUtnZjF0NEM0MnVkcWFTTXE1K2g2RUYxMUE4OENXckZnSmVZ?=
 =?utf-8?B?SWlsbE1hQnVLVW9lTEtjaXBEMCtGL04vNG9ra0JmbjBjMXBGaXQyWEhLdGZj?=
 =?utf-8?B?RFpNM1d0YVpTL0x5cGZUdloxRjNUZElSSnBxT2NNM2EzbkNGSlpGQ2V6U0hL?=
 =?utf-8?B?NXBpMURxdHh6d2MxSXZLZmcrVVZqN1o2dk9XUXBpSlpzYzB3eHUvdnhuVWNH?=
 =?utf-8?B?Q3RVRWFDYVZ0UzRJNFJXZEFQcWJ3YXdmTWYrZ1ViZkFWbFJsTG52djlXL2dB?=
 =?utf-8?B?Qnk4ZXg4aG1ManVJOXV0amhCNlVyZytTRFo0cGh0czUrZFJFaGZqS3dpdGNP?=
 =?utf-8?B?bEVlSDFVTGJSS1FyMnhmSFdZdU1qazJuaUZQblVHSFRxb2JNcytyR0oxT1Vt?=
 =?utf-8?B?ODdUNVpjYS82Y250TUVNa0toUEhiaHduWDZ6ZEMzUitwQzZPdTdSN2ZibkZ1?=
 =?utf-8?B?Z2hBVGVnakhmaDU5cklzdmtCM1dVNkhSNVB5TVNtNGZRMHorazVTUitGQkpI?=
 =?utf-8?B?UFRhN3gzN2ovQStUaVIwb29Zemh3S1BPRDR1MVJLbjRSL2dWUEVWNVhkZW5Q?=
 =?utf-8?B?NHExd0xaSnJOL2tHLzU4NjVOd04yY2tVUElkSlg3VHJKMjdPNlpmY2xpWS9Y?=
 =?utf-8?B?clZYazA4UUJCMzJzT0ljb1ZoaXpxNW9CMFVYWFAvbEVCWUR3MDF0NDh6UVlx?=
 =?utf-8?B?Nkl3ZWYrOWlrQjQwQi96ajcxbzRnMGZZNU9VcU1JUmkvUGNNS0htc1pKUjlx?=
 =?utf-8?B?ZlltZUFyQ2hsNEtKaUlOeGMyeW1ibnNrRjZxSkdwSGh2clBRREkxWUJlcUhk?=
 =?utf-8?Q?OsrSwZ9uG2HzghFmAaFZ4rvJFmmSWOCOUbHASYc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e763b231-f892-4e45-0f39-08d93fb4fa07
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 13:01:17.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6ypNaPCDtgUnGCpskAcmRkh0AXw/r3Ot3j8htSfLdyjtEHeUPPygCr7ZFv7vyqtY2V1J/1JTivaXOuTQPOCS/NpGsqACSKPaNN0Psl5W7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5079
X-OriginatorOrg: citrix.com

On 05/07/2021 12:27, Olaf Hering wrote:
> Am Mon, 5 Jul 2021 11:44:30 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>>> This patch is just prepartion, subsequent changes will populate the arr=
ays.
>>>
>>> Once all changes are applied, migration of a busy HVM domU changes like=
 that:
>>>
>>> Without this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a2=
0963b3 xen_testing):
>>> 2020-10-29 10:23:10.711+0000: xc: show_transfer_rate: 23663128 bytes + =
2879563 pages in 55.324905335 sec, 203 MiB/sec: Internal error
>>> 2020-10-29 10:23:35.115+0000: xc: show_transfer_rate: 16829632 bytes + =
2097552 pages in 24.401179720 sec, 335 MiB/sec: Internal error
>>> 2020-10-29 10:23:59.436+0000: xc: show_transfer_rate: 16829032 bytes + =
2097478 pages in 24.319025928 sec, 336 MiB/sec: Internal error
>>> 2020-10-29 10:24:23.844+0000: xc: show_transfer_rate: 16829024 bytes + =
2097477 pages in 24.406992500 sec, 335 MiB/sec: Internal error
>>> 2020-10-29 10:24:48.292+0000: xc: show_transfer_rate: 16828912 bytes + =
2097463 pages in 24.446489027 sec, 335 MiB/sec: Internal error
>>> 2020-10-29 10:25:01.816+0000: xc: show_transfer_rate: 16836080 bytes + =
2098356 pages in 13.447091818 sec, 609 MiB/sec: Internal error
>>>
>>> With this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a2096=
3b3 xen_unstable):
>>> 2020-10-28 21:26:05.074+0000: xc: show_transfer_rate: 23663128 bytes + =
2879563 pages in 52.564054368 sec, 213 MiB/sec: Internal error
>>> 2020-10-28 21:26:23.527+0000: xc: show_transfer_rate: 16830040 bytes + =
2097603 pages in 18.450592015 sec, 444 MiB/sec: Internal error
>>> 2020-10-28 21:26:41.926+0000: xc: show_transfer_rate: 16830944 bytes + =
2097717 pages in 18.397862306 sec, 445 MiB/sec: Internal error
>>> 2020-10-28 21:27:00.339+0000: xc: show_transfer_rate: 16829176 bytes + =
2097498 pages in 18.411973339 sec, 445 MiB/sec: Internal error
>>> 2020-10-28 21:27:18.643+0000: xc: show_transfer_rate: 16828592 bytes + =
2097425 pages in 18.303326695 sec, 447 MiB/sec: Internal error
>>> 2020-10-28 21:27:26.289+0000: xc: show_transfer_rate: 16835952 bytes + =
2098342 pages in 7.579846749 sec, 1081 MiB/sec: Internal error =20
>> These are good numbers, and clearly show that there is some value here,
>> but shouldn't they be in the series header?=C2=A0 They're not terribly
>> relevant to this patch specifically.
> The cover letter is unfortunately not under version control.
> Perhaps there are ways with git notes, I never use it.

In the end, we'll want some kind of note in the changelog, but that
wants to be a single line.=C2=A0 Its probably fine to say "Improve migratio=
n
performance.=C2=A0 25% better bandwidth when NIC link speed is the
bottleneck, due to optimising the data handling logic."

>> Also, while I can believe that the first sample is slower than the later
>> ones (in particular, during the first round, we've got to deal with the
>> non-RAM regions too and therefore spend more time making hypercalls),
>> I'm not sure I believe the final sample.=C2=A0 Given the byte/page count=
, the
>> substantially smaller elapsed time looks suspicious.
> The first one is slower because it has to wait for the receiver to alloca=
te pages.
> But maybe as you said there are other aspects as well.
> The last one is always way faster because apparently map/unmap is less co=
stly with a stopped guest.

That's suspicious.=C2=A0 If true, we've got some very wonky behaviour in th=
e
hypervisor...

> Right now the code may reach up to 15Gbit/s. The next step is to map the =
domU just once to reach wirespeed.

We can in principle do that in 64bit toolstacks, for HVM guests.=C2=A0 But
not usefully until we've fixed the fact that Xen has no idea what the
guest physmap is supposed to look like.

At the moment, the current scheme is a little more resilient to bugs
caused by the guest attempting to balloon during the live phase.

Another area to improve, which can be started now, is to avoid bounce
buffering hypercall data.=C2=A0 Now that we have /dev/xen/hypercall which y=
ou
can mmap() regular kernel pages from, what we want is a simple memory
allocator which we can allocate permanent hypercall buffers from, rather
than the internals of every xc_*() hypercall wrapper bouncing the data
in (potentially) both directions.

>
>> Are these observations with an otherwise idle dom0?
> Yes. Idle dom0 and a domU busy with touching its memory.
>
> Unfortunately, I'm not able to prove the reported gain with the systems I=
 have today.
> I'm waiting for preparation of different hardware, right now I have only =
a pair of CoyotePass and WilsonCity.
>
> I'm sure there were NUMA effects involved. Last years libvirt was unable =
to properly pin vcpus. If I pin all the involved memory to node#0 there is =
some jitter in the logged numbers, but no obvious improvement. The fist ite=
ration is slightly faster, but that is it.

Oh - so the speedup might not be from reduced data handling?

Avoiding unnecessary data copies is clearly going to improve things,
even if it isn't 25%.

~Andrew


