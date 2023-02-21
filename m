Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5AC69E145
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 14:28:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498898.769849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSgB-00044D-6z; Tue, 21 Feb 2023 13:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498898.769849; Tue, 21 Feb 2023 13:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSgB-00042M-2b; Tue, 21 Feb 2023 13:27:35 +0000
Received: by outflank-mailman (input) for mailman id 498898;
 Tue, 21 Feb 2023 13:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUSg9-00042G-JM
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 13:27:33 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe12::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da16fe2-b1eb-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 14:27:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8298.eurprd04.prod.outlook.com (2603:10a6:10:248::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:27:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 13:27:28 +0000
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
X-Inumbo-ID: 7da16fe2-b1eb-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0THMarJaoI+GZ/hSfVadZ2h8b+vlXevNBWxh9J7D5EMhjHNMxm6OQQww6QZoK5DMgjEwMNOkautlncJRztrgnAPjSNimvlHVtnUiEg0U31RNT8JY605fkDGg5M5TS97ygjJVMyNP9QG5aWs/uwUTJEuu57gOBCvwE/EaHu0agO4xHnpOf392wKYFagriMPUpMWAEkd3qZ/DcFoEdMjl+vCPbI9UwCj6g6FFPaTXY6mh0zypszwfK96zQiSFgOdVh+69faRbQ+38f5Y/HaUR+bo+gYc8Ycua7JTJXE49Ku3ohQ4TMGJTkeE85fA91vLuLkz98Fu+ICiB8C98wZdpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9qlElWTRRv0iSVXLMjPiy8BHJYHZmIhdJ27iGx102g=;
 b=QB/3zvvSEfER0utsLjwoTSNOk3tK8o7l84Ib1OsJeq6TcFgetvxzagDsUkisqlKB1gUjhVI3S2Vkvw7XB0K+OljTAyKG/lFe39xa4FvpOYKupQK0xKQ3uCPA9eS9B8slDUjrdhN5ddUPYSLgLUqaQeJHY8HXGq5vBPvFj0MkJGMjohdK53pFae6CI0a9BAgaLyWQlJyYxFoG7z/p1tVZ4FNFWsR+56nWZM6Hkjl88hgzf03KDjBrpU3JRJvBBunl6dk15ZZGAnhKgLjVRmnGkq3O6iQFSl8Fwqz57w7xytcQeCEGLJG4PE9T/91+TbS42vjz8wIt3aEBjPWlK0ivag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9qlElWTRRv0iSVXLMjPiy8BHJYHZmIhdJ27iGx102g=;
 b=At/fRDev8HLzOeP5h/UFwRLJLTXjMN30EOjw5mS40sNrMF6i8q19eZ9lXGLc+an4p1XxktDKRLQl5DRQhLRdN+aolejVtBlCoVGAh3HczHowJJwUN2raUvVA050H0PTrOExc09ZxYRluHO9Bf8uRFhNN1z4de+SvAgW+02fZsBn5SO2ltq4syWaXy1F/uWxSOuLJ+WFQmTLDuqzsYs3oHkyF8pqj8Gz+xseuV53h7lFcawL3Gp2wmoBe3XVe9gW/JDBJvnXDIqs2z4p80lUPuN8Z9zaskh//jRs/+CdUWU+PCDk/pQISCXc3eEx73ZiFq5ocHIWrXr3y6p+hH6+R9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b9de55d-010c-2498-2956-98753a6cb34f@suse.com>
Date: Tue, 21 Feb 2023 14:27:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/MSI: use standard C types in structures/unions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9b886d-eba9-4c3b-9bde-08db140f60ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5kri2DEhmFqfOQmM2bnx02hcNXq3jUrWcxb7tB9t749g1jkm9f1D0cHGNPCi08CZ+H8F1fPgJGUKpBGbiLz/tcnaGoZOEXNoe0P9NkZdx4fkDrm6QI4a63X0Omi8sY9tlnaC+ORElgzixcugnnWqPMhd7i1ZDp66AwjAQgAgqvKdaA362sWNKtY9Dt8/MLpccPia6s5/u2TMdS7Uy5cqvsT2AYhOwJuNK7H71/wC35TKNzo4ZZxVAV2mEZUtzMB4lmpsV9TcIYtl6oIaz0+E2NZwHCJRjIF0g71qBni2b+54Wi6hIG9hBFaUDu8lsSKHfA40ljsIVYIbEpavLCVG48KqTDfZUEVMNlt36V1hC8sqGD3TYyLfw3tEiQ6SqeNXEagbsubZ3K57Fy2w09lsiY4cHxcNes67Zly7lxpBbBckERvw1zBxrocptNNfWa0jfh0vJK10J0jtQy3q0EW+j9xjbU15nsRNgJRsDOI/J36/znjht+dFulBkIwkYiI17g9GvMAMlGVlZdnBusS44msAhospPwsDP+KKLtFkS1ntPYIIzx5GGA+P040DnCKQAnJSdmrl1YJcJWqp9BLFyprUGtbz+r8SN/aau8OqJLKrnI6GieYvvnQI/3/xKVO5zIXk64DYeRKQ8lhwDehmvMpHGC5QO+NzuLGeOfKcOrsOx2W++I81JmiFAXTAzKecdcYFJd95eRoSKl/FW188yNuWDkkeScQsmJ6uu5uj6mIs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199018)(8936002)(5660300002)(38100700002)(41300700001)(2906002)(31686004)(6916009)(4326008)(66476007)(66946007)(66556008)(8676002)(83380400001)(478600001)(36756003)(31696002)(2616005)(6486002)(316002)(54906003)(86362001)(6506007)(26005)(6512007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWM4N2xmSUJsM2daRzc1MWRSVW42dGhmaWh4ekJjTXUyUEw5RzYrQWh1aUNj?=
 =?utf-8?B?M2JRTHY2SHRsTHVoYWRrV21xWTRzTitrcWU2WCsrZUM3RjRUa1lpeVhDeHow?=
 =?utf-8?B?Q05zcmpzZFJQdnhxNm9maUJIYy91Uld2eXFGQXBVaTJCOGdWLzlnK3g0Tmpt?=
 =?utf-8?B?UW45enFrQkg4ZjZDSWtPeExWdXdJbXhEdThQaDV1ZEV2a2JOeForNFdKUUVG?=
 =?utf-8?B?SG9raWxMTWxveGs5UDg3bWZ2ajhSSlN3WXpEalpxQnJ5cC9YNlZHUml5OUF1?=
 =?utf-8?B?R0Y1WFFQV1U2K1BDWkd3M2syMHh5K0NaZFBxMnU2SVhoWTZhMVBOZEVSajFC?=
 =?utf-8?B?QnpWbGdaQ0FrOHpHdVdFLzgxaXRIdmhnQjUrSzgrYWF2K1R6S3N2eGFFK0hk?=
 =?utf-8?B?aTByMDF6MTVRMGZtZllhRmtLd3l6WFp5d3M1Sjh2dEVBcHRMa1I1NFFXWGZI?=
 =?utf-8?B?aVpZNlVJS1ZKSDEzRVIvRUQza3hKWEM5c1g5VXNPYU10S1Z6cXA5VGhxRFl1?=
 =?utf-8?B?QzJrc3g4Q2REWkQ3aFhTNkpaK29oVzJmN29vWVpYN1U0STlTSTVkaHE4RFVv?=
 =?utf-8?B?Qm83N2Q4dlh1bUs1ZE5hTDBzR3E5MFVwMGZ2cUpRc25tV2lMUDVpNzJRdUQv?=
 =?utf-8?B?WXNGcDZrcVh4c1Y3dUNtSXhxVEJxNXlYbTQwUkpKSHg0T1hOeUhpVUFlSTg2?=
 =?utf-8?B?dE8yZUdHM1JnZEd6KzBoR2F5MU1tdkpWTDVDd3dzeWVwNWIyR0RNbUNPY2I5?=
 =?utf-8?B?Mk1Ed3FzaTNqQURNL2pmdkE3ZXhFR0lUL3pZdTNWUVFZN0dqZTd1b1F5eXg3?=
 =?utf-8?B?RHZZNExRVExXTkY3aFgrSEJKZWRzS1h1T1E5TWJJbkxUeXRyeVRBYlNoSElr?=
 =?utf-8?B?L3VZaDc3L1c3L0hiK3VEM2dPM1JoWjVZRXg3cUpVVjNKSlQ2TU14MW4wRUEy?=
 =?utf-8?B?VU9jT2E2UzNOK2dIZjR5Y2ZhU281MkdGdTdkSFBjVXVhM3NkOGcrYTFHLzZo?=
 =?utf-8?B?OEkzUzdhK3EvTElJeE43NGRPMy9oL0FwZ3dNQmk1WklWdkMwbnVJUVZTOXYy?=
 =?utf-8?B?cldabHZNUUlPMGFzdUZkVnZvZ0Y1VGJTLzRtbGZSSHJ5c0FyaVUrMi9OZXBk?=
 =?utf-8?B?WkxkdjdyOFMrQTA4Z1lxWXQ2UllKamgzMFQ2Z08wU040YjdDdW04bTZBRkVr?=
 =?utf-8?B?RmJoOEpjeDhncGtOYkF2R2Nybkw5VDY3MzN6NXplanNuSDM1T2ZIVjlIUmI3?=
 =?utf-8?B?Vk43VDFHSDVNT2ZML3ByYVVxTFJoSURtNmphTlF6N2sxTW9UWndaZTFIMmll?=
 =?utf-8?B?dlhBSnZORjAwcE9XU3dINmxFQmc0cHd6OVRVWVVSV2kvb3pKN1Y2VUZZc3Zp?=
 =?utf-8?B?SnlVSHVocU9rdklTblZ0Tk9Mc2tjVDR3dmJTQVhQckJGU09JeWdwTlJvQ0Za?=
 =?utf-8?B?bXRDcVRsWVlVZU1DYXBCYm5KZm0zRzlrU0hYMTRaVEhPZG5YWmZxUXZYekNk?=
 =?utf-8?B?VmN1dmRjclhvU2t2MGpQVkYzOGU1OTNSbEJLMWFzTTJXU01ZRUhqRjhmNDFn?=
 =?utf-8?B?Rm5WUVJJTU5leGl5N0hJMXpRcjg2ckgvbndCdDBzbUJmN1ZJYlgwYWNGaGc5?=
 =?utf-8?B?dktyclR1WTROTFcycG90cDVpZ2ZkWHFkUmpjaVYrRUJGUnRmbGpUb1hUUm1v?=
 =?utf-8?B?T213bjZSWXlIcGwyYUUrWTgxMk42WTRMMVpBVmZWdlNXS0F3TkJiVFl0d2x6?=
 =?utf-8?B?a2N1UHJwTzB4dFhKOVJBVExVUjlQUGJhanJTNURvaE1oV3RzSG5ZUFltUk5H?=
 =?utf-8?B?Rk9NVWhBaTZkRjFUK25LN1dVenlMMDV1REk5NUZRcFp2bDhHOUVVd2d5RHhp?=
 =?utf-8?B?RGNQVFFmQVFqOW11UlFGRmhIVC9OdkpvT2dIVFZaT0pMdGltRU1oV0RSVjJu?=
 =?utf-8?B?SE9zMmFMNUlYMEJJbHRqb0pLVTJ1ZkxEd1YwQVBzSVRqOFlvVzY1ZXc2V0VR?=
 =?utf-8?B?YWZWTGhlOGtoNzNjUkhjQVk0b1JJYmZwZ21mQUJRSnk0ZUpKV2dQZ2RkTmU0?=
 =?utf-8?B?eXNvK0F1N3doQlRMQVRyUDlCNmc3UnNEUmZacy9WQm5leGZJaE90MDMraVpF?=
 =?utf-8?Q?heK3WUKi3YmRa3ZGErulhSr1N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9b886d-eba9-4c3b-9bde-08db140f60ca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:27:28.5419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIS/L8Xbczt47IKPnORukEZNOYfbPbqvaYjIBRHVNnMGTUv76vnkgqyX1u8gXNsYp7CslbJj0hgReE8RUoe6Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8298

Consolidate this to use exclusively standard types, and change
indentation style to Xen's there at the same time (the file already had
a mix of styles).

While there
- switch boolean fields to use bool,
- drop the notion of big-endian bitfields being a thing on x86,
- drop the names for reserved fields,
- adjust the comment on "dest32".

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Make secondary adjustments ("While there ..." above).

--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -66,15 +66,15 @@ struct msi_info {
 };
 
 struct msi_msg {
-	union {
-		u64	address; /* message address */
-		struct {
-			u32	address_lo; /* message address low 32 bits */
-			u32	address_hi; /* message address high 32 bits */
-		};
-	};
-	u32	data;		/* 16 bits of msi message data */
-	u32	dest32;		/* used when Interrupt Remapping with EIM is enabled */
+    union {
+        uint64_t address; /* message address */
+        struct {
+            uint32_t address_lo; /* message address low 32 bits */
+            uint32_t address_hi; /* message address high 32 bits */
+        };
+    };
+    uint32_t data;        /* 16 bits of msi message data */
+    uint32_t dest32;      /* used when Interrupt Remapping is enabled */
 };
 
 struct irq_desc;
@@ -94,35 +94,35 @@ extern int pci_restore_msi_state(struct
 extern int pci_reset_msix_state(struct pci_dev *pdev);
 
 struct msi_desc {
-	struct msi_attrib {
-		__u8	type;		/* {0: unused, 5h:MSI, 11h:MSI-X} */
-		__u8	pos;		/* Location of the MSI capability */
-		__u8	maskbit	: 1;	/* mask/pending bit supported ?   */
-		__u8	is_64	: 1;	/* Address size: 0=32bit 1=64bit  */
-		__u8	host_masked : 1;
-		__u8	guest_masked : 1;
-		__u16	entry_nr;	/* specific enabled entry 	  */
-	} msi_attrib;
-
-	bool irte_initialized;
-	uint8_t gvec;			/* guest vector. valid when pi_desc isn't NULL */
-	const struct pi_desc *pi_desc;	/* pointer to posted descriptor */
-
-	struct list_head list;
-
-	union {
-		void __iomem *mask_base;/* va for the entry in mask table */
-		struct {
-			unsigned int nvec;/* number of vectors            */
-			unsigned int mpos;/* location of mask register    */
-		} msi;
-		unsigned int hpet_id;   /* HPET (dev is NULL)             */
-	};
-	struct pci_dev *dev;
-	int irq;
-	int remap_index;		/* index in interrupt remapping table */
+    struct msi_attrib {
+        uint8_t type;        /* {0: unused, 5h:MSI, 11h:MSI-X} */
+        uint8_t pos;         /* Location of the MSI capability */
+        bool maskbit      : 1; /* mask/pending bit supported ?   */
+        bool is_64        : 1; /* Address size: 0=32bit 1=64bit  */
+        bool host_masked  : 1;
+        bool guest_masked : 1;
+        uint16_t entry_nr;   /* specific enabled entry */
+    } msi_attrib;
+
+    bool irte_initialized;
+    uint8_t gvec;            /* guest vector. valid when pi_desc isn't NULL */
+    const struct pi_desc *pi_desc; /* pointer to posted descriptor */
+
+    struct list_head list;
+
+    union {
+        void __iomem *mask_base; /* va for the entry in mask table */
+        struct {
+            unsigned int nvec; /* number of vectors */
+            unsigned int mpos; /* location of mask register */
+        } msi;
+        unsigned int hpet_id; /* HPET (dev is NULL) */
+    };
+    struct pci_dev *dev;
+    int irq;
+    int remap_index;         /* index in interrupt remapping table */
 
-	struct msi_msg msg;		/* Last set MSI message */
+    struct msi_msg msg;      /* Last set MSI message */
 };
 
 /*
@@ -179,49 +179,27 @@ int msi_free_irq(struct msi_desc *entry)
  */
 
 struct __packed msg_data {
-#if defined(__LITTLE_ENDIAN_BITFIELD)
-	__u32	vector		:  8;
-	__u32	delivery_mode	:  3;	/* 000b: FIXED | 001b: lowest prior */
-	__u32	reserved_1	:  3;
-	__u32	level		:  1;	/* 0: deassert | 1: assert */
-	__u32	trigger		:  1;	/* 0: edge | 1: level */
-	__u32	reserved_2	: 16;
-#elif defined(__BIG_ENDIAN_BITFIELD)
-	__u32	reserved_2	: 16;
-	__u32	trigger		:  1;	/* 0: edge | 1: level */
-	__u32	level		:  1;	/* 0: deassert | 1: assert */
-	__u32	reserved_1	:  3;
-	__u32	delivery_mode	:  3;	/* 000b: FIXED | 001b: lowest prior */
-	__u32	vector		:  8;
-#else
-#error "Bitfield endianness not defined! Check your byteorder.h"
-#endif
+    uint32_t vector        :  8;
+    uint32_t delivery_mode :  3;    /* 000b: FIXED | 001b: lowest prior */
+    uint32_t               :  3;
+    bool level             :  1;    /* 0: deassert | 1: assert */
+    bool trigger           :  1;    /* 0: edge | 1: level */
+    uint32_t               : 16;
 };
 
 struct __packed msg_address {
-	union {
-		struct {
-#if defined(__LITTLE_ENDIAN_BITFIELD)
-			__u32	reserved_1	:  2;
-			__u32	dest_mode	:  1;	/*0:physic | 1:logic */
-			__u32	redirection_hint:  1;  	/*0: dedicated CPU
-							  1: lowest priority */
-			__u32	reserved_2	:  4;
- 			__u32	dest_id		: 24;	/* Destination ID */
-#elif defined(__BIG_ENDIAN_BITFIELD)
- 			__u32	dest_id		: 24;	/* Destination ID */
-			__u32	reserved_2	:  4;
-			__u32	redirection_hint:  1;  	/*0: dedicated CPU
-							  1: lowest priority */
-			__u32	dest_mode	:  1;	/*0:physic | 1:logic */
-			__u32	reserved_1	:  2;
-#else
-#error "Bitfield endianness not defined! Check your byteorder.h"
-#endif
-      		}u;
-       		__u32  value;
-	}lo_address;
-	__u32 	hi_address;
+    union {
+        struct {
+            uint32_t              :  2;
+            bool dest_mode        :  1; /* 0:phys | 1:logic */
+            bool redirection_hint :  1; /* 0: dedicated CPU
+                                           1: lowest priority */
+            uint32_t              :  4;
+            uint32_t dest_id      : 24; /* Destination ID */
+        } u;
+        uint32_t value;
+    } lo_address;
+    uint32_t hi_address;
 };
 
 #define MAX_MSIX_TABLE_ENTRIES  (PCI_MSIX_FLAGS_QSIZE + 1)

