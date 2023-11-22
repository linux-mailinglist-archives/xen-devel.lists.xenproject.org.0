Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A3B7F5017
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 20:01:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639083.996040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5sSe-0003Vg-SF; Wed, 22 Nov 2023 19:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639083.996040; Wed, 22 Nov 2023 19:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5sSe-0003Tz-P4; Wed, 22 Nov 2023 19:00:32 +0000
Received: by outflank-mailman (input) for mailman id 639083;
 Wed, 22 Nov 2023 19:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e6OV=HD=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1r5sSc-0003T4-Op
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 19:00:30 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6629d340-8969-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 20:00:28 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 19:00:21 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 19:00:21 +0000
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
X-Inumbo-ID: 6629d340-8969-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FS3BikAmEUdHk/YYN/8JfHiOb+ba3InZRmL3U1YgUnDBGprfJR/5TTHY13Yze+HfUqtZTtB1vF9jM8uo+ZuATyyBNysHAXmxNKDt0btHUGJ/y+ktqJE0O4GO5STDlEOVxtGjrqo6JNaC3tOm3x3RVWNtrWeju1qYgaJoO/0ImTIZl42TtmHQ3dIQZ9wnVMdOJw4fGIlKse2IjvpFmLSM4DZeHtsd3EEDO+mz6HUV4ezLDXbfVX9eFji6OEuGE7EAPUXpWmzT6mNwHghcLbNNst9np2fjfW6pZctDpUhPpMWp/BRovX4t9tQX/RUDU4iMjTbLw18vxWErW1DmtPW8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZWDflHyvSXyxnLDpVXI3Lh4doEAtVUGqRgZZsjAyCY=;
 b=KC0B4GZhfDrcJ8Wf76jBEkbxpzu7c+EIllN9d0rzRY13fmOSqZu2c+9r1rHX3FB7WaX8uKNt40c7X6lYhTs9br8GlXsz8VxZuwMxbN0aNky9ULLpvi2KEKte/EFK0NR1I7nvtSg3ChEjfVEmxJ2IF8hq4eaQAr0zD4IVR/VwoOLNGhatiB02SsEsIfbSnKVWDrmkvvbM086L79jG2ehFXtRQ8APr4TV3TrJOGkBl65x/QxW0ddaISwB+ye8Ct50AcbK6c7zGka4bCHFrHcCDLAY3WPNMSvcw5r7GwXrrOCrmjKPQh26vn56akVgjb/myC0ErqiimO66THlqR0ERLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZWDflHyvSXyxnLDpVXI3Lh4doEAtVUGqRgZZsjAyCY=;
 b=bPMXSA4qT8uUjXtoGhm5qEUxw4Lb4E1Fk05FX+3Vwx+3bmMmCkD178GUlnxwdhgCOT8J03MD57BgKVXKKS2txHrsN/E+Nr9qgNSUiwBKjvIdSY2HPNVEiQc8udAVmog4t5ArDZigLq8GyFg0NtbfLSXkn+W+WcnZVDZl9S2xx78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f0b93b4d-b3b3-43b9-bff1-54399311a977@amd.com>
Date: Wed, 22 Nov 2023 19:00:16 +0000
User-Agent: Mozilla Thunderbird
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: Enabling more than one HVC console on Arm64 platform
To: amit@kernel.org, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>
Cc: arnd@arndb.de, virtualization@lists.linux-foundation.org,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW4PR12MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: c4797dc4-294b-4a7e-883d-08dbeb8d46b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M8DZd347f76xnuenAD/0Xh3k4P4cMSB5McbR457Ol4PuAzaPUMOPtZD+meZgX5QiE3+Uo5JTv00kDOE2kKIc1vZ0yV9aEY8/lNR9doQtcjZynan01L6nf3uXdeQC1omTgzC7N/Dxvm22EILD+Hfv1uuJ43PK6AWdme8yIEzDv4eqS2oIrjmOugGmjPQ7m2Ipsmqfx5bAVHafxtwLRjmXOGw0WBRL/huJRTrlFsTYf1hSZXgaDISs/dBT3ramZQqO51j+zVWt6iHxqK66I/U1ILg7QAFqB+xfvfhO8HK7dfFWDu+JO5/CS8mDxgo6cP7AsDVE8Y7PLCXDZ88ZuI/dcpjbGxVYNs141TaG4r3UzLDJovsZ9RJiluwqy/czmC9wvbrI5yBaVjKz/z+SZHw3NErX3ydvNw0hEMgAVM14JM7C6WEq9Nxp4VCW6huYqXbO9kohh0Nt/xVQU+4PKepn3wgY4bwUtgSPH3oydRJeDyYHZtoiuFhgC0Re5Rdwhi60fH4BseUvptDBfIO4ZGo+zp2un1bYSVhSumfAM08gSnFADZN++RDid53JACuepxSrcVRBk6BFHG/diccNBg9NVrYcLFsPvt0dOBtZOz0rWrfF3q7b2+WA+hj+yzqyBxdH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(6512007)(6506007)(26005)(8676002)(966005)(6486002)(478600001)(2616005)(31696002)(2906002)(36756003)(8936002)(4326008)(5660300002)(41300700001)(66556008)(316002)(66946007)(6636002)(66476007)(110136005)(6666004)(38100700002)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUN5a1l2eXQvcVZ5VTdRaGR6eVBVNDRRMVQ4S2NXNGpDWmZUYUZlQkZ4OVU4?=
 =?utf-8?B?aHY4dlNMaVFSM2Z1aXNlTytGT0JuSUlOVzZVcU9UU3BTNVpzRE9zdG03VHlG?=
 =?utf-8?B?R045bERNU0JkaGQ2TmRlcjBHdzhhOGt2S2k2UnhwTm9mQjhVOVlCTEl4WG9h?=
 =?utf-8?B?UlI3NS83SGREZ0wrTjFnNUlNQWx3RXg3bFoybFREUlJlcWQ4NnBLcktHWlVB?=
 =?utf-8?B?a3QwK0xtZTlOdUtJRytlaXA3Q3hmckg0U2FNaXRmMy8rN045Vzl2aHNOMlc3?=
 =?utf-8?B?RkZscUEyU3QramVvL2pJOEhHTk9XbW9zVkx6eFd0c08xdGFkYys4L3BreWNH?=
 =?utf-8?B?Slc3UksxUXZhc3hEOEM5OEpmTld0WXdSVE9hZEVEY3A2K3F0UWllSkhPOHcv?=
 =?utf-8?B?ZGh1eWhkSm9mYW4yWW41Y0hoNHZZL0VRU0xwd0Zpa01Mc3FObWZqbmNFdE4z?=
 =?utf-8?B?S0pnK0JUTkhodVlQNTI2OGVWNGY0eTY5bjVmRVdCbkVvVm9OakMvMlVVTmFP?=
 =?utf-8?B?Y3dmRFEwaXpVakNDeUgxYUs5MlhYRlY2YUgweGI0ZjBhc1VvMjJQS3hTZEpm?=
 =?utf-8?B?Nk90VFZDNDVlOFUyMkJybWJjN3B4TVFmK3J3dm9iZ3B3bzFpTnJwT0ptZ2Zp?=
 =?utf-8?B?THJqRjFKZHMxYnJCZ1M3VVpiVk5aMFN5OVBIUmY2VDlXbTIyazMxQnJiZE8r?=
 =?utf-8?B?VnFSaTllc0d6bkVxYUF0ZTh5dDFNdms0UzF6NVBBQlF2TTRyeUIyQXJXbzcx?=
 =?utf-8?B?NWRKZ21PamllYmxuUUJvQ2d3UFYwOUpKb1lBbFRtUXFxQnU5UENwd0t6SkJ6?=
 =?utf-8?B?NWFMK2RMN3lab3VBMUhGb0FOWHJHOWZ0eFhmTkpDRlFEVUtQMVo5cm5mYTFC?=
 =?utf-8?B?MGRvd2hTWktXK1NjVzZGRG5aeERwdFpUV2tmQndnNEFXbkgxbFJHQXAvVXAw?=
 =?utf-8?B?eW1ocTRpdTNaL0NEVWY3Q0ZUYUNkOHBFV2oxaG0welB0aTVOWGNSd3dGUVAz?=
 =?utf-8?B?dVp5eWx4SVRoUm5kMmFsdXNCVnFpQ25QWFkrZGFlQWYzanJDNkJiV1pQOHR5?=
 =?utf-8?B?VG1GQm50WGxQMzYxOGVpR2Y5NWZ0ZnZUc1Z5UzdadlVSbk8zUjFTR2p1dFZl?=
 =?utf-8?B?M0ZYRjVOc1Z4Qi9hOWtHQlZLUXRzeDFMcUIvMlVvaVRxdm9JOEhBcVFkNWQx?=
 =?utf-8?B?QUpQY0pzYnpTOEJsS21oejRBcEZUdkdPUS95VWtxRE5HcTJ4ejkyMHhhYS82?=
 =?utf-8?B?elBCTlFVazFNaTRkdVRXSUpUSk1MdUtVcUU3NS8zTkNCL2t3b3JOb21NMHkz?=
 =?utf-8?B?ajMxRjdSSE1VMHIyNHZvT3p6VEJMTWNwT3IzSTdOVGRJUmxBNkZRb3ZZYWEy?=
 =?utf-8?B?MGRXN3g5L0xKNmIxOTVxblhwQWVMWVFmWmcxUTdSVGtBR3B1Q240NXFjaDh0?=
 =?utf-8?B?OHB4L2M5dTV0dGNtRHRweHZsc0ErYkVJRnVFV3dZSk5YeVRNV0RKbWl3bmlP?=
 =?utf-8?B?QThNaEhIMVEvSGtHY0JaOWR4aWxnQ05lN3BpbFJ0WWYzSW50TFNKbUJ2ZTFp?=
 =?utf-8?B?Y1U1N2FBdGJXZUZmcTVpOVNrWElvYUZUQndjSTRZdFRBbHZUeStkMDA4bUJs?=
 =?utf-8?B?emREY3RabkFDazZDYzE4Uy8xZFkyendFV3dNVzJ3NGY3YmVuQ2k0YnlvdGJX?=
 =?utf-8?B?bDZ2T1hiTnJFU2pDamVsVDk0R1M3aGE4dDVCdFVBZnRRWDdjZklHeWR4RnBh?=
 =?utf-8?B?dXE4ZW9VbmtQc0o5NmFoaWhZNVduMFFtSzduVnNiSzZuQURhcnZvbHI2NFl5?=
 =?utf-8?B?QWFEenQwUVpxVGNMVFRRNWVLTkdjb1dHSzhBcjJKemtBbXM1MDdZdy84NE16?=
 =?utf-8?B?aUFZbkx6TVErd1hkSGRScnJuODBYSXFpcjI2L0Zsd1Uxd0N3YmtqVWFJVzZT?=
 =?utf-8?B?bFdXRjMrQ3NPNmhTWlMyTEF2dGhreXJEUnZzMElhbnJCdkZ3aXNSeUREcFpP?=
 =?utf-8?B?S3pKdVZzZG0yUm52QUpoZTEyc1c3dDJDbnl0UkhISUdqdFlGdEY1REp5cXJG?=
 =?utf-8?B?eWNhTytYem56MlJ2Nml6Z1VvRGRScGVOMjhrVllzWGd2OWgxZll5ZW13UXdD?=
 =?utf-8?Q?A/R2D7Ko4ylPE9Sby6l71xMaD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4797dc4-294b-4a7e-883d-08dbeb8d46b0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 19:00:21.4649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbHA2M4JrWGeAJAUlRitrYNpkIj5F0Ie8gbqVNkJIu4N2Lb432LalSHu2Bbt4llvFA01UbOnKPYUWHuUE1CdMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825

Hi Amit/All,

We came across this scenario and would be helpful if you can provide 
some pointers


Linux running as Dom0 on Xen hypervisor with HVC_DCC = y and HVC_XEN = y 
on Arm64 platform.

This causes a crash when Dom0 tries to access "DBGDTRTX_EL0" register, 
it traps to Xen.

Xen does not emulate this register so it crashes.

|Logs - https://paste.debian.net/1298983/|

|
|

|My aim is to avoid the crash and let Xen boot Dom0 even though there 
might not be a debug console available.|

|So, I am trying to add emulation for |"DBGDTRTX_EL0" register in Xen.


As a quick trial (may be not the perfect solution), I am trying to 
emulate this register as "read as zero/write ignore" (similar to KVM).

However, I could not see logs to the Xen console (ie HVC0).


So my question is

1. Is it possible in Linux to probe more than one HVC console so that 
Linux can put the same logs in HVC_DCC and HVC_XEN drivers ?

So that the user can always see the logs in the default Xen console (ie 
hvc0) even if the debug console is not present.


Another possible alternative I am exploring is to enable trapping for 
read of MDCCSR_EL0 in Xen, so that Xen returns with MDCCSR_EL0.TXfull 
set to 1.

static int hvc_dcc_put_chars(uint32_t vt, const char *buf, int count)
{
     int i;

     for (i = 0; i < count; i++) {
         while (__dcc_getstatus() & DCC_STATUS_TX)
             cpu_relax(); <<<<<<<<<<----------- So this will be invoked.

         __dcc_putchar(buf[i]);
     }

     return count;
}

Any pointers are highly appreciated.


Kind regards,

Ayan


