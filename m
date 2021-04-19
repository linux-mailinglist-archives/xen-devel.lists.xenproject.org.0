Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D75B364147
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 14:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112869.215199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYSia-0003NR-M1; Mon, 19 Apr 2021 12:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112869.215199; Mon, 19 Apr 2021 12:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYSia-0003N2-Iq; Mon, 19 Apr 2021 12:09:32 +0000
Received: by outflank-mailman (input) for mailman id 112869;
 Mon, 19 Apr 2021 12:09:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2xPN=JQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYSiZ-0003Mx-9F
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 12:09:31 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5dcc46a7-e688-43c1-99fb-7c969fd83997;
 Mon, 19 Apr 2021 12:09:29 +0000 (UTC)
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
X-Inumbo-ID: 5dcc46a7-e688-43c1-99fb-7c969fd83997
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618834169;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IfOMr70CGHdVMioh/jkGgS4BbYoZNQybDqZZOe2QBeU=;
  b=F62DAVpJbgh0ANxl3pB1TVzQJ/3PV27W1KSJY/uFv9Y+z9MSrLXEplff
   GjSf5QkqwhRnAkUMjRYg3G5v5H2+TkUkJQlpjd1NsiqIVixLcfcBlyIcn
   cvz/ZpiIhlCQY1nh0MoWp91HYI44rm8wxddQJqiSO80eh3cHULCBaRLsk
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dJRFgUpiOrHc7pkAH2pxkEMzbjZDjSQdOoeT53QwC6CVAgSw26WGactIQ+fZ7/es9aPWvbz410
 kOmKnmVaEwEOpD27+gf1bu77K5/9A9HwlDAnbJ+noVC7ETBtL9akVt+knSUs0lfvvm/4QfErRE
 km/pTMFGMhZr0H/zm/KUzkeIf/ZvCTj5Y/fDEmr5mlwuFLsu9XDORZx5p2A+1sADS6x/6E8zCw
 LNrV4FA6UG/5ZgR5wLETdu6caAxdyaiNaMgMV0tuophHSlRlicaalz85hSLMKemS2wuIe8fFs9
 WTc=
X-SBRS: 5.2
X-MesageID: 41881256
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yzhXWK4jq++D5NABSAPXwXiEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbTqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH76GL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnk4j41VTRTzbA+tV
 XUigCR3NTZj9iX6D/5k1XS4ZNfhcf7xrJ4avCkp8AJJlzX+2SVTat7XbnqhkFRnMiO7xIQnM
 DIs1McOa1Img/sV0WUhTeo5AX6yjYp7BbZuC+lqF/uu9bwSj5/K+cpv/MhTjLj50AtvM5x3c
 twtgrz3fonbmKzoA3H69fFTB1snEavyEBS6dI7tHBDTZAYLIZYsI13xjIlLL47ACn45Io7ed
 Meav302fA+SyL/U1np+kNrwNCqQ00pGAaHTkUoqqWuokZrtUE84E0CyMMFmHAcsLo7Vplf/u
 zBdp9ljbdUU6YtHO5ALdZEZfHyJn3GQBrKPm7XCVP7FJsfM3aIj5Ls+r066MyjZZRg9up8pL
 3xFHdj8UIicUPnDsODmLdR9ArWfWm7VTPxjulD+plQoNTHNfrWGBzGbGprv9qrov0ZDMGece
 20IohqD/jqKnarMZpV3jf5R4JZJRAlIYwok+d+f2jLjtPAK4XsuOCeWu3UPqDRHTEtXX66LW
 AEWBT1OcVc/mGmUnL1m3HqKjHQU3262ag1PLnR/uAVxoRIHJZLqBIphVOw4dzOCTAqiN1yQG
 JOZJfc1o+rr2i/+mjFq09zPABGM0pT6LL8F1dDpQoANVLIYa8O0u/vPVx67T+iHFtSXsnWGA
 lQqxBc4qSsNaGdwigkFpaBPn+FiWAQ4FaHVY0VlKHGxcqNQOJ3Mr8WHIhKUSnbHR18nghn7E
 1ZbhUfe0PZHjTyzYO/jJIVA+nbX8JmgBiiJPNVrX63jzTemegfAl8gGxK+W8+ehggjAxBOgE
 dqzqMZiL2c3Qq0JXAHm+Q+Ol1UYGGxCLZLZT71I7l8q/TOQkVdXG2KjTuVh1UWdnDx/0sfvG
 DnMBaZYOrGGFZbp3Be3Jv76V8cTBTvQ2tALlRB9aFtH2XPvXh+ldWGYae+yEO9QFoPyON1Ck
 CPXRIiZidVg/yn3h+cnziPUUg8zpI1J+rHEfAIaLfIwE6gL4WOiIALF/JZ54xeKdjrq+MHON
 jvPTO9HXfdMacEygaVrnEqNG1Is3Eii+rvwwCgw26i3nIzaMCiVmhOdvU+GZW74GflTfrTj8
 k8otIxoOeqMmL+LvSB0rraajZfKhXV5U66JttY3ax8jOYXjv9UGZKebB7jkFdg9z86JN3vlE
 wfTL9giYqxcrNHTog3QWZh4lEtlN6zN0MlvQz9P/8mcTgW/grmFuLMx4CNlKEmDUKArjbhIF
 Wz8yVS+PHeQiuIvIRqfJ4YECBzaEIm7m5l8/7HX4rMCB+yf+UrxivxDlaNNJtcQrOCA7Mes1
 JT5MyJhfaec27d1BrLtTV2ZoJI/GDPe7L+PCu8XcpJ+ce9I1KCn++D59Oyli7+TX+DUHsj7L
 c1PHA4X4BkkTktjIo+zyi0ROjWmyse4iRjyAAisEXs1Iig6HrcBmdcP2Ti88xrYQU=
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="41881256"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fmu/aOPB15x2Ibj37jBhamj0jD4F0dYtiTD2146J7u8PTKH+A4UwwG6MhSTLSZNlgkIVvj6WxkKTChkz/aXQScwI20QR8VtkfEl43KB8dzkL01ojJfNeXdmrGwuGOoaScqNyneFiHB35013G3gVpxTfflaxLhvrt2gFXK8cD0edAj8UkdU2pvIkrYifsLI6yBII7NDZAdmIcutiyDVCgaojJ6ngb00iwVr01p9LcnHvBM0dA1RI7AnNk/s1fAVhzGYPiqLRFaZDMYM/7IVhaGch0llfY+Nc8aj7OfYl7zBHJLOkDwhXI9HDdf/K3xTS+g+ipH3jsT6f6NOqXuU3z1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFrDvQtT16meA9IXm631mZxvxWqIJj2tLdTG0EEf+48=;
 b=hltnYRqiXDrMLmInIgYMmkyhmH70S5IVYkIFX7yj9xk6pkm/s7b7QwGhkLBCeY2xzigcl5W/3XD+HfMEg4NwzDgW2VW9zIiOOBUfOkRmS78bXJuG/bGUKUIoewos1QhTWD7jiO2Do3WVlyyqqeDpuxWKqCo6tjTmu73vuQsha/q5tVZ5rtWE5JATUmM52RU+0z8JTa6Nyv8ZtZI2yhzchA6QQljpa4pI4Y6apMsecr2iY8jhncvgyNNqSRoLtDyVWDufQ+z6UlfgzTwDW2lizAYML6YP7+9K5ULMSm5gUlpQ4C9yr3r9/R4abFDINJ1ZhNnupq7jZqDLFUppFnHJMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFrDvQtT16meA9IXm631mZxvxWqIJj2tLdTG0EEf+48=;
 b=dKyH5iN3r6BaS1CCfC4ZtEp7F85xzA3KUqO/odKeVt0oJg2uJY0FU37yFVLPjAIYOz+PumwbJwS0A0n8yR21vJmoYPek7wXMy5VYiy59kqjFt43EPOkZd7rPv3aLe9bem2BmnDYD+2GXqFK39g2rRGt7SCrzGuZrLA+QcO40ga4=
Date: Mon, 19 Apr 2021 14:09:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3] x86/CPUID: shrink max_{,sub}leaf fields according to
 actual leaf contents
Message-ID: <YH1y7pFbtz/aWMJ2@Air-de-Roger>
References: <9ecd03b2-f8fa-2a8b-69ad-4b31920ea205@suse.com>
 <YH1KZhLrC6anI/Hm@Air-de-Roger>
 <1612e2ac-87ad-4f7f-aaed-05486365b9dc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1612e2ac-87ad-4f7f-aaed-05486365b9dc@suse.com>
X-ClientProxiedBy: MR2P264CA0035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::23)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f39bcf40-6f10-4b43-a480-08d9032bf917
X-MS-TrafficTypeDiagnostic: DM6PR03MB4220:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB42207D8850F0287AD7D095AA8F499@DM6PR03MB4220.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x9h3/43+0RK7QLPqWKZbKQtZ4xpJXsHV1XwyB4Viheq2QuzWAsahjYkKBzzculZvt1wCl16eZGdAiJ/L4Vmm3KZfoyR2FtVOEWcUdLkVGAPp/Vt0SELqoQFnNf17WSIS4kHZqHr0bGos9z9u1KFlZBvMrScjhN87NGih/vb0nelCQkPcDeuHIAG6cUXFRU946jC2kA9m1Ej8L9Cnda3MzsHBOCIDKLCAKGPie37H1CcshqiVWPVegFiT69sxXMUehVLBBwbDGlm1RmorsApRAq+z4ONBkQB+oaL1BF7petn5hoCoywSS+ejd9gd1HiveWkCPDsakYBy7NKXINNdZ6G8txzSSbObmlkuvcU5fGSLLKhCmG94HUPFEpA4q9fZ9hTNMV6WG86nwK8kByM+O1uVE4/PmqdBU+V/m3zdfv9Duyay3VsCctZvQ12Ic+metaaC7aA2IWS8MC7mWC9D7+JNdY21xfw+HJSY+J4n9zCrwk7nH87JYuXRpLXZ6hWl2ufrVOICkEwwf9ddIpdG+oAVeU39FeU45Dm/D0zFDPbR6E5NinoC8Va9PIELr3FvtrgMhnSeZ6ZW/c8MDDzDZf8VoJoRncSj50J6v6cZc6+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(6666004)(33716001)(8936002)(54906003)(5660300002)(316002)(9686003)(8676002)(6486002)(85182001)(6916009)(6496006)(956004)(86362001)(66556008)(66476007)(53546011)(4326008)(83380400001)(38100700002)(16526019)(66946007)(186003)(2906002)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UGU3Wk1wT2JXWDNkbm03djFQSFJWSjFPSy9lbG8zSDdNektWVlUxLzdHbHBh?=
 =?utf-8?B?WDUzeS9teGFrSlJwczQ2aWZ4SC9Qd3RHVEdmL0t6akM2SzEwanZqem5QSGpB?=
 =?utf-8?B?dUwzNllNTm5HaU1aOHE1bE5WcEZnWU1veEZibDJYWjV1TjdCYzA0cFFvZ3Y5?=
 =?utf-8?B?K0FRcmQ2N1pkeXU3bEJXbjcwSFE5S3Z2eFdzUlNYS09NdlFoaTA4ekdQbWRY?=
 =?utf-8?B?S09sMnc2UnRSSnFuNGlhUHNZSUdMdUVDY1Fld1NIWGVMQmw0eE9EMDIzL3Vh?=
 =?utf-8?B?V3ppQ3RTR3F3NjA0QXJvNmorZEczbUF1TjJuWHYzSFJyS0tLSHNJWkl4Vitr?=
 =?utf-8?B?V04zNGx2WW9CMGVldDZnanBBTW42eXBCbWlFaFZjSEsvZVhseEdZbGtiNEJ5?=
 =?utf-8?B?NWM3UEltdUpRNmNldXlQNE5lbStGMkZYMmZyUmdMSUFKZDQwWFVJdGxzRzdB?=
 =?utf-8?B?aHFVelRhaHh4U0pPU1UyVE12Qmg1NFRtdzhCbW9lK2hGSFpzYWpFWDdYQ1Jw?=
 =?utf-8?B?Wjc5c2R2aE1abU05TXVlVWhFbk5XdE10Z1NBM0xKQVc2ZmdkeHMzam5mYS9C?=
 =?utf-8?B?dU5ZRklrSUdLTm1xV1VDUWFxVWsyWEZuajVRdndNWU5GaTRKanVlZk9VVjJI?=
 =?utf-8?B?aUJEUXZPRy9Wazdoc0ZIQjdlT0xyRlBwWmZkN25ZTkpCWHJBZnlrOHIrYlAw?=
 =?utf-8?B?bnl2TU00S1MySGQ0RUVSRHpPRU45a0FsQitCS2ROOUJCaWt4ZkVrRjhhbGtR?=
 =?utf-8?B?aDI1V3ZQVGI4bkpLd2Q3N1Y1QklkdzR5QWw2QjlnWDA1UFBWU1ZCdURPcG5j?=
 =?utf-8?B?M2NUZDVDWDlQUTVjU1U4a2dPeGJVRTlGV1lNVVUyU1hrQ1RoQy9xc3dRalNk?=
 =?utf-8?B?cXBETHJ3Qkx2blI4bk5SMDMvczJucElyS3A4bVFSL2JwQ0h1SUVCTWVaa0d0?=
 =?utf-8?B?Rk95TlEzNU8rVVRudi9kTVNWMjhOV2RrNG1OYWUvVk94cmcxMGQvU0NNblo2?=
 =?utf-8?B?bmRBaWV6d3lPVWthRGRJVWo3VWR1UzA4TUpYMHArTGZQbm5obVBVemFuWWZK?=
 =?utf-8?B?UjhHNTJONjJGbUZoWHMya0wyMnpYbWdrNUdxbzdIaFlieGpZTXRZdWpLVEFN?=
 =?utf-8?B?bnJ4dFdCNnRzeFZNb0szVzZUSFJlL2t3MU1ibVFNa0RxOTZPOFdjOXFLdEFR?=
 =?utf-8?B?cVRWS1U2U1RsNmtDd2puL1p4SEp3Si8rV05sVDVIeEFUME5SUmFxMlBRVWpY?=
 =?utf-8?B?YUlCV3BTcW5FNHpzRld5Sno0MmNxNWtES3k4aGUyRFRjaWlCT1dkNjc5Z290?=
 =?utf-8?B?Z2xsZTJoRkVzM2Q1YThMSTN0MUVaNGd0UWRaa3NRcFNJK05TYWREWGVERVdW?=
 =?utf-8?B?VFo0M0orOHdMNmFTSVBNU2JvZDFEZDRFbkgrOExhRTd3SnVCcDVoTjJLRytu?=
 =?utf-8?B?RWwwVFl3b2UyQ3F3ZG9oM0o3UmUvd3Ruekc5N1Y0ei9FblZkbklZZE5ZUkx4?=
 =?utf-8?B?VXc5SnRrKzkzeS9WR0hhUEw5L3p3Y1dSUEUreStnVGhrSEZQM1AzSnNISjJU?=
 =?utf-8?B?Yi9XV1hqQUJWOU5TWnZNZ0N5NnFSRlA1Y0lYa0wvM0ZvakpSM1dNMFBnQWpX?=
 =?utf-8?B?eHpkR0ltRkFYcS9vV3RYTXhSVXQyNjVRakJ6MDJzYUpOdW1KZGd2Y2lac1J1?=
 =?utf-8?B?WWFuUDN3S2RyTUtNY2NoaFZrMUNsQXc3ZUNhUmYyN1VlVkw5UUE3UHJUZzdG?=
 =?utf-8?Q?9aRJEQZOxF8qrC2Yya6cwdrvZVhcpnwOXPfXBa4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f39bcf40-6f10-4b43-a480-08d9032bf917
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 12:09:24.8742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLihlHaNlHbOubSvi9cc3C1br7hL2MfN18IgYfbUR8h9MnDpHLdVQk+EmG3NhSA92YoWMntJ/LXLsFIVPYDFjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4220
X-OriginatorOrg: citrix.com

On Mon, Apr 19, 2021 at 01:46:02PM +0200, Jan Beulich wrote:
> On 19.04.2021 11:16, Roger Pau Monné wrote:
> > Adding Paul also for the Viridian part.
> > 
> > On Fri, Apr 16, 2021 at 03:16:41PM +0200, Jan Beulich wrote:
> >> Zapping leaf data for out of range leaves is just one half of it: To
> >> avoid guests (bogusly or worse) inferring information from mere leaf
> >> presence, also shrink maximum indicators such that the respective
> >> trailing entry is not all blank (unless of course it's the initial
> >> subleaf of a leaf that's not the final one).
> >>
> >> This is also in preparation of bumping the maximum basic leaf we
> >> support, to ensure guests not getting exposed related features won't
> >> observe a change in behavior.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> v3: Record the actual non-empty subleaf in p->basic.raw[0x7], rather
> >>     than subleaf 0. Re-base over Viridian leaf 40000005 addition.
> >> v2: New.
> >>
> >> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> >> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> >> @@ -8,10 +8,13 @@
> >>  #include <err.h>
> >>  
> >>  #include <xen-tools/libs.h>
> >> +#include <xen/asm/x86-defns.h>
> >>  #include <xen/asm/x86-vendors.h>
> >>  #include <xen/lib/x86/cpu-policy.h>
> >>  #include <xen/domctl.h>
> >>  
> >> +#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
> >> +
> >>  static unsigned int nr_failures;
> >>  #define fail(fmt, ...)                          \
> >>  ({                                              \
> >> @@ -553,6 +556,103 @@ static void test_cpuid_out_of_range_clea
> >>      }
> >>  }
> >>  
> >> +static void test_cpuid_maximum_leaf_shrinking(void)
> >> +{
> >> +    static const struct test {
> >> +        const char *name;
> >> +        struct cpuid_policy p;
> >> +    } tests[] = {
> >> +        {
> >> +            .name = "basic",
> >> +            .p = {
> >> +                /* Very basic information only. */
> >> +                .basic.max_leaf = 1,
> >> +                .basic.raw_fms = 0xc2,
> >> +            },
> >> +        },
> >> +        {
> >> +            .name = "cache",
> >> +            .p = {
> >> +                /* Cache subleaves present. */
> >> +                .basic.max_leaf = 4,
> >> +                .cache.subleaf[0].type = 1,
> > 
> > On a private conversation with Andrew he raised the issue that the
> > shrinking might be overly simplistic. For example if the x2APIC
> > feature bit in leaf 1 is set then the max leaf should be at least 0xb
> > in order to be able to fetch the x2APIC ID, even if it's 0.
> 
> But in such a case the "type" field of leaf 0xb's first sub-leaf is
> going to be non-zero, isn't it?

Right, as type 0 is invalid according to Intel SDM, so you will never
be able to shrink below 0xb while having x2APIC set.

I still wonder however if there's any other such dependency, where
shrinking the max cpuid leaf could force us to drop features exposed
in inferior leaves.

> > I also wonder if we are shrinking the leaves too much, for example we
> > should always report up to 0x40000000 (or 0x40000100) plus the Xen
> > leaves, as we never hide those and it's also documented in the public
> > headers?
> 
> Not sure I follow - I'm likely confused by you quoting 0x40000000
> and 0x40000100 rather than 0x400000nn and 0x400001nn, as elsewhere
> you suggested we may not want to clip sub-leaves there. Can you
> clarify whether you really mean only the first sub-leaves (each)
> here, and if so why you say "up to"? Furthermore for the Xen leaves
> I don't think I do excessive clipping ...

No, sorry, I was confused. What you do is fine, I would even (as said
in the previous patch) just report the max leaf unconditionally even
if empty, as we are not leaking any hardware state in this case.

Thanks, Roger.

