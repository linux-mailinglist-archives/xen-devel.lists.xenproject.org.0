Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E667D3F8318
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172735.315213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9ln-0002PP-8y; Thu, 26 Aug 2021 07:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172735.315213; Thu, 26 Aug 2021 07:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9ln-0002Ly-3x; Thu, 26 Aug 2021 07:25:51 +0000
Received: by outflank-mailman (input) for mailman id 172735;
 Thu, 26 Aug 2021 07:25:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJ9lm-0002Lf-Fu
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:25:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5b94e7c-063e-11ec-a9d2-12813bfff9fa;
 Thu, 26 Aug 2021 07:25:49 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-vQsy__WVPtK3phTnY6t6nw-1; Thu, 26 Aug 2021 09:25:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 07:25:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 07:25:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0025.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 07:25:45 +0000
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
X-Inumbo-ID: d5b94e7c-063e-11ec-a9d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629962748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cp/UKD96UUEYfIaWIeUFiqwUZxRvXtrZLCZhkoF46/Y=;
	b=bLe0hY3NFFViTYOqnSLPiFSrTozZCkk2AjU79mrooJY3AdCFglm9IJsPknSH+7h77V++YD
	nsPVQnankqp4/ec9UOVG04w9w/GCGSoBLV1sojh+5U72o8XCEN20Pb5U88o6tEeNEeUz9c
	t8430Waf6T4LTln3gZHj911ZtK7aWpA=
X-MC-Unique: vQsy__WVPtK3phTnY6t6nw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RH4a+hm9vpgE6ANBwhbpTrA+aG+SFKtHVJS6yyiUmWIjqal6joMVFIu5OfDNyC1bbqbmPLit4UziQ+NA2dznz7nAteK/DinZOB8CuVQ+NMQdAzUvwi/SWdrY3uioTUBWlT3AUgYPZ0S8XV90rYWyCEXSSWiM0CRaLbmQi3AJ+jl0Sn5UUFN8Itd8foSARf4tzPNpsuXnfFwen4uYk8uVcp0FrgE5FokSBB0SDGG6yJmcHZ1RoHbBrhaXD+INGtKuaxZi+sSh58HhX6zlJ185M74pPU25gFFU4ikIRrDR5IlRkIsp4TE15a/OaOVqOOHPnfQy2W7RP1UYjSOPUoXd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp/UKD96UUEYfIaWIeUFiqwUZxRvXtrZLCZhkoF46/Y=;
 b=FN1kSA3Mib1fm/nVYrvP/dxontcI2KZuXPpx3sw2SImwwXgZEy6PTN3KfRfkrmoReUBlpwJzTsd1QrAQhvyZahAvYESpVh9nPo5CvhEyhHIERpEMzX2BSucWD0yMV8Otpzz6tpTxvVYctc47qudbv8FnPykiS0xf60x+EWToq956DnCbxBa9r5IW5C9wYdXnXe7TZssXyrFezRwJbo+s2ZVZNm1NzL4/JXYE1R/ODqmyopX50Se3q+0swLdfpSeOvy5h5l+70hPRj2jHeXCDLRsECwpFHZ72BtVSSItTJpn/6wfqdwtEwLCFefy9O9Ymhvnt5eOooaVB3ulB54jCFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v7 7/8] AMD/IOMMU: add "ivmd=" command line option
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Message-ID: <1b974a3e-3ace-fbd9-411f-4493963317b8@suse.com>
Date: Thu, 26 Aug 2021 09:25:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0025.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22a5593f-6594-4b9e-f2ba-08d96862b895
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB311888957FB5CDE2B703A20AB3C79@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5LF72eOcdqWCLhT2pQ5oSdUIP4OFxJ6Ikqn99pbPgtGm7mVniSZlTDnl+opQtUI5ggyDzj8DfFZ4JEbDvvsX5kCFdO4U7xQbPx6rM0C7efVOSvcGSRKLP9eYEkL/5KE137biMa4WSS0IEEOBsbkmuYcqSDTNyXbT1mr5fthBN8Cs1DVLMCGSbKyTkudzaPcjegjLeX/5di9uj5HiVRyPrAX6QTYyAyaUH31P24zFd/2TyXQxgPtkOBj5OFFmdkBc6pjH0S+p0OWk5rYulyI8/P6xmnwvCvNtUINIVyr3+1SNGGoHZ4F2a/r9I3iVjlOeoNOkwoumVqwb3CBQLH/7VVsVNSFG+BWImY34cOFkPYupx5NiE9yKfQqJp567+DlySDmPOhMe2ZpD7x9eAJF7AZ/6FblF9uMEetIZfbuQ2w18+Cb4m1VMkwP9zVFI/G8o0HApMPT/xX7Gm51Jg8UWSUYvlrN3Sax8ZLQy/D7XDzMkc0qSS4Eu7Jz6xddzyPUvwiHCEmx8oqeQAgu+btMDyDd65aLBC+wadVFuhTklRLQPKPtOMaHjSaKrmD92LyWWMP25pUIvsC8tWWFXKvRop5nxQj25EBtIuhSuAzBM7DP5fYY1LP2si6miMwFlf3np4oZHT2sCn0OuSB0fn9swwSTJ+Fnmlt9UUdnWlyrZ/v1my5JSJLJtkidmJ+bjk0s99+NMGLfAoxi/i4ibpUgAOAo4xCKEBQaKEYRnmrQfupo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(66556008)(31686004)(66476007)(956004)(2616005)(2906002)(8676002)(66946007)(38100700002)(498600001)(5660300002)(36756003)(54906003)(16576012)(31696002)(26005)(83380400001)(4326008)(6916009)(186003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXZrbk5YUUFidWwrUUJrQXAxS0hFRG5NRFp5ajFtL01NWkhCYk1wOEgxMWhH?=
 =?utf-8?B?NHZQMkVJTVNVZlMyYjUxZ0F1LzZnam5NZEEyMnlqN053dGNNUXlNbjVqTzJE?=
 =?utf-8?B?M05pV2doZGtCQ2ZBaEhwWXB1VGs1ellsYVhWQnJkTUJQWmt3SFB3emlkOVBa?=
 =?utf-8?B?TGpxZy9FVUxoeGZEWlNMWVZzZEl1VFhTTlIvQ0hVZDFBWVM3NXltenc2Y0k0?=
 =?utf-8?B?STduYXh4S243MkZjTjdOSTY5WXY5QmdOczU4bTNDNFQ3L0gzVHhONGJLTlk0?=
 =?utf-8?B?MmFGNnJzZklmaDJzWk5NNTdwUWQ3M0pzNEdSTlBIek1TSmlNMHhXemRYWUdN?=
 =?utf-8?B?NGhXVE9Xc0RXdC9qZXM5dnJGUVhZcjI5WksvY2hFKzNXc1ZacEFKR0VUSlFo?=
 =?utf-8?B?U25oajVuMXJBRWlPUW9ycTMrcmJDUDhqWFkwVnlhTFNyN0NlbnYxbm41QUdE?=
 =?utf-8?B?M2NSWWtPeFV0bER6ZWZZMmF4Wmw0eEZCS2J4ZjNVZVFSRzdhRDNuVldQZWly?=
 =?utf-8?B?R09tOFUyQzNGbTRBOG5hd2pWbjZabW51Q0ZwS0NkRmYydTl2NTBXSnZyQmZ5?=
 =?utf-8?B?ZWU4UG1oODRpMHhFTEdyU1FFOUQwb0VLOGFQVFdzamJmelptSmwya1dWcDVu?=
 =?utf-8?B?VkF5UDhSWXM5MjErUVhaNTRmcEtHWlcrRHZrajkxMENLUHlOamMwWFJrZ3B4?=
 =?utf-8?B?bUkxS2JrYTJIL3ZHZytBMGtLa0lCaWJ3Z3JjWFEwZnFIZm9KRnpwS2dWU3Jt?=
 =?utf-8?B?cG0zQzNWeEhUVVQvVk00TG9na1RLT2hCYVFzYkRnUnBZbmFoa3E4WmU1Tk9W?=
 =?utf-8?B?OUZoelE3czV3VVB0UjJkREMyMlgrR2hUd1BVYTg3WloyTEdacGNKRTV3Sk9U?=
 =?utf-8?B?bkh5ZCtncGV3bnFybkxZdGVTWmhOTGhvR1J5dVJpRmpPSWdkU01JNThpOUhZ?=
 =?utf-8?B?a2pPamMrRllnbFU3OXZjeUplMEF4cGdkRm4rMG5TeXJ3Q0IyWnhwY2NXNVlO?=
 =?utf-8?B?OVZXT3dhWFUzclNYZXRvNVg3VE42M3dpcFhLcmdTMGptNGZOYmFMNTlGcUln?=
 =?utf-8?B?eXJXOTNkL1dkY2t3b1FnZjJEQ0c4OGhwd3U5KzNLQXhGdmpJQUFxTnpHdEd4?=
 =?utf-8?B?RG1pVDFSN0hicUl5MnZHS2kvYmx4aTIxelpuQnNnZGNEcGZHcERWTEg5NDhX?=
 =?utf-8?B?ZXVuTGl1V3NaTDhiUVE4SXlybGtEcFRZM1FmNm55V2xmU0NjTFREcDlTbk5w?=
 =?utf-8?B?N25vajhsT0FVM0hyM0srM09OOHB4U091WkpwS0trcVBpMFBPNUt4RUpNODI1?=
 =?utf-8?B?UEVPZUxaeGlKbXFPRTRFWTc5QmJxWWRRdFUrRnh6S0FyLzhYdjFncGtoYjRx?=
 =?utf-8?B?cEtOOWRBOUNWSE1qVExZWWtyd1c5N3RqRy9QSFlLNTdOOGlOUDFiNHdtVDRS?=
 =?utf-8?B?UnBySDdPRHZ0ek1KTEZOU2Z0QlFuU2N1dFlscUQxWWZJSzFJUDNpSkx0ZUJv?=
 =?utf-8?B?STR4bDlpenorYTRMQTRSL3JUU3JldndjRytzWDVkdHlsSmQrQkJuQ3BuUHB5?=
 =?utf-8?B?OXF1OTFzRkpNRFlnNkVpZTN5VHlERE9WWVBUMnhaUnB1WTNod3FGQVhPME15?=
 =?utf-8?B?Q3ViM3hBa1VoUkZyUkc3L0NzbUl4WmhBV252Nng4QTc0NnFrMHlIc2JQRU9x?=
 =?utf-8?B?UkhnQXIxK3V5MEwvSGlQK0tyckEzUDg5Q3FmS2pZWWNYSWd5cXl2YzdiNXZx?=
 =?utf-8?Q?DoGKBoPCTfG6/RAGNsU3AmQokN2hsq/pnFNyzhi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a5593f-6594-4b9e-f2ba-08d96862b895
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:25:46.5332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z913Zsp7aEfZzI1TO7iJC+2BIBVb5r5B+uw8gUSkgnaJ6CNXkXBWNFjyBo0AOkskx+5QrL3FzgweNvSuipSxbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

Just like VT-d's "rmrr=" it can be used to cover for firmware omissions.
Since systems surfacing IVMDs seem to be rare, it is also meant to allow
testing of the involved code.

Only the IVMD flavors actually understood by the IVMD parsing logic can
be generated, and for this initial implementation there's also no way to
control the flags field - unity r/w mappings are assumed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
v5: New.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -836,12 +836,12 @@ Controls for the dom0 IOMMU setup.
 
     Typically, some devices in a system use bits of RAM for communication, and
     these areas should be listed as reserved in the E820 table and identified
-    via RMRR or IVMD entries in the APCI tables, so Xen can ensure that they
+    via RMRR or IVMD entries in the ACPI tables, so Xen can ensure that they
     are identity-mapped in the IOMMU.  However, some firmware makes mistakes,
     and this option is a coarse-grain workaround for those errors.
 
     Where possible, finer grain corrections should be made with the `rmrr=`,
-    `ivrs_hpet=` or `ivrs_ioapic=` command line options.
+    `ivmd=`, `ivrs_hpet[]=`, or `ivrs_ioapic[]=` command line options.
 
     This option is disabled by default, and deprecated and intended for
     removal in future versions of Xen.  If specifying `map-inclusive` is the
@@ -1523,6 +1523,31 @@ _dom0-iommu=map-inclusive_ - using both
 > `= <integer>`
 
 ### irq_vector_map (x86)
+
+### ivmd (x86)
+> `= <start>[-<end>][=<bdf1>[-<bdf1'>][,<bdf2>[-<bdf2'>][,...]]][;<start>...]`
+
+Define IVMD-like ranges that are missing from ACPI tables along with the
+device(s) they belong to, and use them for 1:1 mapping.  End addresses can be
+omitted when exactly one page is meant.  The ranges are inclusive when start
+and end are specified.  Note that only PCI segment 0 is supported at this time,
+but it is fine to specify it explicitly.
+
+'start' and 'end' values are page numbers (not full physical addresses),
+in hexadecimal format (can optionally be preceded by "0x").
+
+Omitting the optional (range of) BDF spcifiers signals that the range is to
+be applied to all devices.
+
+Usage example: If device 0:0:1d.0 requires one page (0xd5d45) to be
+reserved, and devices 0:0:1a.0...0:0:1a.3 collectively require three pages
+(0xd5d46 thru 0xd5d48) to be reserved, one usage would be:
+
+ivmd=d5d45=0:1d.0;0xd5d46-0xd5d48=0:1a.0-0:1a.3
+
+Note: grub2 requires to escape or quote special characters, like ';' when
+multiple ranges are specified - refer to the grub2 documentation.
+
 ### ivrs_hpet[`<hpet>`] (AMD)
 > `=[<seg>:]<bus>:<device>.<func>`
 
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -1063,6 +1063,9 @@ static void __init dump_acpi_table_heade
 
 }
 
+static struct acpi_ivrs_memory __initdata user_ivmds[8];
+static unsigned int __initdata nr_ivmd;
+
 #define to_ivhd_block(hdr) \
     container_of(hdr, const struct acpi_ivrs_hardware, header)
 #define to_ivmd_block(hdr) \
@@ -1087,7 +1090,7 @@ static int __init parse_ivrs_table(struc
 {
     const struct acpi_ivrs_header *ivrs_block;
     unsigned long length;
-    unsigned int apic;
+    unsigned int apic, i;
     bool_t sb_ioapic = !iommu_intremap;
     int error = 0;
 
@@ -1122,6 +1125,12 @@ static int __init parse_ivrs_table(struc
         length += ivrs_block->length;
     }
 
+    /* Add command line specified IVMD-equivalents. */
+    if ( nr_ivmd )
+        AMD_IOMMU_DEBUG("IVMD: %u command line provided entries\n", nr_ivmd);
+    for ( i = 0; !error && i < nr_ivmd; ++i )
+        error = parse_ivmd_block(user_ivmds + i);
+
     /* Each IO-APIC must have been mentioned in the table. */
     for ( apic = 0; !error && iommu_intremap && apic < nr_ioapics; ++apic )
     {
@@ -1362,3 +1371,80 @@ int __init amd_iommu_get_supported_ivhd_
 {
     return acpi_table_parse(ACPI_SIG_IVRS, get_supported_ivhd_type);
 }
+
+/*
+ * Parse "ivmd" command line option to later add the parsed devices / regions
+ * into unity mapping lists, just like IVMDs parsed from ACPI.
+ * Format:
+ * ivmd=<start>[-<end>][=<bdf1>[-<bdf1>'][,<bdf2>[-<bdf2>'][,...]]][;<start>...]
+ */
+static int __init parse_ivmd_param(const char *s)
+{
+    do {
+        unsigned long start, end;
+        const char *cur;
+
+        if ( nr_ivmd >= ARRAY_SIZE(user_ivmds) )
+            return -E2BIG;
+
+        start = simple_strtoul(cur = s, &s, 16);
+        if ( cur == s )
+            return -EINVAL;
+
+        if ( *s == '-' )
+        {
+            end = simple_strtoul(cur = s + 1, &s, 16);
+            if ( cur == s || end < start )
+                return -EINVAL;
+        }
+        else
+            end = start;
+
+        if ( *s != '=' )
+        {
+            user_ivmds[nr_ivmd].start_address = start << PAGE_SHIFT;
+            user_ivmds[nr_ivmd].memory_length = (end - start + 1) << PAGE_SHIFT;
+            user_ivmds[nr_ivmd].header.flags = ACPI_IVMD_UNITY |
+                                               ACPI_IVMD_READ | ACPI_IVMD_WRITE;
+            user_ivmds[nr_ivmd].header.length = sizeof(*user_ivmds);
+            user_ivmds[nr_ivmd].header.type = ACPI_IVRS_TYPE_MEMORY_ALL;
+            ++nr_ivmd;
+            continue;
+        }
+
+        do {
+            unsigned int seg, bus, dev, func;
+
+            if ( nr_ivmd >= ARRAY_SIZE(user_ivmds) )
+                return -E2BIG;
+
+            s = parse_pci(s + 1, &seg, &bus, &dev, &func);
+            if ( !s || seg )
+                return -EINVAL;
+
+            user_ivmds[nr_ivmd].start_address = start << PAGE_SHIFT;
+            user_ivmds[nr_ivmd].memory_length = (end - start + 1) << PAGE_SHIFT;
+            user_ivmds[nr_ivmd].header.flags = ACPI_IVMD_UNITY |
+                                               ACPI_IVMD_READ | ACPI_IVMD_WRITE;
+            user_ivmds[nr_ivmd].header.length = sizeof(*user_ivmds);
+            user_ivmds[nr_ivmd].header.device_id = PCI_BDF(bus, dev, func);
+            user_ivmds[nr_ivmd].header.type = ACPI_IVRS_TYPE_MEMORY_ONE;
+
+            if ( *s == '-' )
+            {
+                s = parse_pci(s + 1, &seg, &bus, &dev, &func);
+                if ( !s || seg )
+                    return -EINVAL;
+
+                user_ivmds[nr_ivmd].aux_data = PCI_BDF(bus, dev, func);
+                if ( user_ivmds[nr_ivmd].aux_data <
+                     user_ivmds[nr_ivmd].header.device_id )
+                    return -EINVAL;
+                user_ivmds[nr_ivmd].header.type = ACPI_IVRS_TYPE_MEMORY_RANGE;
+            }
+        } while ( ++nr_ivmd, *s == ',' );
+    } while ( *s++ == ';' );
+
+    return s[-1] ? -EINVAL : 0;
+}
+custom_param("ivmd", parse_ivmd_param);


