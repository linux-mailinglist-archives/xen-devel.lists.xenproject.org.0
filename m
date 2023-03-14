Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CFB6B8FC2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 11:24:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509529.785428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1pA-0004Sy-MS; Tue, 14 Mar 2023 10:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509529.785428; Tue, 14 Mar 2023 10:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1pA-0004RB-JB; Tue, 14 Mar 2023 10:24:08 +0000
Received: by outflank-mailman (input) for mailman id 509529;
 Tue, 14 Mar 2023 10:24:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc1p9-0004R5-DF
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 10:24:07 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe12::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59377a7c-c252-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 11:24:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7459.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 10:24:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 10:24:03 +0000
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
X-Inumbo-ID: 59377a7c-c252-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPFUjAJ60128J3z+vn1quKTnwHaQwJoWMUKzzYW/hQ54U5ihLr5IVw6GBzQ/69ySy25iEehbSi2YHWXdYTmffockVTSFc6cynyjuIlJErLUQzMMVizZkKZUI9ykvTl8o7yVnFeNNpMgGmHBXi7i/5dGH4MhD1r0HyNy67RrB3C15Jk579n6Qm/yJKDgrGq6JhXCBgrbsNaIzyDf2QDlr6+fvRlftY3DzRccp6mws0GTaAihIjhnJe17LoCkDloR6tznq0x4QI0Sm3xH3OJ04eRq5iASgn6/mNmA6LjNDbZO5PfXkRxTWPDPS9hvSv61/XnE8OkcnbsAWlWWdChDl6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLW2zZo5GIRGKruWB5MfIxCT1Yidsz6qbWeXC5kzOG4=;
 b=GFsNsY0bQ1bScDwQHh5rbrifX6PAo83anseM5M2TPHibMQoHW8svpNxn3axQ5JBK1VxOPb248ln4zb/z4Iytk1MmtJ345pMdzHpfeg5gfPF27MF5Hg5aDoItMqgtNOdA4b4d2Q2FnMPt8F3fcqu0UTcp4Fo0J5pP3x2SIkmrR1KGdHZKyA6qkS2s1/XMjaRH93ZBEdD0M/C+PBao2whgX0N3RfcP1hNEMQsWeRgfgz3IlpciLDMJwNaOGB7dBh/V/ZAaT3Lo6tTktj7SzgwNmLLvGlkN1xqCfoe5knyitr//yvfWXumcJM2SC3t4KDcT9b8kRQIhOhEBeip/4+5i5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLW2zZo5GIRGKruWB5MfIxCT1Yidsz6qbWeXC5kzOG4=;
 b=frJfMiI7Aw4L+VCUMptNeF9iGaWviqHwadrb9rMdQr58yOpT9PGChNyX7cvkmMrhulNhxt832Bik4WGmyvCPR/BfeX6y2tLnnaPbQjjAWdGxkNpQx5GCGwHNC6JoZ+RDHo4fnNNYw1C+OpXUSjV6Bl2Fg0kFpd9Rrg/lgTBMVwYIWb/2Xux5rduqSfTtKfLm5ekEV4qn6k/9DLM4kcz0qCylAg8OiVaxJKr+6liQXk6lZDrhNoronO0hYR5pOarODfjg/7IWV/nSNdWkUVEntploIDUIRN2ncmfeRR5VX+x6s5hLX9U/kdHhQyG4rcpMulyT9PrEMQ2+OarU29LWXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3242c56a-7a95-4fe3-3195-bf25738da351@suse.com>
Date: Tue, 14 Mar 2023 11:24:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] IOMMU/VT-d: Fix iommu=no-igfx if the IOMMU scope
 contains phantom device
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "Marczykowski, Marek" <marmarek@invisiblethingslab.com>
References: <20230314013221.124930-1-marmarek@invisiblethingslab.com>
 <BN9PR11MB5276832A2E3F31FB7695D0098CBE9@BN9PR11MB5276.namprd11.prod.outlook.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN9PR11MB5276832A2E3F31FB7695D0098CBE9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: e18d46b5-d332-4f10-ee2c-08db24763c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TjB+Y3lGqm2iVuIsaRMWH0vXNTZNjtvomrW3UxTkhU6u0Bybsgo6yv4C7+Vgt61VoR6xnJuExvZmcxmTLz7dLPno1CqXM5AZX+a1uNXsWPLKdmHN8ytSlSWv6+DsjKpIbq0IroPD/6M917Zo50ti/6NSBRucidR/xXsVSry/JSWZw//uuLZC0dW6YZfWSYaOKxRQ6e+8nREyLLkiU0kqffneiDz4EENzy7XHbo9D51/sjeEdBg/zCwM7aXFy+xdAJ6hztVkVok0cuIa8/T5BSfxnWX8TUk4NAS/znpeRRrQVhGoUprUlpuwB1Uvm/finwjl8/E/AIy6SZTQ4kfQYvbN+tNEhwwJt3cw0HV5m91wblU7fv7/sICXxJzUr87H9pNm17dhDhqUQsCnIRaaaCoLwWkU0O16jNkgfY7oXG8e4ABKGFSNpTh+6+eP2lvAlKGy6pmP9K/hZg91lctAsKxCivQ0LJFkhSx8GRrJuZrzZ914YJA0EwYZeXmHs0Y5cOUdQImsvcjMEm5HGm4AccKMxn7XMZGNWtt9A3WZiBX/D4PC059nuWFoAYC+Jqe5KAAAcU5nwyKUYhiFNBA97alNUBQgWq6pt83Qfv1sHpy/EUs2H+FypGkHdSN4aKt7Lxq9FBlcCwjWpQ/rD4IGb4aJdIjq0cSfbegtdNpxwV6lt+RuygX0QHiAdctBjiEiGxpFKRvTpOYsAUExGxHGu1tfWIDcLOp8Q/x1FIhW8kKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199018)(2906002)(31686004)(6486002)(6506007)(26005)(6512007)(36756003)(5660300002)(2616005)(53546011)(316002)(186003)(86362001)(8936002)(41300700001)(31696002)(66556008)(66476007)(8676002)(66946007)(38100700002)(478600001)(4326008)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTFsWEFjOWduSW9FclZyN3hsbFlHT0IvejF3T1YrSjZ2QjRlK1VjV2R2eVFM?=
 =?utf-8?B?SE92bS9iZUVuTm5KeXNCdW8wekFhWFZVZEdveXNXY1duOWFPYkl4RXZwVTFz?=
 =?utf-8?B?dHNNREdNN1dmckJHTnVBc2VJby82UDQva3dRM2ZhQ1VtU0J3TUZpc24zdGRX?=
 =?utf-8?B?RlhibmM4S3hvQzJ4MTdya0hYZjhWdFArMDBKekkrc0o5ZTJydEFLUTEzVDRh?=
 =?utf-8?B?SGFGN28rWnRET1VMSmxMNDMvdGpIZ2lkaXZUdnZMTW53OE1odWVhWWVURFY2?=
 =?utf-8?B?TjlNVmQ5aGFoZlB2RHNYZldQdEFzTmdPdkF1NTNwdThoNlQwcHJDVE5uSXN1?=
 =?utf-8?B?Y3E0ZlRSVjFFREIyckNjUHg3YkxYU01xbkpydTAxZHhaVjdNWU5SbmlhY1Rt?=
 =?utf-8?B?Z2o3cTluOFYrdDB2YWkwbXdtdHo4YXlRaDlKdmVVdzJKejJ0ekZMdm9pVU5C?=
 =?utf-8?B?UGtrT3hJb3VnV0d3VVIzaVNzRmkzb2NocC9FbjBnbmdlTHBlZWl3UEE4Nmh5?=
 =?utf-8?B?M3JPVVEzbjNOOE9abDZCSnVETTMyL0pQQ25HbG00MnB4eHIreDA4K0E2Njgr?=
 =?utf-8?B?Wk9DUHo1N29BM2Qzc0FiNXNsNXRnMW8vU1R5KzNvTlFNbWJYZG9EWUpsQXVm?=
 =?utf-8?B?SVdDa3ZDWVJSOTNwMXgwbk9OTFNmc0I5T3padkN2cisxTEJKaDVKYVJzNCtD?=
 =?utf-8?B?KzNVZDg1bndoN1dHODR3QTBJTVBWTklPNkZFUVlrb01ZOUZKdFZaKzdQSitI?=
 =?utf-8?B?THRGazhpNi9hUGY2TUN2TzYwZ00xK3hHaTVzQnpEdXRTOTZGTGVqZ2VsN1N2?=
 =?utf-8?B?anBzekdOK2FsRlM4UnNYQjY3aHNwb1dQS2F0aW1Fb2hvNmVsc3JaN3FTaDF6?=
 =?utf-8?B?c0tsNExId1NsZlFldW1VZ3UrVmMxOURiT1BvcDBBUElDclc1L3pwbWg2Q3Ew?=
 =?utf-8?B?eWJ6SjNYNUdlSFUwWUJPNjZXZmtLQlFRYXZVVmpOS3BYYmFZejdyRFJiR0lV?=
 =?utf-8?B?UjFiR29hZEJEeGkxMnRSQllXM3ZIM0pjSlI0aVNJbHpMR0h0TzFFTnB6QjFz?=
 =?utf-8?B?Y05sTUVRcmVNeWhvZUZGL0dBSHA4aGxNMWsweWMwenhxdnA5OGNtWUZpc0ln?=
 =?utf-8?B?K28yRVY2VnVtK29nRTkrT0srUE9iVnNDcVVCaHlQU1U3VDRRT3did1NNUjh5?=
 =?utf-8?B?cXJFVjlxaVAxbTdQTmQwRUZnejNjdG1ncFNHbXl6N3VGcVBNSmI5aFpyOHNS?=
 =?utf-8?B?SVAyb3IrRHVyQWhWcG4wVnF5US9xMlRwVE1sRXY1Mk5tcWoycWpSZmc4dHJp?=
 =?utf-8?B?bFhHWVpsM1dNbFlrWGdmTUQvWThUOURldUpXUGhsczJ5WUZwV3lNR1FsLzJY?=
 =?utf-8?B?eEhTK1k0Y0JOMzJpMnc5NU5VVGlCK2hid1NNSElQSkFWRmFXUGdNaGR3Zi9V?=
 =?utf-8?B?RHVqaTFDazBNWnlhR2xSdElqallnV2lhcmlQQUsrVTA5bGVISkpBeGcrZERX?=
 =?utf-8?B?dU1TbGhteCs5WHd3YStLaHB6NTFsZlMrWEw3RXVrMHRJejNRdXVLSDJlTmdx?=
 =?utf-8?B?aUVZRGMrSTBGYlJaYmVidGJ4NisyOG9WN0NLbWlodXJwd1ZxNk84cWk2L2Jo?=
 =?utf-8?B?b1ExOHhpQmVLdmpFd1JqVDBjY0xUYWpla0dBb3dtUjRib3pBaVZNUFA4TzRp?=
 =?utf-8?B?cmREWVdLbyt0Y3pJSzlwT0gxQmRBWGtPOTZPWHdjaDRRakwvZ3pSMjgvSVoz?=
 =?utf-8?B?RENNOThudjc3ZVhRMmZOV3I2c3Y0b0NpcS9wV2lUTDBoRS9kVUxPVm53cUsv?=
 =?utf-8?B?REIwNU5Eeml3M0pDNU5EZlZsVlk0ZVdUeWpBR1gzT3VSL0cyRGd5Y3AwZ0RY?=
 =?utf-8?B?ZXpNT1RCREd1dHcyZ245cmlpcENUZWRBazZqQ0tjTUVCYUozQU9IeWZqQ1ZQ?=
 =?utf-8?B?QjA3T21qTHBvbzBMRGkzaVJONmxQSjRKRCt5VVMxSVVYMEFGOXhLeTZXZ0hq?=
 =?utf-8?B?eHJsNzFHTHl0YjR6NUEwZk1zZGRtTHMrUUpVenFtSEpMTjNYaERuMWlQT0hW?=
 =?utf-8?B?M05VM1VlSmg2TDVLZVZmUUYwcmpMRjVvSWdZWmRxOVNrd1JpNmRWRUswR3F0?=
 =?utf-8?Q?Lh4+ir2UoC6AEYRt9lTtZs60O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18d46b5-d332-4f10-ee2c-08db24763c33
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 10:24:03.9084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9tnGlJdiAOnH9nT3yDOsEmaKFjiBax3A0unSWfg2D/ra+9nCCt87i/YSSpL9K3tYP6G9nhUwM4vnGZhybnNHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7459

On 14.03.2023 02:50, Tian, Kevin wrote:
>> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Sent: Tuesday, March 14, 2023 9:32 AM
>>
>> If the scope for IGD's IOMMU contains additional device that doesn't
>> actually exist, iommu=no-igfx would not disable that IOMMU. In this
>> particular case (Thinkpad x230) it included
>> 00:02.1, but there is no such device on this platform.
>> Consider only existing devices for "gfx only" check.
>>
>> Fixes: 2d7f191b392e ("VT-d: generalize and correct "iommu=no-igfx"
>> handling")
>> Signed-off-by: Marek Marczykowski-Górecki
>> <marmarek@invisiblethingslab.com>
> 
> this should be rebased on top of Jan's patch.

Right - I guess I could take care of that while applying. But I wonder
whether the description wouldn't then want adjusting some as well. Or
wait, with the v2 change it should actually have been adjusted already,
as the igd_drhd_address determination is now (intentionally) also
affected.

Jan

> Reviewed-by: Kevin Tian <kevin.tian@intel.com>


