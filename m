Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB96B60297B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 12:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424840.672570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okjzG-0004vZ-Vp; Tue, 18 Oct 2022 10:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424840.672570; Tue, 18 Oct 2022 10:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okjzG-0004t8-Sq; Tue, 18 Oct 2022 10:38:18 +0000
Received: by outflank-mailman (input) for mailman id 424840;
 Tue, 18 Oct 2022 10:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1Uc=2T=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1okjzF-0004t2-2z
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 10:38:17 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f811e64e-4ed0-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 12:38:15 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM4PR12MB5771.namprd12.prod.outlook.com (2603:10b6:8:62::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 10:38:10 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::cde6:a05b:5dc7:836]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::cde6:a05b:5dc7:836%6]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 10:38:08 +0000
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
X-Inumbo-ID: f811e64e-4ed0-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2qQrG9E5W1FrmCOLWv9dyUigCmjYVuqhh592gATa91GvXfkchXbBFymb8CR2r4KB76ByGCjQFh6qXpuE4Kr5zUYCWDYJtrTeXzNv3GUJJNix8wUcUEprmdaSilN5L2yCZgVRQ2ZKR0cNxHOl/VDfXrGX3j9OiKk86mqV7IcMWpyHjq3rw0CZD/pLOZcAR2Vm050IzP32r9Jxd+q2PO78mU5gqLQ6tF/cpohBIRzViCiczKxDfhTykWVqbIRpoORhfeR1IJ5/gTF8msQDyvc/ZpPBTzderjk9RvdWbi5HV4C0CrFj+AxEYr3mIFm3CUvvll7yP1usZVxueCJkwowsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvkagyM3KobcBA2b4SMRPB5en7GYIVE5ghqxHNPc/kA=;
 b=L8kvfnXchaPGeiiHmbxcE+WjG8S6nDUpWmxqkOh5JMLniOIFZ6bXVmG3lm+zj5Kap+KUMvAqHuAeoCZfr1XbnMul+mjMpsCatz90FWvM9lZC+dCQ89rrdzv91f4p/9DlFaWaY4QIcaU6bx3BFQ4oxmtfqx77AHi/G/2Sxxv43o5aYnRkhkwP1gR9O6stohmu9SZ5hZ5Z6T0bbIKSjqtDL9vi5QQ+TpklXVsl933OrPTgvB8L9Zoj5AR9V0OR1tqgZv+G4ZUrtNwY1EfCQP1n58e6gZF+0xwFMV/kURSP1IQZULYc1ffx0OdalX4NcwHmt3lihUMs5V36HpwjBzBOcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvkagyM3KobcBA2b4SMRPB5en7GYIVE5ghqxHNPc/kA=;
 b=ZmsGGUDtVKMEUwLqn0pxn5UWIODEO5OwSrgRXniC6L0P7YRcxDSc3uq4B2i4BHPLAR9pxI4/db3KK98ApUzPEN6RQAPBJtcOyhILmU79zGSaxQkTV8EmvHDGgXbjP8RtU0/KllbOjlMU6O1QC+DvAzqdq2knPUy+4xE96st/ESM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b4d413eb-2956-b167-323f-31d82da737dd@amd.com>
Date: Tue, 18 Oct 2022 11:38:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Andre Przywara <andre.przywara@arm.com>, marc.zyngier@arm.com,
 eric.auger@redhat.com, james.morse@arm.com, alexandru.elisei@arm.com,
 suzuki.poulose@arm.com
From: Ayan Kumar Halder <ayankuma@amd.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.ed,
 Julien Grall <julien@xen.org>, "stefanos@xilinx.com" <stefanos@xilinx.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Need guidance regarding emulation of GICR_PENDBASER and
 GICR_PROPBASER registers on Aarch32
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::8) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM4PR12MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ffc1d0-bae6-4d56-d69f-08dab0f4d8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aDGX6oJIyuCsKfy5YXNmqARnKRPnCIVXx7yQTMHTVF5y8ZVRaiABiDduId+OUk+hgtoHZkAI7d+O5L1GQg+nfp7wcfBV3RLt53POL16DOuC5wLI0OCfMJmCy0clYgmw1Yt7lCokqRFouukM7XGS7Usmb58nKJM7EfE+2zkScpClFP2p34NzUv8KxcCOgMLMLV2l81/4/aKMuKPfLQZrnVPJB3hIfb9zU2pCuUdil+1BN+ZlvwdCKZt4clUB6GQg2pQ9PsFjobomc41pMpSWnN6T/wqPZqCJR+pBdGwXmi/BMQHKCWm5osq9btVF5O9Q/fyPWGRLrFbRij0A5ToE6qzeBYDb0U9ATd+93WJ3c8SVV66m0scHyU30x7mGT3f9nuXALZIGPRrFR51zBjwoRLLyZE2o0KUR2LJ0qwOqd/2JDfe6Zb0PjrOeRJj+VvftteYZrWSB0YzGBgugzNDP0Uwqzx75dEabNoU7MKD6xMS65Fsk+lih+q1/8qukt3uzhJT8RXkYmxFeJVHMslzF1wsYC4HJ8JQljIPd6yHDDZKy648CXcCJBPEAEZXrly56zkOuRe7An3rIyeN74ztzNo1DZwoyPEetN66oCrt/OstWxv1UsIRj62K7wvstvOa/3Y7/DTA0tY96bRBZ5GiTMFgzceCrlHvUIe4geBgaTVdRGfLX0GgTDMJpg/aeExdV7jrNymBN+/35Ga4xGvUP3Ac9pSDMO/5h47rvGm5P1H1l/TlqCYlim6V+mjW7QcGliWLRVw81IneXKjGXjI0V8NHS2xVoHZTkw2SVQZ5PsQmc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199015)(31686004)(6666004)(6506007)(478600001)(6486002)(26005)(6512007)(36756003)(2616005)(186003)(2906002)(83380400001)(54906003)(31696002)(316002)(7416002)(5660300002)(38100700002)(8936002)(66946007)(8676002)(4326008)(66556008)(66476007)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU9jWmVrK0RNbHFzS0gzVDhKL3pONjdicWorNGhiV0krUnl6aGh4RHVwSnF2?=
 =?utf-8?B?Z0tmd3dpemR2aDh2TVlWZEp4Zi9la1RiMm0wQkRKNFZab01GcWpwSS9YcDQ4?=
 =?utf-8?B?YitSeUs5OFZQWDlEVHkxdDI0cFhSdEdpb0pYSVpBUWhYdHZkZGVQTzUzM0VR?=
 =?utf-8?B?NHg0c3lwLzJ4REpSS3E5QmxxRGJVMU5sWkpCU29oSUFnOUFaSTBqbnlFL1lD?=
 =?utf-8?B?N2paM2liQmJIOUtaelFONjRzSy9FNnhJMjdzMHN3bVBQOHhkaEZsQzltbTBV?=
 =?utf-8?B?NHJyTVFSTkdsbE9Bc1hmazJSTGtQZnorWHd6b1NJdFZveXBEYWVWODdwYWVJ?=
 =?utf-8?B?aVJyNnIwUks0ZFpYcWE4dGswQlIrWUE1clIyOHI1aVRLUTV0cDQwbFZ5RDRk?=
 =?utf-8?B?UWlRWFJtTTJ3ZGt5TWNkT3Z4NWZYR2grVXlsZUhTcmFpM0JuZXpScElXRGEy?=
 =?utf-8?B?Tk1xVUQ2UlhuK3d0U0RhVlVYSXFWTWwwZ016ZVBkNmZjYk1JLzBkY1BraE50?=
 =?utf-8?B?ajJIc2U2SDVsUTViZWZTOFY3OC8rNVpHRzRVZmhtblFFcXNxcWF3clNhMGJ0?=
 =?utf-8?B?K1Q1OFFOc2s5aGNvZ0ZnZnp2ZWtNMW83cnZIb2RhNFMvbitKV2ZOblFtaCsz?=
 =?utf-8?B?YmdVeThvS3NIV09EV2hoZnRmZWk1aEhId3dncTQ5VGxEaFpjOEs1aWQ1aVpv?=
 =?utf-8?B?ZGVtaXNYbi9oK2RmN3NSNmZEWEc2elB5SmY1OWpuWnJQbUtuY3Q3QXZXQldG?=
 =?utf-8?B?Y3QvZEhPM2xlZHMwQ2ZVWFBwWTRwd2NhVlNyZzEyVHVCQ1JxSkJqa3FVdTlD?=
 =?utf-8?B?aUlncjhrQ1NISXhRbHMyV0M3VE1vOUFXQ3lweFJQR1lzM0hSOG90d2xQR1ll?=
 =?utf-8?B?d2YxMXZtbW1zY081S2JjZnpMZmk2VElibXdrTFl3aUFpL28vM1lwSWJRYURQ?=
 =?utf-8?B?SG0zWVlEdzFCNzFUcUxFUGl0aEhuM3U4ZWdBaUR6NFU0SnlINUtCZWlIL09Q?=
 =?utf-8?B?aHF3T0x0TEx2bE5IWVNkZkMyUnphTFdab2o5TlZzK3F5WmQrbzJ6Qys0NW02?=
 =?utf-8?B?Y0I0UzdMa0FYSllWS0xBTjBBYmpmWFY4VjVVUnptWHFXQ0pDTXl6MkcvdzYx?=
 =?utf-8?B?SUhabXZsT2RmWUphSDVVeEFRdUExSkJaUkV4QWhRRjB0ZmxZaVFWeTVJYnNT?=
 =?utf-8?B?dXJmZ29QSnNqVjBTMHVhemtCVW84bk5sWmNHazdDUGpiM2pKU2pGS0hyUWRB?=
 =?utf-8?B?b0R0aVJMcWRmY1FQdVZWUVY0OUVGeWx5OUVYelcvWjRjWWZyTTFieTRtOGNH?=
 =?utf-8?B?dkFKNFFiSWQxdjl0SXcyQkhZbHFnR1hRVmdXb0x5endqUWtIdW5hYVJYNUYz?=
 =?utf-8?B?VWU4M0JpcjE2bGR3dFdTQnA5UzFta2Z0bEVjdTNqMC9HbEVBRmNPeEVLWHBV?=
 =?utf-8?B?aURLNFV5U2lYWWNDY3RySGt5OU9OeDcvcm1za3cyUy9TQ1ByWXBQcVVRMytq?=
 =?utf-8?B?TzM1UlZoNXU3UjNhTkp2cmpFaGFYNkRVQWdBdlNsSFRmQ0JraDdOVklHZjNZ?=
 =?utf-8?B?K3N0RnhmWXFwSjRXRUdGVGRHbDNGQk52U2FRcndZSGNXZERodmZiMXp1NEow?=
 =?utf-8?B?V1liREl0WS9FKy9HZzN5MStRWFg5dWsvdTFDaGdlRDY5RFBiVWpqaWxNemNX?=
 =?utf-8?B?Vi9WUUlQQXI4NmpsbEU3VmZ1cTN1Qk94OUFKWXZsTVRyOSs1OWc2Y3RtYlBu?=
 =?utf-8?B?c3U2VjcvTnFVVkdidFY1ZVhNTXcwQ1NOdE1zRFk5WkxIUmNYR0l1TytNbjZp?=
 =?utf-8?B?b3J1VUJwaEN4dWIvREF0VTdKQ3BlMGY1Tnl1a1FVNEl6WUdac3ozV0NybGMx?=
 =?utf-8?B?aFA4ak4yZWh5RjVVVFFJUHVnZ1AxRVVEYUFJZGZGUFFJRURqZUQ4dnVlaENy?=
 =?utf-8?B?NnFCR2N5T0tVUEZrY2dUWDRRM252T2pwUWxFNDd5aFlqTDZNclZmQzhjYlhw?=
 =?utf-8?B?U2FpUDQ3dEdoNE1YRkpPcjYyZk9KclJ2M1Q5TkRjZHBoUnd3dWtLd2xjRWlV?=
 =?utf-8?B?V2NVS3VjV1c0M25TS3N3UHNLbkVxNVNKOEhydjBGMld5d1c2V3hna1VlRDBC?=
 =?utf-8?Q?3ascA63wcsXPEo8MmRpYiJDeR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ffc1d0-bae6-4d56-d69f-08dab0f4d8ce
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 10:38:08.4164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLmsNArnU5N91h7xpHvTdYSCw0MHXF0beBHU30RC91SIPYHnTGSJcBDukiKTQq8Q38s0tz6yrdnnl2VHwX8oWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5771

Hi Andre/All,

Greetings. I am trying to port Xen on Cortex-R52.

I am trying to understand whether GICR_PENDBASER and GICR_PROPBASER 
exist on Aarch32 platform.

Looking at the definition of the registers in "Arm IHI ID020922", (from 
my understanding) it seems the registers can be accessed in 64bit mode only.

Please confirm if my understanding is correct or not.

This seems unlike GICR_TYPER which might be accessed as two 32 bit 
registers. The reason being the upper 32bits represent affinity and the 
lower 32 bits represent everything else.


If GICR_PENDBASER and GICR_PROPBASER are accessible in 64 bit mode only, 
then we Xen can't emulate them on Aarch32 as ISS is invalid (for ldrd, 
strd instructions).

However, looking at the following commit in kernel, I am a bit confused.

commit 0aa1de57319c4e023187aca0d59dd593a96459a8
Author: Andre Przywara <andre.przywara@arm.com>
Date:   Fri Jul 15 12:43:29 2016 +0100

     KVM: arm64: vgic: Handle ITS related GICv3 redistributor registers

     In the GICv3 redistributor there are the PENDBASER and PROPBASER
     registers which we did not emulate so far, as they only make sense
     when having an ITS. In preparation for that emulate those MMIO
     accesses by storing the 64-bit data written into it into a variable
     which we later read in the ITS emulation.
     We also sanitise the registers, making sure RES0 regions are respected
     and checking for valid memory attributes.

<<<<< code >>>
REGISTER_DESC_WITH_LENGTH(GICR_PROPBASER,
-               vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+               vgic_mmio_read_propbase, vgic_mmio_write_propbase, 8,
                 VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
         REGISTER_DESC_WITH_LENGTH(GICR_PENDBASER,
-               vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+               vgic_mmio_read_pendbase, vgic_mmio_write_pendbase, 8,
                 VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
<<<< code >>>>

The register regions are defined in arch/arm64/kvm/vgic/vgic-mmio-v3.c 
and the registers seem accessible in both 64 bit and 32 bit modes.
Please let me know if GICR_PENDBASER and GICR_PROPBASER are accessible 
in 32 bit mode.

Kind regards,
Ayan

