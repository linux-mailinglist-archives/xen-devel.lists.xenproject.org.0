Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEC26BCEC9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 12:55:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510519.788326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmCW-0000a5-Eq; Thu, 16 Mar 2023 11:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510519.788326; Thu, 16 Mar 2023 11:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmCW-0000Xf-BW; Thu, 16 Mar 2023 11:55:20 +0000
Received: by outflank-mailman (input) for mailman id 510519;
 Thu, 16 Mar 2023 11:55:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcmCV-0000XS-10
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 11:55:19 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ab783a0-c3f1-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 12:55:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8863.eurprd04.prod.outlook.com (2603:10a6:102:20e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 11:55:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 11:55:14 +0000
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
X-Inumbo-ID: 6ab783a0-c3f1-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUPusq/+BfYujWs1RANMiLqZ2sW6xDi7EQSXI8yISKNnXFHy7PL6vJaAUwDU0+ClnUdKFIxNOHntSvL3rtoC+colamVAkxNnIWq9dJnXalZm2P+awEgq1rOfWA/Vq+YF0H3dTqIWwLvpJUpxjiSERDinM4OPYebNtz2BP3AMmdBpdtiOcrn0Z8cirGLvs2nG2GYAyaNzNZEkcuanMx0QJygy+8BLSlQcF4MOCxHY3JEK0n+E5vRsB+lGLyGYy/7lrmTHRlSI/ahJETcG5UtLrNah9pxccWU8SCmYhdTil9lU/tHceFMdexHX42/+WfEBkrwXiQPNVNLDETxTtXE9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGnmrU/GN0A5AfAnkaSaGxPWEurVOv/cP25RS/1DKKQ=;
 b=jHNAAXjWSc/A8VHLouBiGhLfQT0bZA7z45TjFSzH7StkfzZi+90N9dtogj70iqjr6unF06TJxEnFRglXoeYMvAu25oOfHFqVqv70pnFqqLMO/LseOuoSci3eyYJp9ovlqPZ2wVnQF1+CpzsMb4v5GKHYB2CTP+N1gL/CyFKqdhgruPXFKdmoeRNwLRaaHNmggM8mG4S2GMK9a8W99iPywnwx6GvKr+3Rg8+/ZCLGuX7yHxDxqSstMRt5/v7/Ff38OTBqPO5VqyHa4fNuLfDQo0skrN+jQMRk4MRf5rFUYFcKYX+VUxw+cotvh1rMzUsDo8wGTvnMCKt8jzrT36AYVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGnmrU/GN0A5AfAnkaSaGxPWEurVOv/cP25RS/1DKKQ=;
 b=vlZdRfLsSfoVbMmfNxHRCgrutdTxaiPjPK7HHBv0igidHIAw/MTO8j+xj8OwWx0tkW9Pkd79MhTaa9NIr9EcCvE54JyTLoD0szl7Z1VgXQaOp2ijgH+crSmjS7TUZsW1e6apEWWTbY2C4uzGl3twoHdUg6a8QoYDptdH5WKowIcdLfPf3DwWszBWNSDUYDgtIBjKxq8vh31FYHmDuKo/uSd9+uNdSf5MTOaJfg5P69kpnrb0T6SjsDKuAy2bEyyD4PhlmmecfSOA4W+vzATidtdJCFhxcYyDCRFXRoosEpCNqkvCf6pc7KHs3erskhemt7ZadXCpl3xXHH9kYSkR3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc2156d8-76d7-b6d2-3d39-266dbbf4a0fb@suse.com>
Date: Thu, 16 Mar 2023 12:55:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] move {,vcpu_}show_execution_state() declarations to common
 header
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8863:EE_
X-MS-Office365-Filtering-Correlation-Id: c03f3207-9fb4-4679-fa03-08db26154db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o71YJRoyVv0mDqxe3Fc36F2wk02luTVInxF/DS7THciIwH1BvWITz8RSNmyY7kRpH0jMeFruI5ql6okPfQmxOZwqVuPfkF147MBLpv3I9HkOZfzt+4H4VH+sy6T+PVeeAjKSGhwanZHyQjQkzde9WQz0xfpCgVT18QRaGsMNUOHbJ3HK9hUa74KSNJZ9LjNyotktT0lMAUUNgS2CGstnw7KOkl4oSYLiINzvZTVnDTNGHW2ag+8xVe8r2yShzbaGMRUul7z/g4ek9Oni+inMP+mbA4tAfi7m3BWMju2sg2960jKdr6NvaplKHV+95+wm+6sQXtaXUgsx7rh5GXcb+Tt5oBMI17mer0NBsVYkQRG/H55Nhqm8Hm7MrNV12oTrdeO2+XhHJiHb064EPpPfwyd5tNUm3/ZQlcepJL5aq9ED0JYsv+z2biSgPE0APKLUmQlOgj9YYufvN9IPLwV/dOsWQN9YE4dcXP73VmdVKROYVuUVP9H5crf/GMpICXois8HEmDFL3oB7l9yzlJHzrdrIzAAhB0jrLvVXw/CyvCBlc7Z+EPVDtQzEv7BLNND03w57YkcncaZzRVJG+iM0bk9pZxYD+OR61WoC/QJO6MDJbu2FUzPInip60A/rKHM33BqczPGv6Kr4Wvk4RpPikUJPWGTzyNse8SJ6lSw4xyTTT18Ez25eZnMzaPhNUXkoGGIeZKg1ImRzoEa2Ip9v8kw6mzM3Z7K8LfI+Ryl4aWc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199018)(31686004)(8936002)(36756003)(4326008)(41300700001)(7416002)(5660300002)(31696002)(86362001)(38100700002)(2906002)(478600001)(8676002)(66556008)(66476007)(66946007)(6486002)(6916009)(54906003)(316002)(26005)(2616005)(186003)(83380400001)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG5EbjRpWUpRdnZ2aHNOQml4eW9PN2pJeXZhVUU4WkQ0T2N1ZVM1VDJSbnV4?=
 =?utf-8?B?TEhCUlZyYllONWY0RTgxcDNNY0dQd0VkTVlGaTNDY1IxMEE4U1MzMUROVGlW?=
 =?utf-8?B?TC9nNzJ1QUFOaDVab0ZEb3F6SmhOenhUWEFSRHZDb1ZHTVIxdFhrZHJzK0p2?=
 =?utf-8?B?QnVoMDZWaENMMUNSWEx0dENkWWlmZXVBbFIyOVBLSG4wemQ3OThrUW56NVFU?=
 =?utf-8?B?UW1aN2ZBbm0vaG9ZcmtpWU0xd0RlVW1VdW5pWEF3WWxVMGNDWlp1SE5SMVRu?=
 =?utf-8?B?TkhPbmxIaHhYLzZOcnh1blFJS1BZbFNrbnU1bzFlQXBHV2oveVIweXhQRHd0?=
 =?utf-8?B?bmp4UGZRT1FDdEJVOWl3aUlJK0VWRkFTWlA2dk5jeG5CV01TQkJpdWs5c2l1?=
 =?utf-8?B?QUk0OXFjUFI1SDhRa0ZmOXlndElOZnoxbHMwb3N1U045VUE1RVhvMlFDQTJj?=
 =?utf-8?B?L0hITWgwaHNyVXJnamI4dkgvek9qODlxRFpIcDQ5YkdwV3pQVXhWSjFyZWUv?=
 =?utf-8?B?RUdDeElhelZpUlZnc1l5ZzJQUVkxRWpQUCtBZWRjeEluaFNWRjEwYzE0RXNS?=
 =?utf-8?B?R09QdjcyUVM3TUJtRlJmOU83KzZXeS80aVJVaEI2akVpTE9TQWFVK3I2emdJ?=
 =?utf-8?B?RW5Ob205RmFyd0RtOHJjUHMyaFl6OW11Yi82cEgwU0xqQm95R3I3aklLVTVz?=
 =?utf-8?B?d25zcVBvdGNtZjh3Z0pEeXlVZVJUZUdPeG82MHpqUlF3WHBxV2JxakhKU1dM?=
 =?utf-8?B?cUZFeDYvVWl2T2RBcFNvR09IQWpLWDAwZVRKNXBJNVU3VW5yRlU3bjR3Z2Rr?=
 =?utf-8?B?RUVBSisvaktWY1pTMjZSVXRMa1E2Z0RsVU5vTlFRRjhMY0pjMFZkeXV3b0dC?=
 =?utf-8?B?OE00VGY4RDhuR21uWU5XdXNEb1NnYTFLZEJLSVBpM1ByQklJTE9OMGdremMz?=
 =?utf-8?B?bGhHNFIrUjNxa1RySzNEak5IMU9FNy83UVc3b0Y3eWFZN3cxM2dtVVNteXRy?=
 =?utf-8?B?K0ZyMWJGdVZBeGJzK0tMc0lhajlhcVppb3pLckF6cEFubngwekpoV0pONngx?=
 =?utf-8?B?U09qeFZqRDVralpPWi9teDZjajh5UC9XRWdGZmNMSmhHci84N3hLcFZDM1kr?=
 =?utf-8?B?dEdWRGc4MkFteUxDamNtZjgwckVzWFlVQjlILzZ2OGpyQkkrZ0E0NkEwS0c0?=
 =?utf-8?B?SlZ3NHpWZ05tQkhwMEltNHoybER4S0dHK1BlZTJQT1pNRjlFeTN1MlVNUEp0?=
 =?utf-8?B?anhKK0tUVS9OMHJ4T3VuYXkzQ0JGZ2VrRWZ3TGVjSlRySzE0Q0k1eS9jRkVP?=
 =?utf-8?B?UWV4V3lkNWRkSk1KV1lvNGhLWkk1Tjk0UGdqL25KWFE2WHU2TG5RMjFMTGcz?=
 =?utf-8?B?cncrYzY2YnNYVm4vbjM4VEJaZ2xnOVFrSThURldMUlBKMnQ3S0xsK1RBS05O?=
 =?utf-8?B?UENEejhtdmVmWUZOcjdCUWR1UWtyMllXRE84OW03bHNPdHo0bVdNYVN2Nzg4?=
 =?utf-8?B?a1JhWXI1R21laDhqRG4yNU1IY2ZrUEI1K0Fpd05jeXh2K3lTWmtCT0oxbGxY?=
 =?utf-8?B?QWJRWmpoeWNCSXVLV3VBbm93THBHRnNFSU5PVk9KOGxjOVVhR3pJMm5PNTlV?=
 =?utf-8?B?cTRoZzUyVm1MNEpPS01DUkRkRVo3bm92NVZBM3VqZTZaZXpqNEIvdjJQR3ky?=
 =?utf-8?B?VlF2Y0JOZCt2MVV6SEM3VEFZVEphUFBxcU1ybUIxWmxYMldIc3Q1WVQvL0h0?=
 =?utf-8?B?blZPa2VmZTBDS3dzVWdvSkRFWC9qS01uaW1TOEluY3B3U2wyWGw0d0FSY1Zu?=
 =?utf-8?B?VUhDd2VaVTlIMG5kTGNKNk9uaDhZWk9rYXV2QjRUZHlHRWkwNVhqTGg5Szh5?=
 =?utf-8?B?NEpRT0FoakRsR0o3dzY2ZXhiK1lRTHlXeUQvOGJRMWxvSXhYbVFlOFdRQktM?=
 =?utf-8?B?MkNoR0dHd3N3dWlqbmVQYkVBekZKUHp0N3J6UEd0S0doeGltQ05LZTVhT05S?=
 =?utf-8?B?dm43UDNaeVRTeVZQOVRIWW4yUDdxT1RlK0tURHNXRGNTckNmdjUzT2pwWWxx?=
 =?utf-8?B?Z0FNNWxSaG1sMGg1VS93QVpVQzl3Y21Jb2hkMzU1eDAzejRnWnlKaEZaUDJ3?=
 =?utf-8?Q?vyvW0k4O1rRk/fVDZWyTDJXu1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c03f3207-9fb4-4679-fa03-08db26154db3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 11:55:14.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEgmVG04pOz8fkO8biN/F9Z8+meH+BA9oGxJL/GCtCsgiiFr+dqKzSAHbwfbWszO5ezeYMnVwedVemQ/6ROLwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8863

These are used from common code, so their signatures should be
consistent across architectures. This is achieved / guaranteed easiest
when their declarations are in a common header.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There's no really good header to put the decls, imo; I wanted to avoid
the already overcrowded sched.h. show_execution_state_nonconst(), being
there solely for dump_execution_state(), could of course live in the
upcoming xen/bug.h ...

Is there a reason that Arm (still) expands dump_execution_state() to
WARN()? Without that moving x86's show_execution_state_nonconst()
definition to common code would also make sense (it could be done
anyway, but then at the expense of introducing dead code to Arm),
perhaps (see also above) into the upcoming common/bug.c.

--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -232,7 +232,6 @@ struct arch_vcpu
 
 }  __cacheline_aligned;
 
-void vcpu_show_execution_state(struct vcpu *);
 void vcpu_show_registers(const struct vcpu *);
 void vcpu_switch_to_aarch64_mode(struct vcpu *);
 
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -557,7 +557,6 @@ extern register_t __cpu_logical_map[];
 #ifndef __ASSEMBLY__
 void panic_PAR(uint64_t par);
 
-void show_execution_state(const struct cpu_user_regs *regs);
 /* Debugging functions are declared with external linkage to aid development. */
 void show_registers(const struct cpu_user_regs *regs);
 void show_stack(const struct cpu_user_regs *regs);
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -681,7 +681,6 @@ void domain_cpu_policy_changed(struct do
 bool update_secondary_system_time(struct vcpu *,
                                   struct vcpu_time_info *);
 
-void vcpu_show_execution_state(struct vcpu *);
 void vcpu_show_registers(const struct vcpu *);
 
 static inline struct vcpu_guest_context *alloc_vcpu_guest_context(void)
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -464,8 +464,6 @@ static always_inline void rep_nop(void)
 void show_code(const struct cpu_user_regs *regs);
 void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs);
 void show_registers(const struct cpu_user_regs *regs);
-void show_execution_state(const struct cpu_user_regs *regs);
-void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs);
 #define dump_execution_state() \
     run_in_exception_handler(show_execution_state_nonconst)
 void show_page_walk(unsigned long addr);
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -107,5 +107,12 @@ bool_t is_active_kernel_text(unsigned lo
 extern const char xen_config_data[];
 extern const unsigned int xen_config_data_size;
 
+struct cpu_user_regs;
+struct vcpu;
+
+void show_execution_state(const struct cpu_user_regs *regs);
+void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs);
+void vcpu_show_execution_state(struct vcpu *);
+
 #endif /* _LINUX_KERNEL_H */
 

