Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C395538D73
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 11:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339335.564181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxqv-0000in-Rk; Tue, 31 May 2022 09:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339335.564181; Tue, 31 May 2022 09:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxqv-0000gY-Nx; Tue, 31 May 2022 09:07:49 +0000
Received: by outflank-mailman (input) for mailman id 339335;
 Tue, 31 May 2022 09:07:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvxqu-0000gS-PU
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 09:07:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23889afc-e0c1-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 11:07:47 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-54bS3FilMem3609zHU7ELA-1; Tue, 31 May 2022 11:07:46 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9265.eurprd04.prod.outlook.com (2603:10a6:20b:4e0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 09:07:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 09:07:45 +0000
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
X-Inumbo-ID: 23889afc-e0c1-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653988067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=np4roSaQGCbI5NIEruu7cTBnjPhBJmeFXZtpH5BoncE=;
	b=Z+BbezJIx19K8Oyul8CBiVO/3Mlbi1FJjNSZDvC2nL0u03rcUWaOh12btB0OnSkG95pGwu
	3Lb2jSIhkmL8owBoYo5XlhYuzF5tAL+d8pl8+zKn/UGN4amCfu3bU8ZSYqAPahoEHaOVi2
	c8phyre2pYGDoW9QpTmcX2uT8jyKBBc=
X-MC-Unique: 54bS3FilMem3609zHU7ELA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjlpBzuMqLNuaplUTOmC6hF+uywikCFj+lOtdynQOM272sF4rDffzAh+nAfg9W64bdD1YRHDqAia82FpVneZ6zY5Il7jI5AlNQ8WJWNEAJ+AtYl4c3bRhgqopPoFUHutSsmKYBz7VjylajSpeAKIHvSR10Lo81TKpAkoQuuZVvqoU1vTO7mT5agdNilGSDLaR5jee3biq73N0R4qy+xxtJazGEAvgtYlzuvQf4KhO+4Na9acHs0g8CbeCazI+KeNrC3JL9HmfyH4sNFRt/hI+OT9lteCOu9B4O2gS21pB+qHOFQYGhOVZda8FXRkc+YLwlO48vlpS1L95KIVaRSEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np4roSaQGCbI5NIEruu7cTBnjPhBJmeFXZtpH5BoncE=;
 b=S0vM0lh4EgEVhhGI76ZFIUQ8JCxKzGooJo+nzqvV2UJe/0t8tiEB2rYL2NN4KFjN93MdWrcIUSKy0VoXyHRNHX5r9HcaygdXynRYTYm5T3wOeIAx9DzBtYzrVKREv9qMsNrNcC+3i1D4PJQC9u8vVtP1As5sgi22DqK8KIm96Q8keyyX32hskV9HTBtZXDDTtJR5DLdr7fmWN4FPAa1NR7bhxpEsD6Ct5BqxR//WOtJ8bGYGgWPMkvB4V+ObTe0hN0xGq3QjOzJu9IZmFfvYtiF3NTUCJJrXHvf9oHPl5rTPzf6lnGk8aY+nLcSPvrAvzF6fWnO+8EInoTK7gAXL3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19c9c316-4d6c-b449-8d3f-c04f1a1f5f97@suse.com>
Date: Tue, 31 May 2022 11:07:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 4/6] xen/riscv: Add sbi.c, sbi.h
Content-Language: en-US
To: Xie Xun <xiexun162534@gmail.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1653977696.git.xiexun162534@gmail.com>
 <ab42b2b2309874e5c3a42ce04e2f94e4409284a7.1653977696.git.xiexun162534@gmail.com>
 <55710c63-c531-3330-786d-ec6349690311@suse.com>
 <CAGJ6h0XF66R9540f9e7riaDM3OKtLh96zNA-OKrgW5uVSLkOuw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAGJ6h0XF66R9540f9e7riaDM3OKtLh96zNA-OKrgW5uVSLkOuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0766.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3580e32a-a797-4298-0080-08da42e50666
X-MS-TrafficTypeDiagnostic: AS4PR04MB9265:EE_
X-Microsoft-Antispam-PRVS:
	<AS4PR04MB9265717AAAEE780FFF23D715B3DC9@AS4PR04MB9265.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yXu2zJ5K9ghbBW5Q7MdaDPKNswlaSdJQGybfpVWfR+iEAmdFb/UghF85yuyCwOz68xaRjyo9WGRLIVep3MbJyTDJ3FTrMSoZOlhowk3yxZmc0HNPJlO9MvXHbdfSd+TPqaxiJWu6ABWu1SJBdJsK3tLOeWWiFf3JXcfAqbnJqojeXvkLVAjIZE6xd5dqZ2R7SmoP6XYd4ZANSPHSZYhsaqeZ2Y4lkNupPs89q0oPo2G065Tp3oBF9B2rIiPTEk5aqtJ84FwoWEANhAspUTIcyMV00MfD1h4DU4+wgIaBgVwPgL98ugvANX+8OpAreE3qvM37s0Wn2it6nrPswtR5JvD0/8rES8jsv8PWJCt+4klvNywxFUR82rjHTUKYKapgBRgj4eouHOt7HxNcDDav+YNZl4p+/m13mScK7suzq1EHFzN4qMCzZhY+/IVuYdCIdFHJuiIV/TFt4f9uBnwZkzaEAtlh/9YxebxtIxB/LILpSk+wRBxwu9GUorPQ94/4hIe7GxdFdD2gmAHkvQEecrFcejFMCBtKBPjOlsRyYcVMXj7RxFNzv3C5DeNtr4AYE1/GKtkPbvPK4+4KZPUTaxBkR/Zt1lKYlNbH8MfKeUHHwJoxxC1MCfyFIJxrG2riM7JesDnuIqla0AfFLWmpz4fgq5mSj6LXDm7KQGBdHgtLeXnW+xamrIOB3Q0FzcpHo6cJP0ith8CHXnQ4P4hQJGsSTVrBdmBBMfD5ED6xdaOugJnGdgBltK63I69thKFYc5stxEwd/incXfbk6c8PN50ClsUNL1cGj6uRc6eG8/iO9PMoPLtQJkBDoClRipEZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(31696002)(4326008)(66556008)(8676002)(86362001)(54906003)(66946007)(6916009)(508600001)(966005)(6486002)(186003)(316002)(6506007)(6512007)(26005)(38100700002)(53546011)(2616005)(31686004)(2906002)(8936002)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDJoT0xnc0Y1ZHRhaGFDc0l5U1JLUTlZTGQzdmU0Rmx1Mk1kZVdGZUJ2Q1Nt?=
 =?utf-8?B?SkY3K3RmejJ1VzlnRXFJSUdtRkhxTHRVdm5OcXJKaG40WHF3bkRqSkxjSGZI?=
 =?utf-8?B?WEd3bFl5byttQ2FzSXpSRTZJUU9LL3Y5OEVNMHJXL1dzc1VwTmN6YXl2Wk02?=
 =?utf-8?B?ek1iS3U0VXp5SEZHOVNIQnpTMFprcEUvdWRLOXRGLzZIemQvK3oxL3I2SXpp?=
 =?utf-8?B?WjZxQzBWMGNTV1duL0QrS1R0Z3N5Wk1JS2N3SzdITkVnbVpEbmxuVk12M2pQ?=
 =?utf-8?B?QVA3VlUwc3duREdDTlZrK2JYQTA0ZDlQZEU4R3I0OEpWS2RNS044RENva2E4?=
 =?utf-8?B?T0d4bVZMdmRKaWllaWM2elp4UjFSUk45MU1udDVZM2l1ZXRBUGtDMWFydncv?=
 =?utf-8?B?eE1OVE1yZ2ZjQU9INjMvR0pqUWJCR0tXeVRDNUlKNEVRZmdSU3Y5S01SMEFR?=
 =?utf-8?B?eTQrMXlQVVB6dGU5anAwNE55bFdPVjNNNzZHV1Z4SlJVcERFSG1nZzg2N3RY?=
 =?utf-8?B?TmJ1V1dQZFBoWGVJUzYrMUt3KzRuenhPWUFYbWZiSnY5K0I5T0lkeWt3UnYx?=
 =?utf-8?B?YlNFSkJqY09jUXduY2x0M1BrbkxtcHl0ZDZOYkNrbXdueUNtelRrMnN4YXY2?=
 =?utf-8?B?bURscnpuUlhTZlV6SDN0R3FqZjJHWVRycHZ4MEZzdm5nL2JBODB6UXBUck1P?=
 =?utf-8?B?TEZlMkNLY3dSMzhqbTdDUTBsamQ4SDV4N0JtdzIxUk5XWXl1RU1EcUV4YU9m?=
 =?utf-8?B?eTNTZXR6YitJaHBUZHNPejh2NDVHRmhsZEZxeUprMkJybHZ6bDdMZnR3KzIr?=
 =?utf-8?B?OFVndko4ZCtJdksxNFYvUzcrVFdTcXRuektGVFk1Q3dnTmlMdUpFWG9pWnRh?=
 =?utf-8?B?eUh1bFlSNmZPZWl5WXhvc0hyZ3FVYWVlRjVYOFBqaFZwTEU0MUgwdHREcGJG?=
 =?utf-8?B?Y1dTV2cvK0ZQc2wvcldQakhhbFpDV2xaS2pLT2x2YUpnT1Z2Nm43OGJSNmVE?=
 =?utf-8?B?THRPTTNQOEkzTUZzSTRPakVNbWRwbDhtUWpEK05zcWZUbEIxczVmRENRM3Bp?=
 =?utf-8?B?TWkwR2xDV0Rsanc0QlFFejF0L3h5S2RUdG04Rkp0YjB4MXErc3NycnFYbHp0?=
 =?utf-8?B?dWFEbVN3TnBQV25GaHZhaG01TVd0TW9odjVzbkFLRzZCRWFJcTcwK2g0cWpp?=
 =?utf-8?B?eWp0NUkzSnExeHpkV2NxY1pQWTBOZkFPZGNhRjlCa3BxMUJFdVRpSWVBM1VW?=
 =?utf-8?B?WVR0a28rRTVCd1Q2b2N2cWRPSTVrUktMSHFNTVBCQnM1d253b1dwSHJnUklV?=
 =?utf-8?B?Y0JNUU5tNHZ1cE4yMktDdEk3dTk5RFF1R2NqT2FqRldubTYrNGdWeTRCcitn?=
 =?utf-8?B?cEZRcjFmUFA5NEhCRG9mM0hnaEV0QmRkL3IyaWNsQlRYRCsxU1pHMlhyUzVn?=
 =?utf-8?B?K2J6ZEoyTHBiRXBIdTlEZDBQTEcyOE95K2lWeDVoTXE5NzR6OFhrVmdPTTQw?=
 =?utf-8?B?azNNMkZ4N0crdlg3d3ViT0NhWEFCalppVG1uM1V2NEJNYmc0RWdxcjhLYXBC?=
 =?utf-8?B?M0pubU5ENjZXVFByNW01OTg1d3R1cTQrczNaQi9hbHRWL2xpR3U0bWNRK1pu?=
 =?utf-8?B?blp5dU9veVdiM2pSNlRlMmlYeTF2V0JybERybzh4MDViYldMS2ZFMlpMWnZU?=
 =?utf-8?B?MHNnbG91RnpaYkFZQnVjMHpvbUp2V0RBZkNBRzlVZUU3b25jcTBHYXl2ZE4x?=
 =?utf-8?B?dlo1dUExZlJpMXNYV0NKeURVU2M1eU96N1hSM0hCZVF3UnU4RTlJUk4xc2lp?=
 =?utf-8?B?LzcveXlqa2xMM0N5YnBJSEo0NGM0YXM3UUczMW9nTUFQODVEUDcySkdpVDh6?=
 =?utf-8?B?Z00yb3NTWTVZMkphTlNCTVhuYXRZZ1hoaE9NTVFadkNCR3FneVZFeUxpdnMy?=
 =?utf-8?B?WEZMejk0NnMrakJ3ZzNoZm1UTmtHbmg2MnZId0hLY1NXWWVsNnVqa296Y0Mz?=
 =?utf-8?B?c2krWEdlWEFndjRhYjNFa25iazJaL2w4WU96ZWQrbUtyZVljZ2Y3bTFDZnpx?=
 =?utf-8?B?U0xCbWF2dDFTWlROWmlaeUw3MUtSSG10VWJzZzNVbk5zQVpwUU11ZklVTUJz?=
 =?utf-8?B?dnVkeE5qK0lpRms1MndFaDJseFBjMk4rN0hUK054YUIwblZSNis3SEF0a3lE?=
 =?utf-8?B?K1JQTll4Ylk2d3BranVNMVR6U3V1eGtuOVpxOWlwb2tyRm9mVWIwOTMrS3R0?=
 =?utf-8?B?MzRWZGNKczJ4QTI3bUN3OWpld3VGSmlvd015aGtNRHErbm5CblcyQ3dlWFVR?=
 =?utf-8?B?L202S2NHbURobGhSWDVjb1VMcit1YmxLb3hEZ3JGZmYwazU4YW9NZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3580e32a-a797-4298-0080-08da42e50666
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 09:07:45.0825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvyO2LtK7mYc/KcHs5PesrWsJvbeANpMgtF3T9c0P5j7K5sncL/Stxb/A9a/+48nn1SpvbcWHfnZ5fLjlVMUfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9265

On 31.05.2022 10:59, Xie Xun wrote:
> On Tue, 31 May 2022 at 15:54, Jan Beulich <jbeulich@suse.com> wrote:
>> On 31.05.2022 08:57, Xie Xun wrote:
>>> Signed-off-by: Xie Xun <xiexun162534@gmail.com>
>>
>> Is this correct / complete, considering ....
> 
> Thank you for pointing out this problem.
> 
> I have read the submitting guide
> https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Signed-off-by
> 
> and it says that signed-off-by indicates I certify the patch under the
> "Developer's
> Certificate of Origins".
> And in the "Developer's Certificate of Origins":
>         (b) The contribution is based upon previous work that, to the best
>             of my knowledge, is covered under an appropriate open source
>             license and I have the right under that license to submit that
>             work with modifications, whether created in whole or in part
>             by me, under the same open source license (unless I am
>             permitted to submit under a different license), as indicated
>             in the file; or
> 
> Because Xvisor is also distributed under GPL, i think it will be
> correct if it is
> signed-off-by Bobby. The problem is that I did not modify this part of the code,
> so I want to know how to submit this patch in a correct way?

If you didn't alter this patch at all (or just minimally), then I guess
first of all you want to set From: to Bob. Whether he has given his
S-o-b of the code I don't know; hence my earlier question. If so, having
his first and then yours is quite usual an arrangement.

Jan


