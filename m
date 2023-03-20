Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D376C0EA7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 11:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511818.791086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peCeM-00046E-RC; Mon, 20 Mar 2023 10:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511818.791086; Mon, 20 Mar 2023 10:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peCeM-00044X-OG; Mon, 20 Mar 2023 10:21:58 +0000
Received: by outflank-mailman (input) for mailman id 511818;
 Mon, 20 Mar 2023 10:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peCeK-000446-Tj
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 10:21:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0960d45b-c709-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 11:21:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8223.eurprd04.prod.outlook.com (2603:10a6:102:1c9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 10:21:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 10:21:48 +0000
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
X-Inumbo-ID: 0960d45b-c709-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7s76aJdRJ6V9xb6US7al8N0XLm0RIvzkzvKuM8aJavyjIId0HzJw2c+qcQRWoonNygdGqcxmJWEDsM2/Ut5G4X1XrS4ZswJxnp08oHNGIKQJ12W/TjMHZ3F5iV86Pt4tUJe5IyS6WPgEqP8KqnOzm2vwPZV/i5npbNKDmFjeGVw3i0VRtWAKZ4Gxv2s6bDtMn+i0V42HmRCW88xObfDwqz5/xyom1aMMvnJlTrk2yzdd5JOse/P3gkavMjUBtmfB1cGnfHyVqu+Ad5/SV2ZdixpSS3so7+e6vBnB6r8Tih9lrhFfuX8QqkQk0m7JZw1AOKANh2hKYtWLBr3EaPpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AgsO75KsI7eDG/DVWdCrDHkkRSXz0njVdMClLogt9U=;
 b=oTDK5wgsvb9Bbc12Db4ZHAjzl2o102Uy7wC/wfngBaaJPYla7kQrurJmbWfhRyR0UZCe85ZZjHN68TEr0RGQccdA+dPjXZ6NgH69NkyKM9ExsMeB2TA6jCdkloFs3ioNgOYY1vOCtbMLFtPA9ZaVvOcDfH1ASArp/KrQvQNFbXP8QUm1ywV60ZHwKitk6+FAcbon+MHnYtcPaDTu9J7w15egv5ZdvOz0fSbp2H8TLreyx+Fk9FUpsz4sTOvVIpMCmpYbhnGfHWV865g5SxwpZnqZs6/soDiTcHlk6x/swFLbN4UgoJ+0/N3SYOrlDrfoYcr3VgsXmWAYp1z47enYbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AgsO75KsI7eDG/DVWdCrDHkkRSXz0njVdMClLogt9U=;
 b=dbOjcIytTkpN1jrIKIygTBZyNz9WbRAZyFYXVBcExrO0DV61FJ1Hxj2vBlp2+0/6qySQx0YCMYk9qJQx2ytLA4khRMVTpRQdx5XasLa7xNBPLSt3fqny7WM1DFs1QHOPlx7666DK57TZueL9/s0q5/FMPa/uovSuF25rK/a2+mtOo2Us0mGu0RqsFH59yushTffrQcSkojExlg+GGFl20rpmG5vVFlWc0K9eMBtb9RtHnM97C5ZOD014WAXrUZ01rupR+/p7x4/FPvDY1teMq3wbI91ASZvV6+EPi/gxhpa0fwZJ7E8rEFUMmWQQFfScOa7MttESuEsOoSwTw41CHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <43d72aac-ff2e-7a22-21ca-cd23f46f1584@suse.com>
Date: Mon, 20 Mar 2023 11:21:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
 <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
 <f2bd16f5-7f5b-7a0e-7cd2-e2a9dbf22102@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f2bd16f5-7f5b-7a0e-7cd2-e2a9dbf22102@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9177c0-f2c5-4db2-cc35-08db292ce9eb
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BnRcnc7COoHjwVo5LdL2KQFTh4HugkvgTOe91ScOZg2KN7L0a5lAEoH4en18guKZ4OHM3GgLP2pQMNMIzGv6PBJV11diXRAHuzd0pZLW1k17eQbnPShqOjDOQEsyagPoN/Bfl9M1p5h/5Nl8Pot5Tu7lIOHjLj4BORtUYQZe7bIOa5tifaCD4x3zW3M9AWM3c5dxP58FS8bTtY/dLoNI9wcBjlZZthaBWT6URAxWblZ58TTD5h/Gzc5Z06cjSpQafM5bUFGTd5sxLFpv/rJN76HRg4oGPURQYMFGxUWwauuHGxd94KMtrgOrMoL2ahpJ94c+8QKSHuudJf8pwNU8OHKNaVPrUl39PVXl1t39RKFTY8JQS+8mRuDf2ItrCh2viDrh4+Vh0T/O3+kDmQNia2XBqO2+GZLuNvN6tYX1Di22qDCakr4TkmJXMcva5ZSg5vEXFOEIwnTWQZM1MOAjg3MG127sY9+cqpCyVnhVy4a/oRR4PqYsFn2s/szLDR0InO73+ncw3tmYWVtGW0QCvMvZrWZt5NFttthbEPwYtfegVC41fieBLfeiyOYgeYUPgKlM8D75XpaAoGxJRy6tAAja2zRo89c4idYQwDObPVw3Gix2DwlWznFkN9qKPlh3Gu3tHaBzJ03b5ez8+pp51Jhw+EzUhHFs1UWW0KfUVYANPLQuXWGmdiJGizQGTH8N+fXg449cP0A3s9fo0ESqgLNybgFZQkFycHTHlkP1w8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199018)(86362001)(31686004)(2616005)(6666004)(6486002)(186003)(6506007)(26005)(53546011)(6512007)(38100700002)(31696002)(66574015)(2906002)(478600001)(83380400001)(8676002)(316002)(54906003)(66476007)(5660300002)(4326008)(8936002)(6916009)(41300700001)(36756003)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0E2b1lnNDU5ZGNaenl5NW9lMmtUQkpIUTlkSGZzWkkyQ2paeXd6QUdYL2gz?=
 =?utf-8?B?VUFhd0FYb0Mrb1IvNmg0eHI1SHAzc1FhdU9mZkh0SjlFenhUQXN1a1lXeDdq?=
 =?utf-8?B?cWcrN2hKdStsZ09vMjhUcVhmemZSek8wZ2gvb29BTkRsN3JoMGNQTjBZVWVs?=
 =?utf-8?B?TVdlL1lCZ1NKODY2V1lTTjNKSmI0eThWTGtHWUpyWE9ncTVHbk5yZzJxUUpw?=
 =?utf-8?B?bWVHNTJYUVZudHRFdWNRV0cwNlJleGFmQ3NScWFZMUtmNmJRQXoyOEVOZm52?=
 =?utf-8?B?MFNQbjE0TzltMXpzWTNId3BBZ1VzQ0tTTitaZlJIcU40eldmRjM2ZTlycVBi?=
 =?utf-8?B?Qk81MDRHRnFFdytYYXhnQlU2ei9LaDRyQlBrNW5lOWZwQU5qbjNNVVh3SmJ5?=
 =?utf-8?B?SnR4SUR5UFRKb09SdTlBL3FWbzdtYlhWckpXSmg2cU9la0EycS8rS1UvbGtR?=
 =?utf-8?B?Mi9kVGFCTHJQR3NHN0ZpRUNsOE80Zm45UGJ3Y1h0Y1N5cU16S2lIQlJicFZr?=
 =?utf-8?B?bXppZ2xhdVU4NHVCb0VxU2RCalNQV05ndVZFUW1aTVd3R0dlK0tuYSt6SXJi?=
 =?utf-8?B?MzE3UmRIU1ZJUGlvLzc0WTNncW1YbDBzeTE0U3NjQTdFQU9UbzVBSUkzQUlF?=
 =?utf-8?B?ZFBXT3JZUUg3Rk02VHREczNjc1ZkNWllSHN4dmRKMnU2SEdHbW55ZmVYUGRE?=
 =?utf-8?B?M3BXR1hjK0M1N0lEU0d1alZUSE1jVXFYZFZWNEFGK1ptcitidDFEN2pBTzJi?=
 =?utf-8?B?eTV2OWVkRHZsdkp2YkdCeFl1WXhhai9vYnk0a0k0Tzd0c0xOWXprZmdUSlpr?=
 =?utf-8?B?RjMzRGtBckpubWZPSngxR1Z4SVZ0Sy94eDFiUjY5cnp2NU53bWdjVnBsbDdz?=
 =?utf-8?B?Y2pLZk5vOVNMb2Iwb0d4MmFOMkJ4MnQ4L3ljaS85YzZLdUhFb2JCcHc0Zy96?=
 =?utf-8?B?SWN6Rk9NZFZTQUtVVnpWeGVLVGlrb1VBTnVSaDVOazNPZ1I5RHdvNUs2K25W?=
 =?utf-8?B?OXFNbGxremR0dXVMSERGbURKREVsODZ5QUppZ1BVWTQ5bkUxRm1hWUtYZnRw?=
 =?utf-8?B?SG92ekVqazFlQ3k5ODZZcVA4V1d3c092ZE44QzB2YzA1bllJUUVIMkEzZTdS?=
 =?utf-8?B?OXJqeUQ2M3NyZ3VtVThpbHpsU3N6OFFsWkJvVDVYdDZzTnRHMjNlN0NLQlBQ?=
 =?utf-8?B?Z2dkL1lPZXVMOEtIcEZIbzRYQThhMFRDNXdZOC9qWjdjcmY3VG9QdlYwdXBL?=
 =?utf-8?B?OE5XOEhoQTV4c1lGcVIzYm9PTWN4YUpHaWVycG00bHBEK3ZJTWg4a2x2UmtS?=
 =?utf-8?B?dWtUUHNSOFkwbnpiQlc2WXBPbzBBamFpbDdjTFRGK2ZiTVBFK2ZBQSszZHVP?=
 =?utf-8?B?bEdNcXVGcXZlanBCdE82NTlsY3V5WE5udVlWQUlWWkowZzMzWWo4anRmZzhz?=
 =?utf-8?B?UVFWUjU1L1JCZTdDQk5DWEFGNXlYOWF2bXp4SWFLK0s4MEpWMWpjSUJiejBN?=
 =?utf-8?B?L3JxbG1zdngrRXNqZGgvMmVGTDN1SVBZOUUwRzFubm9KUS93cm93TnRaTEkx?=
 =?utf-8?B?djUzN0tvUWdlVUhiTU8zQjU3akFFWk1jSDRhcE9mNHZEdlgxeEgyRmRjVzNo?=
 =?utf-8?B?QVMrMXhiVTlhNjN6T29xM0NjSElxY1VEaGVGZUxZblRnMVl3YjJwNjlhMlVo?=
 =?utf-8?B?RHdvYi9hYVd6YTJBaXAzVURQMkJmZXZDdU5tQjFWUW02d2xwOVpqc1F5cmFO?=
 =?utf-8?B?T3BJbE9JR1VoOTFxczd0V2M5REF3ZHB0a0hzN3JzaTB6LzJlVjdHU2UzdXVi?=
 =?utf-8?B?dDhYSWNUa0djTUwxN2t0QkJ2Y3VabHFVb2Jpa3JvbXYwZVhNaGJVZ1k0T2dB?=
 =?utf-8?B?YXc1LzR6eWp2OFBWdjZtelN1KzVsN0hLVTJheXhqakpPdTRuKzZNTEZVcWFr?=
 =?utf-8?B?OUIya2RtZ0gyT1pMU21qcTdzTFNPRVp3cG9XRy9rb2dkVk1FTE1pUkNpMkdj?=
 =?utf-8?B?MGpQYWs3VGNGLzR1clhvTVFSMEs2ck9CVzdkNUxKUnBndFh6dUpsMGhFdmpC?=
 =?utf-8?B?KzZOSGFrdmRpbXZUbGZSTlkyZnN5aU13RmZQdG90RDdDMzhpcXFCQWRGRmxu?=
 =?utf-8?Q?ba2awL7nmAAthmwagRfESN3HM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9177c0-f2c5-4db2-cc35-08db292ce9eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 10:21:48.5401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YouxVicjV+1BhXvhkjpZzeV0345IAgVgrssg1PaG3f1aKBV8EC1X1T7d7y4WmQgRx+P12NC3dBgrzq/38qX61A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8223

On 17.03.2023 15:21, Andrew Cooper wrote:
> On 17/03/2023 1:56 pm, Juergen Gross wrote:
>> --- a/arch/x86/xen/enlighten_pv.c
>> +++ b/arch/x86/xen/enlighten_pv.c
>> @@ -1476,6 +1476,23 @@ static uint32_t __init xen_platform_pv(void)
>>         return 0;
>>  }
>>
>> +int __init xen_vm_assist_ibpb(bool enable)
>> +{
>> +       /*
>> +        * Note that the VM-assist is a disable, so a request to
>> enable IBPB
>> +        * on our behalf needs to turn the functionality off (and vice
>> versa).
>> +        */
>> +       return HYPERVISOR_vm_assist(enable ? VMASST_CMD_disable
>> +                                          : VMASST_CMD_enable,
>> +                                   VMASST_TYPE_mode_switch_no_ibpb);
>> +}
>> +
>> +void __init xen_pv_fix_mitigations(void)
>> +{
>> +       if (!xen_vm_assist_ibpb(true))
>> +               setup_clear_cpu_cap(X86_FEATURE_ENTRY_IBPB);
> 
> If nothing else, this needs a comment explaining what's going on.
> 
> "Xen PV guest kernels run in ring3, so share the same prediction domain
> as userspace.  Xen (since version $X) default to issuing an IBPB on
> guest user -> guest kernel transitions on behalf of the guest kernel. 
> If Linux isn't depending on mode based prediction separation, turn this
> behaviour off".

I would have thought the comment in the public header - saying exactly
that - is sufficient.

> But this does open the next question.  Yes, unilaterally turning turning
> this off restores the prior behaviour, but is this really the best thing
> to do ?

Unless this is purely a question on Jürgen's suggested version (in which
case I'd let him answer) - what alternative do you suggest, within the
present policy used in the kernel?

Jan

