Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999FF365C7B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 17:45:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113880.216977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsYj-00038P-Qz; Tue, 20 Apr 2021 15:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113880.216977; Tue, 20 Apr 2021 15:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsYj-000383-Nd; Tue, 20 Apr 2021 15:45:05 +0000
Received: by outflank-mailman (input) for mailman id 113880;
 Tue, 20 Apr 2021 15:45:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYsYi-00037y-6S
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 15:45:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58c5702d-1660-4c27-9a1f-f6e05d73f136;
 Tue, 20 Apr 2021 15:45:03 +0000 (UTC)
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
X-Inumbo-ID: 58c5702d-1660-4c27-9a1f-f6e05d73f136
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618933503;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qktKgnHlnU07uxpx6+TXeuebkFaHVxkPMCPmiR2Acpo=;
  b=V7MB7WHYrf9ZJljTtG7dG+smKRQEeD4R8FOPhU/xKUqexaHRfz0c/Ay6
   tzh+kTDzohij4609H0069YLvibunBqV2SQ6/V6LeiwXeaIJ1tgAkEAkQg
   bdFQmCE02KYp9fzjg1C+82Z1ZvUkvgyqsQeZyiSehIxpvZc2+xBqecIpr
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bkWrttcU0MOcAyv+FmJst4QcThc4rMYIWPX0XWHNS2tXQ5dqjYpVe2b0QwsFwjhlCAFRMjPTWX
 6rzDYEF1+AM45Um/h3tdqttCwT+3gjCA0BXmA7dscbNbdOXtrBpXO+pDYE8xCdpHxHdLJ06Ytj
 S2X3lPVfzUeqcFHy+StgW8d7loxipaEn//cAYmDpXmu5Zey9UFFpn6W6XzIMyFqceF6vyYvgfp
 jQgIYXXjBmhIDpjkZgYtNrZCGs1BcZ+OAEYKyMgwqxrNOM27yE/7/c+9uOCw90+ZsPTXjZW7Rz
 ATc=
X-SBRS: 5.2
X-MesageID: 43486760
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+ADVw64IDyuZ5u2AwAPXwRqBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3m0z/5IyKMWOqqvWxSjhXuwIOhZnO/f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7771NACT5ncLth6QARMHf/LmRTSBNdDZQ0UL
 qwj/A3xAaIQngcYsSlCnRtZYGqy+Hjr576fQUAQycu9Qjmt1iVwYTnGBuV1Ap2aUIs/Z4e9w
 H+8jDR1+GYnNyQjjTd0GLS6Jo+oqqd9vJzQPaip+JQBjHligODbJlsVbuYrFkO0Z2SwWdvqv
 bgiVMNONly9mPwcwiO0GTQ8jil6hkCwTvDzkKVmnTqq8CRfkNFN+Nxwbh3XzGczmhIhqAa7I
 t7m1i3mrASMDb72AP63NTMXwECrDvOnVMS1dQ9olYabZETc9Zq3Ooi1XIQKrgsNgTg5rsqFe
 F/Zfusnsp+QBehY3fVsnIH+q3UYl0DWhOPQk01sseIyTRhnHdg00sCxMAE901wjK4Adw==
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="43486760"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lm7W9XRxD3uyqZBsNgxEYw6Ocy0ESCVKSjGoLDybTGELlyOHECDgB/55I6Y4sIl+DIEd62jM2Keldnur1snn93b5VB0/c+WYvyJ5vSNEQ/op/j+kpgvhvmKpDL7XHX1KDpwiitM9s5+HWA6JXfuZSy9DCpqme3djs2xkutG6uv2ZaJ7Gj5c5ecLHM5UJfRFqpH5KBckczpb9CrHzca3//V7iwcqTHdzE9q0RxSfhBwU7dH+acRs6YvgIcVaHhnhJVeHiOmxWo7Avy/IngVZORrUTzEyMNVGqwdU1hnV8oWmN0sg+rZbVS60F9PwUPTlfWoKBgqqyjy+fBxatjETHTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS1C3GDXefObJ0bo182MCU8ca10mlA45jZClpTpeywY=;
 b=ivTH23xGAZI2dsdfjrPjg3rYkgKwcHDh14J7JaKJ/KjQSBYgUtxOwbVHmpihxyT48Ig5qLZx7oHc6uiwmweq1Jwu8Mmc97mGUp50eTaFnmp/BulguDke6O3RvRGkQL3aizqklspeUnuz7gY0C7E5iybijI9qqTWqxjJlLoHcaLC/QeRn2Un9hATgvtn6v2U0bvZH0l/zD+4uLZH3ariaM8/2imDq+6R3lkqmy3hP3hYgLHe63TJn7Ml8DF2X6RSsIkLKFiwx03VaVAQrWwsJCJpe2CX4BsFbOKmOycL3gui5WIbeJlhx8MwYoxCA21GBbImD6RYZFAUO4dt7QuXDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS1C3GDXefObJ0bo182MCU8ca10mlA45jZClpTpeywY=;
 b=jfCLwlxXeltHba5BqYizOEHHd7jMdXzUFzE0ne7p0Gd9fcbHd5sQHj4IA3E4CKf5JitYS46LDILAZllvglV6zgZkR0j9AAofKgx+wmDjwZvEttJbrGf0K39lE2U5UjYPq7Zc1ekclwP4/GObIIxvrP/w4z/1C7MOmbhCR5mV1c0=
Date: Tue, 20 Apr 2021 17:44:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/3] x86/time: latch to-be-written TSC value early in
 rendezvous loop
Message-ID: <YH729WcM5Uqz9vwk@Air-de-Roger>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
 <35bbad56-d0f0-a37d-674c-e635eaf9c94c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35bbad56-d0f0-a37d-674c-e635eaf9c94c@suse.com>
X-ClientProxiedBy: MR1P264CA0033.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 472bb0ab-30f3-42bd-b1f3-08d904134139
X-MS-TrafficTypeDiagnostic: DM6PR03MB3482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB348214D654682D7C456DA2438F489@DM6PR03MB3482.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lMtEH9aImosioStIZjDxV3M0cF6NECJuVl8nqox2TA54I4bu00ae+tlu1tayVuQFonVwZug/oTE4ITnBnMqT4i+X16xc8ULJn3wEMcb4XgsfIKTMmBH6qGyCMFiTEunFK98fqDAwsmhXZlhPURJst9vpAzb1G9CFHlXpJvVNOAEuSSMv35URtIz3lQ7r6OPTYhGMHFIGwq4e4aIxnXIbfAKCsvjZwhW+ZYwDtArdcBd/m9wygJOX3vVQ+sUX0veg8jwY4fFJlcBQEr57Sq95PCmqQuH+d7jvJLgv5D0SOIxXDwnhRrZJ9mcCQhEgi5S1xiLTOqdCJMdoccNhdi3t467gr78tj687Zv/j4wyHmHR9pdQ5eNCnpjFT0A3ZAoPffzZWAVvH172/sVAEJNd6knMCuskNQ+GQEqm/kS9HppdjDHV8la5q2W/2tQPVEhYfi3KXh7hynfLoRmGu8WVXkPSiIObNCXB5qQDvLfojACHCDJxMbvA+I5gH0lTJFTub6Ki/QDP0m5mxkLbMtRRiCve8PFM17EfSCaayrmBw6eC2Oi1wmZLFcgCxT7edO0MQwZKJlE5G16RxjpmX+C0LAPhXK8uR0ahXHW6oBhJHklU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(186003)(38100700002)(6496006)(26005)(16526019)(956004)(4744005)(6666004)(478600001)(86362001)(85182001)(54906003)(6916009)(66946007)(8676002)(66476007)(66556008)(5660300002)(4326008)(9686003)(33716001)(2906002)(8936002)(6486002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2svOHYxRHVjcmVieDV2eW5sbW1HNitwNGoyVE9NVmJFbThlaXJqaWZORXQ0?=
 =?utf-8?B?TjdNSVkzV1ZwdGpFWU5aU0ZhSDZPK1JGamJPVUJsZ1FDZnNlTU50ZXgzQnFW?=
 =?utf-8?B?Q1ZSWHNwSFNHN2x6dzR1emQxV3pxQzhuSFpUN0VmS2s5aEQ3RzRoQXQ4cVQx?=
 =?utf-8?B?bkZ0dVhpcC82VU8wV0JoSGw5a3k2bUJaejcyNUtKWTVVZGtDZmVKc1BNN1dn?=
 =?utf-8?B?SUNoUktYTVdEb2w5RmJySHBEOFFNb1BreTI4Y3lpaVZjSkZmcmVXV01YTGFE?=
 =?utf-8?B?V3c5bytqYzVFQmtsd1czU3kzems0aHJrRHFOR3I5THpYK0FrdjJpb3A3dkkz?=
 =?utf-8?B?QmwxSEluVmt4dWZab3dBQWxVVEhJVy95VC9vS2JQUFNZQU1zbVdxY1BaQ1RM?=
 =?utf-8?B?b2Njdk9LVkVDeXh4TjR4UmpSN1FReTRna3E3dVNnR0xLYVBHblhwTFpPZ0RQ?=
 =?utf-8?B?R1I4ems0QnF4c21tRXdtbnNxNnovbDRUKzNDanowa1VUQ29hZ24wVzI3a2sy?=
 =?utf-8?B?N21aNmJxNjlyVFBUVGhld1NQcGFWdGxxb1M3YkNBaVdicGNxYlFJdWM2Nm1O?=
 =?utf-8?B?TlJLTEFNR21zWXI4dWVzZGZTS1dieG8zTC9HbWNYZEJ1T3hjRTB0MUQzSFBI?=
 =?utf-8?B?UjdDeHpqT3RqZGtNQ1FBRWtsYmd3b2szY29sWlJ6MWpEdm5mdEliYXhYWWc0?=
 =?utf-8?B?eWdHZGp2a2Z2RVNDM3NjZUFQdlpUY2M1M04veGE3Y3hsZHFwcTRiRm5aeTVI?=
 =?utf-8?B?amlPUXhuVTVmYnptcVZDRVo1NnZvTDEwWkl0QmZsOVVqWVRKOWw2M0xYYW1E?=
 =?utf-8?B?bXFEbUl6Tjg4V2RPK0NFNUZzOWxWcmpmZUVGTkFpb3lBNTAzREMvaDAyQlcr?=
 =?utf-8?B?dkVSeEdENEZKNDlsRnhsZG5RK3EranNSb1BUOWs0azdNNlg5M21YWnVWTXRW?=
 =?utf-8?B?c3FCUFJabTVQZ21URXVLVnc2QXE4Tm9lWXJEc3ZGU3FSQytCdkFxV3RIM2Fk?=
 =?utf-8?B?VXAzS2dIZ3BwMHJoSEFUdFppR1lGNFJKSDA2c0VxM0V1NE1FZnhuS1ZvRmNy?=
 =?utf-8?B?MFhTKzdDNmQ0QWQ1bzhjWjhWSEg4U0ozTE8rVWpJREtmZ0o2Qzhtdk1iK1do?=
 =?utf-8?B?emJubjlIMW1MK2hMWUpGTDAwVG1DeHl4MHlyWnNxUlpYN0NZaXQ5T1VlMzlH?=
 =?utf-8?B?VWdjaXFMNXduajRtM3BURTNYMWxHSXdPb2lTUThMellYcWtVU08zZ3pPYmhH?=
 =?utf-8?B?UlA0MVQzb2gxVzRoYmFPUGRGeHNTRCszSndRTFV6UW93ZUdiL2J3K2U0THgw?=
 =?utf-8?B?N3JERklZU09HblFhZlFXNnA3VnhNNUt0Qm5ZYkc3aFI0bnFrUFlkQ0JEazMx?=
 =?utf-8?B?TDNkYjhyV0huQUVmcmREMlRuQ1VVc2Z4a3E1U3hTQ01TOTlmUytQZ2szVlNO?=
 =?utf-8?B?a25GSUJZNzVOK0hPZnE4WlNXblNwRnc2NklOMEl0NXo4MjBrdHdCYUp3SlN5?=
 =?utf-8?B?UEYxTHliZmJTVjFKSWlmMC9MVThObzFUcU82Ull3WHZPN1FFT3UyL0xKb2ox?=
 =?utf-8?B?N25RdFIrbWNPQktheUZBUmNrNllobmRXRW1SQzAzOVlwUE5kZE5jWTc5RW5G?=
 =?utf-8?B?eDB6Tnd6ZWl1Q2FVTzMvR283akg2dWhmTWk2THdNaDFWRWRTTkwrOUd1Tjdt?=
 =?utf-8?B?WVRRYmRnVkVmblI4UmlPV0NCKzRNMWlNVWMzcHFqU3FRTWdjR2hNMTEvQmRo?=
 =?utf-8?Q?HvIm23nxO/SEalxdF1UaDy/lf73O+Gp927uBi+t?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 472bb0ab-30f3-42bd-b1f3-08d904134139
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 15:44:59.5891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbEYHBdEBYgoDL62YC7m/kJV6iVAMzZ419x1ebpvSZk+RRe/TWs3wXrl1XMDJSoVEAAbpNvhZEHsQ4Buzjf13A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3482
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 11:54:05AM +0200, Jan Beulich wrote:
> To reduce latency on time_calibration_tsc_rendezvous()'s last loop
> iteration, read the value to be written on the last iteration at the end
> of the loop body (i.e. in particular at the end of the second to last
> iteration).
> 
> On my single-socket 18-core Skylake system this reduces the average loop
> exit time on CPU0 (from the TSC write on the last iteration to until
> after the main loop) from around 32k cycles to around 29k (albeit the
> values measured on separate runs vary quite significantly).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

