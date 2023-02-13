Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B46946C6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 14:16:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494481.764557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYgN-0006RZ-Rj; Mon, 13 Feb 2023 13:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494481.764557; Mon, 13 Feb 2023 13:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYgN-0006PV-Ne; Mon, 13 Feb 2023 13:15:47 +0000
Received: by outflank-mailman (input) for mailman id 494481;
 Mon, 13 Feb 2023 13:15:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRYgL-0006PK-TA
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 13:15:45 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 853102a4-aba0-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 14:15:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6903.eurprd04.prod.outlook.com (2603:10a6:20b:10d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 13:15:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 13:15:42 +0000
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
X-Inumbo-ID: 853102a4-aba0-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/W1mGUsmas+5R96wcRRHp8e2vHNr6MyJYHkMi1mro5lsc1BeFPPzeWzg2iCtddFJZzhqWMjuX1NUfRsGNH911A9rKNyzEnSlmjnxwNGYUgoHgjW7vYc21GWK2ePyOj86GcRY3K+IJNxHxKtd15PoxGuSoo4uZQQw840OlkzCXNJJhsQjRYe3iyb2v5Xzeg3R5DgEYzRih93XLE63f3cItKunWxXq+5IVp0MEuAfTcguX0lPF3/rIx4jsC40XaPPGR/2nrGJSkVntoeHjorJ8nHJ6BIgvhR1S0oThWI8QvWZ0EtYsEKEPiSKwHJTA1v0oAMct72Stn3htTmXQIsTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9QZW/TJgcYW70GPlUd5E60yboVrl3mjfoXh880ekTU=;
 b=gFFRPKF0GPCl2RUrdqj2ccdHPakRI528RmLNPWMIkzm1XJOjT4YNp1lN72NEMGBAtbu8YKc1KwU7gBFnEX9QXMrxy1pBz7aGST4fqYmZ1HNcQUdfoIS2IhmXQnlj3yeIw2ZC/UE7L+4bk0cmt0hfslKQEYRuCezL4q9vqGH2R/ZT1NcCSCGeZuVXFAVq1nV3GP47u13CwVeNpAYFqGQYJObZJ0FN9agSJBxwTQ6Up2iVFqGUfzYfzPJm69pBb6SKG6z6vWKWAsF6vrfCF9vgZEuQjWldwhCEiRagYH20li0/JyIdrBFtGozSh6XrSX4pfv/s1zmSlDm3DBXmrcl0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9QZW/TJgcYW70GPlUd5E60yboVrl3mjfoXh880ekTU=;
 b=3RdDmitA8GtEpYi3FH0ZW8S4MIA6evRKPNF+Hulo2zIoPbfO2BFUkUTxA6UmJUBxo1y43XCCWiNhbs399J+25C4wpHZlVRiy9WP/k1cK8tXviOPQCG4szPNt5ELKg4aa7R8r7COROdMOzWz2H5ZJX7+XdxAs9O2ZvH1sJOTNf12u8CVaTUc1dMYsg5h+x/EUwHKYF60f6I5wUZzeoJ1x2WuKxEHC0KJpXUyi5vl0IoVxi7P5myEq1otLkB6hqWJPrbrvuNqKfz7ZqK6rBfgVbYNB+A8y5QgO6EvoIHTNtv04HdvlBh/nRBlTU+TMSPZ/0BR6S4x5mw9nxbECFk4YwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3800fe2b-6e20-d225-b57e-fdd3553b0123@suse.com>
Date: Mon, 13 Feb 2023 14:15:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3] x86/vlapic: call vmx_vlapic_msr_changed through an
 hvm_function callback
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230213115017.902037-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230213115017.902037-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: c7bebc5d-ce38-4e89-d2b9-08db0dc46835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J97pDUArMQhoob+CDn4c4+Hik+KoIVF8Mb5sSaG3Nyo1lJEzrp0lxwvysDeRPcXaLy8fRyfqyLOyEAkLZsTuuDpT3vaV/mfajfeNLXa97fO4sJg1jvA33d+uAOw8lZUREsGQN234ixSSGtjiad8ZFw9Xsy7WHH9i1ppdeTm9CgPT777VGGhseJAfLR9Ou2QxfqT4v/5JTg0mc1zVtsAvWGIlzKqVpE+SUvdDNus7We1a2qrgE0mTMBssOvM72qmRZ+mpdVYVBbTzgf8Rg87KngYzRSI25yjd5P+o7QSCjDavcpjJG/G4kbi40i+xjffViwatGXenbABuB4lFfnUArm5pXONztKM09uxYDuQlL/a2FnLYwcLh0lTiuAJEAkMbvlTnEn/bnDGmlZSoepv6lR/Oc0BEF3C/xAvGzpPFN0U+7AX+dYZhi00/cOsFlA5Db8NX9TnZF2BtpjjRxCM6ja0HFPEmvZM6YiGeIoFX6sykkM4JWUbPn4duGFC3fEPnhwZ9LIrrgZ3fO4ef29jibyMZRNUCrfglZ7QRdIGiTkCBXkrvOFm/b98fatTQOLQg1OCpAGgVs3+PtOuCeLnWxfHsoa+k6m63GKHknXHD5lW38/kvStJx9CVHqHArK8JD4sxoSLYM8ZnfhUsab7g/0pZyU7vVjFEX/VTCTddvODufoJzvRhs33I3/EKUbqJA4uF3joL2GdBnOEwD/r93/EAdP+/S3zQLKfwmhpoZljOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(396003)(136003)(39850400004)(346002)(451199018)(6486002)(6506007)(478600001)(31686004)(53546011)(31696002)(86362001)(6512007)(26005)(66556008)(186003)(316002)(4326008)(54906003)(2616005)(8676002)(66946007)(66476007)(6916009)(36756003)(8936002)(41300700001)(5660300002)(83380400001)(38100700002)(4744005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE11NTVrcFVuTTY3Z281NXQvVytzcE9kbFdmclZXRjhmYzB0ODJRVnZrRGZq?=
 =?utf-8?B?WXhZcTZ4WWdmbXFDdjQ5TitqVmRscUVPQmFMcnlvQ0V1MzlvZGRVVTRvYnBM?=
 =?utf-8?B?ZnJ1Tm9lNWk0QWhhS0hNZTQ0MkZTckQzVFZTTmVxbUY5M3VQa1orckpnTWV5?=
 =?utf-8?B?anlhd0lqQ2t5Y1RhMktjMGxlV2ZlK0taRENNcmJaSkVtcldPSmMvOUxlQXpO?=
 =?utf-8?B?WkkvV1FuQ2xSTHZyOGdDRGQ4eHNrYmxWTjFQYTY1NlFYdUNiYXJUZXovU0dS?=
 =?utf-8?B?VXloM0VlNkJxTE5WeXI1L2UwU1RNc0Erd0x2TnpFeU1BeGRJMjhrN0JqaWM1?=
 =?utf-8?B?bkl2TEExTHROK2swT0h2cUN2NVdtdCtxTVRUM1cwa08vWGRWQUhFYzVndlQz?=
 =?utf-8?B?NlNWRlFSYURLcDZFZjRwbklyNEpYY245TEpseC9uTUh1UE9WMlVYeVRNRzBZ?=
 =?utf-8?B?UXEweTZUWEJWRW1MSnZmSjRSRTJJcjE3cFVmRXBnQU1wVVN0SnhJY1BKeW4y?=
 =?utf-8?B?N2wzRWFUNzk2VmlIZ1RtQ1pXRlBmWHg2bTJnS3ZNa3d4S2RMUGVjbW1OcWxy?=
 =?utf-8?B?UjZNRzh5VmpUa2lQaEk2MDZYMjdpY2ZCZGhVN3JiTGNUQnNzMndKc2w3WVhr?=
 =?utf-8?B?bVhTWlJwRTlwNFAyNE5QZ3AyM0Uyc0R1dE1VZWcrbUpWOXprZDBscGkyVzZJ?=
 =?utf-8?B?clBLQkFtQUdadVVVWGJwYVZuRVAvclpHcHBHckRqdUdRL2pYb0dlYmM1NjNP?=
 =?utf-8?B?d3J1VXVGMnNmbDZpYUVEY1BoRU0yQTRLcVBZZ2tERUdHRVZ5S0kvVGdxeTNr?=
 =?utf-8?B?SEgxaEcyTnczaFcyeUZZanhIRHRoMURlZW9yVDVhb0hCTXRSQVFwU0lIWFds?=
 =?utf-8?B?aWhBMXJvMmVJWVZla1lsaHJTclJ3VXVNdmZYMUFraEROcTcwWThwUjBSdmpV?=
 =?utf-8?B?Sk1GdlNYVmFYOUdGbGNoMVVjZmpoNjN5anRIOEgyRTZGdWErV0dzTGRzWm9R?=
 =?utf-8?B?U3BRZmJrRCsvbW9BdHBVRlNOSS9OV3Y4QSs5bTU5QzFkWWRCeWE3KzBiOWF1?=
 =?utf-8?B?czY4VEN1K1dmTXFLVndBMWExdUc4U0FMbDVTQ1JKZUZoMG4vMnlsK3ZmdEE1?=
 =?utf-8?B?NUo4NFZYQnROK0dobXZVSVFLUjRlS3cyMTFMT3I1NnQ5YUNsNXBjMHVKa0ZD?=
 =?utf-8?B?VXZUQnhFbXF4aW9EZG1oSzZJTXg5OEdrV0NTVHg3Y1paRGQzMHNZb2tpUGsv?=
 =?utf-8?B?eEFRTHNyQ28xd09INFJoNTJMdjkwbkNQRURXVFEwYXMxWVVvTVZIMVhNT3dy?=
 =?utf-8?B?and6SHdNdzdYMnhvVE9DaXhFOG1YeW1LWi9wVTlmRGtlRWlnMXVVREtIbXJU?=
 =?utf-8?B?dFJ3VjRKV2pJT0RYMW9zNnlneTkxV1pMQis4dzJ1T1F0NUN6MFhld29GcVRw?=
 =?utf-8?B?cCtCZGJMNUJyQ2NlcUY5WGlpc2I5WmxVd0dCNFNDL3JvRm1iUDVzY042UnBu?=
 =?utf-8?B?M3dWVU9lbGMvOXZQNklnaDNJWXVXVFhSMS8ra2ZuM0xvalhNVHRzMmJ4ZEVJ?=
 =?utf-8?B?bnZaMm9qMWVPQ3F4ZnQyOTRWV0ZNcndPQWlibE9zZGc2bTAzU2kybzFXT1Vu?=
 =?utf-8?B?YmVsQTNjbXRIeEZybEdDVHR3aDk3VTVsNmVLMmRpd0dtTnNhS3B2bG9Ldk1p?=
 =?utf-8?B?QU1MeFIvdVRia0JBWnBZRXR6ZnFKejJSRHpkdWxLdlFEdHdPdlY4VkJBK3ll?=
 =?utf-8?B?dzlHMXZzTFpKUlY3UUxoR1VpU2tLbkFjYUpoWUg2ZnQ4NzhzL1pnWUkycUtt?=
 =?utf-8?B?Z1hnODIyNHlBc0o0b3p0MG1vUVR3clMvVFF3RWM4WUNDNkZYSjgvZU41eXpr?=
 =?utf-8?B?VWZ0dW9TSXZ0UGtaNUk0U3g1TU5aTkxlNnFJVHZDT0xQQWRkNCt0aEN0V0Uz?=
 =?utf-8?B?UWtDZElWNjNQT0tyaDR5WVJDT1dCdUdFc2dzaWF1Z0sxamRDS3NrUksrRGJx?=
 =?utf-8?B?TUVjNXZEem9CM2tIaG9XTThTZGIzYTBLVUwvdzdrSmF2cnpvcCtsVmR0Vm52?=
 =?utf-8?B?UHkzSzgvcmhITjljNmluU092czBlL1M4RWl5U1pNSU1rVU9SVWk0NFUxMmNH?=
 =?utf-8?Q?mR0uI67GuSAFThLSRZ/ay0msM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bebc5d-ce38-4e89-d2b9-08db0dc46835
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 13:15:41.8040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJ8JOIUi0nizfRaavhlqD4oioRgmhnEP5ZYYoyrwBeZ8rNMtrYxG9Idhvn0Iq7kF5g+FUHCTlvfsBe1JuFa3uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6903

On 13.02.2023 12:50, Xenia Ragiadakou wrote:
> APIC virtualization support is currently implemented only for Intel VT-x.
> To aid future work on separating AMD-V from Intel VT-x code, instead of
> calling directly vmx_vlapic_msr_changed() from common hvm code, add a stub
> to the hvm_function_table, named update_vlapic_mode, and create a wrapper
> function, called hvm_vlapic_mode(), to be used by common hvm code.
> 
> After the change above, do not include header asm/hvm/vmx/vmx.h as it is
> not required anymore and resolve subsequent build errors for implicit
> declaration of functions ‘TRACE_2_LONG_3D’ and ‘TRC_PAR_LONG’ by including
> missing asm/hvm/trace.h header.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



