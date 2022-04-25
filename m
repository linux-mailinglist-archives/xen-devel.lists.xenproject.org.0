Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A397650DE20
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 12:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312744.530090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwEd-000422-Nc; Mon, 25 Apr 2022 10:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312744.530090; Mon, 25 Apr 2022 10:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwEd-0003z5-Kc; Mon, 25 Apr 2022 10:46:27 +0000
Received: by outflank-mailman (input) for mailman id 312744;
 Mon, 25 Apr 2022 10:46:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niwEb-0003yz-OO
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 10:46:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f36575da-c484-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 12:46:24 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-7QKDvqdEMmiiX_QwcYCRbg-1; Mon, 25 Apr 2022 12:46:21 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB4377.eurprd04.prod.outlook.com (2603:10a6:5:37::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Mon, 25 Apr
 2022 10:46:19 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 10:46:19 +0000
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
X-Inumbo-ID: f36575da-c484-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650883583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2IyVjbV4+UozLbWszz088eBp53KB5rBQs/D2spIZ4Eg=;
	b=S+4rPD4YwsHRfcYM/HWoVLiVdt3O0LnoigR3LWy2KXou26kCg4WWeQwJHvnGGVnB9xAIxc
	hJv0dTRXSvwtyw7gSCAZX/e6pOgsrSlzwxknHs85Ds6Wz5sam0U0vaI6EYgRX3j2zO4102
	fULuD5MhAkFN6riU21imipkiBcjlwPw=
X-MC-Unique: 7QKDvqdEMmiiX_QwcYCRbg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdJZk4Jev86q83corYMJ/iAju7wV01Br4x78DBxCJXMYVKoRnt6q6tOONR7bCouk5tCZnWIXn3s+YhofZSpkMa+UgPEHCoKvZ4UcY0SatLArbWaLEvKSpjNpUxQAjUzMU+xC3lG1Sts9YzfCjsaxhcBcEA6EqPozf/R1JFFIBEU4Y3wsx5QzeJM6i2ncjSZfbj9NuUYTxB3Mwa6dEwrliX48MhkFTJzXS3rTpeFN+wdpDaCvlTfc3bbrodxUCxT/+9EnEb9+bGZibl9C7iF2O0AsJO3DoFRkiBK/c5GslpfiKyHOk6tbhZHji0c2XwIEMLzKrKndOAcXIqITxr01nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IyVjbV4+UozLbWszz088eBp53KB5rBQs/D2spIZ4Eg=;
 b=eO9qSrNSnd4/KvbjVNYnnCPT5LzFQ+dBfkx3B97mDuKif8S2wRSEJ7E06Q8ZnalAbO9581NRkrpd46oSDEEU+fOuEgx8pzkJzXSnZJYDT7Mz7AFS7buNAeGmB+tldbo06+aZV+8NW++TzZqlmffaHhWE8tF4BlqypHqS7djChMNkfedkCb5/HH7YHqloWc77gzcYwkydJi+NVXQLSVJKBX3qpx7pZCOoXpL9kjE6zsfsG0k4V2AUuuiFuntd+Goyv08Jwnn87758AbECCpDIkBivJseH2aR74Qm+Dx7OT3SRGEIgk3JIgc4cAN1FMuZHrSsYlzDh3vSpLvqAPhc/jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <394c1b94-beaf-bdcb-c333-65dd9987be54@suse.com>
Date: Mon, 25 Apr 2022 12:46:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] EFI: strip xen.efi when putting it on the EFI partition
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0088.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ea2bb26-9a84-4b51-0a8e-08da26a8d4d6
X-MS-TrafficTypeDiagnostic: DB7PR04MB4377:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4377BF6A47376826FB163D11B3F89@DB7PR04MB4377.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RBr1rDrryuCt/uQz9VSJSsOdT1yt02oXVMO6iBJ9FjIxIOdt/vA60URIWRxYwT5U6kcslcYlol/aWhIbihEB+xQCFcL1YRFTQc1Oexw55QlqsK23bIWjNGdyeRxwATK237JkhPQKDoi6Ue6OBapHDPUaajBzZgJ27mCwfj2bDXYpM/R+YW4Azq1QmBGRM1DmD00Uc4vb1/pw6dgln5uO/ZPKLZO0FmkV0kLfhXgc+SizeUDZByJdc08vi2oCbDg1QM1TO3wPFmskRRRcxqa1VFsNOa8YfD/usBgqldWF8JXj+ToLRktIVJj1BnMxfHVEup0+BF5EFGUoEQyYPqkwPL7lk+fE6h58XiSOD/2tjqa3soSlOrv+kFTrNQmRjdQq2U3nao1zhcG1mAYcl39Xkho4ItOhy1i8TpCPUDCngxUTFVepcrT+H9K2/AH0fjXYNR0D47kaSWmbpGKYtRf4krNxVPdCxtnliU6rPDgjtD5kFvSR6wy1tw5tpUfH+H0eeMP4GUaTHVNDA4Iqv7yvudx3PlzxdDIr5FxiPYeaZwS1FGd/ynfgIXNu2KnP0olvl65zJpPHqQnm5T1atkeofCQe9cU11wArAuBp4HNFNw3v2FO4oeuzN+w8trCCuJQ+DcK/KkoeVN54bGTOeqMWZy4+RVcpd5SUp6RJ9z5N6g0+nGpG1ZQGtliwnhdSnTDKqwv8Prc99JnIfE1W8XfyP05ptN2k0qL268zOP1ue2EA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(26005)(66556008)(5660300002)(186003)(6486002)(66476007)(8676002)(54906003)(36756003)(6916009)(31686004)(8936002)(66946007)(6512007)(316002)(508600001)(6506007)(83380400001)(2616005)(86362001)(38100700002)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVZYajB1NiswcU1FRHFQckJoSnY5Wm83bzhHcGJ6Tm0wRDJQczZMVjlCQ2NM?=
 =?utf-8?B?Z2pXQy9TaVVjY3llNGtCM3ZjYm1WUFBxSENPcUduQXV0bUVhZlpRWmZNVkhC?=
 =?utf-8?B?OFlubU1teHdhcVBmQ25EdDJEUmpyYVJxTFFkbFpDZHBGaDVzemRJMFhuNito?=
 =?utf-8?B?NGx4dVVTTTNzRng5NVdiT1R2WWYxS1Q4ZWNxQ2RrMmZsMzBERG5sbUJ1ZUhW?=
 =?utf-8?B?bkFFY1VUbkd2UU8xUWJuRkdqQnU2UTZKai81cE1RYktyc3Z2VGVwTUd4SS9H?=
 =?utf-8?B?UzFvWjN2SHg2WXBKbDNOQ1dzcmNmSzN1dmdhNWl4NE9MZkE2T0JQTnZ6TmJH?=
 =?utf-8?B?QlE1MCtaYlRxN1NVRXhabDVXeUgxeVhrODBpbmNnYjM0U1NxelhpS3E4QlY2?=
 =?utf-8?B?VWZTN2JjUDR2eVdpMS9NOGhyTUlibEkrNElReTJKU3kreWFPcGVKdWI2UDlI?=
 =?utf-8?B?UVYxWjRRNEExdklYTVpxVlV3VkhjclFuOGoxOS95K29FSUJGemRXQzl1YlJv?=
 =?utf-8?B?SU40QWFtSDRTbC9DT3l2eHJYK0hYNVZrcTV3YmRPZzhNeUkxM3YxZmdLd2M3?=
 =?utf-8?B?Y3g3TkNsM0RGdk5wQzRHMGsvWGIzcjZKMmNNZHpWbXN1M2lmT0I2em1QV1o5?=
 =?utf-8?B?bEYxTHlXN3I2SnZweVpPUjlRYjhZVmN3RElRSnMxeGpDL0xTR1h5aHVrTlht?=
 =?utf-8?B?bHR5S3pveC9ENkpQSHRXNWlTVEhEMG53eDcwWFJFTmFQR3VIbFNZNG1CSlgw?=
 =?utf-8?B?bTE2eHp6eXU5bnRRTTNNZUZMayt6WWRaVGh5STJFUDBHZzNUTGdVWGROdU1z?=
 =?utf-8?B?UU16QzA2Sk9vcWxyc1l5Y1dDSEpsNmFRaGJJVVB5MFpqZ2VuekhXMUxhR244?=
 =?utf-8?B?M3puTGZZRitaYXQxM0tqdXZqMTlQOXBGYUthRTVCQWtaWkhZdUVqdTVkaWxI?=
 =?utf-8?B?SzIzT29uMUR4OEpwUWlrVGxjKzFvL1pVK3BNMmE5UzVPbUdkc0VCeE12UFFi?=
 =?utf-8?B?cDVNbXFsVmdXS2dWTXErdUFkVE5TMnZ0NFRyN0FmbDJxVjRwU0ZLY2ZPZFNL?=
 =?utf-8?B?STAySjZiYk0zOWQ2dDh3Q1IzTkplc0R4Y3ZVWTNkdmxBZnJBVFM1K2NXYm1k?=
 =?utf-8?B?S2FJbHcwRTlYUEFXZWpKbjluVGs0MUJ6WEhEVVBITUJManNJTmk5TFI2SGF0?=
 =?utf-8?B?QzdDVnBtdlBKb1QwOXpRbjJCY2dMUnZHMmF1dUllQkd4cHVFODAwMnZPT2dp?=
 =?utf-8?B?UjdMczlxRnNrYUc2eUl2WWlWQzB0Z1Bjby9CSDQvQWdGSytVcDVHVGUxckVm?=
 =?utf-8?B?WXJaaHJCWDR3YWNDcXFUMHNjcHhPeVdyWnlncDloMTk0NHJjTFFxSFNiNG8w?=
 =?utf-8?B?YnRzMk5uWTlOVUlUdGlWRlMrUm1SMlZCSXoyY3NYdzFnNkozV05pOTBCMHR3?=
 =?utf-8?B?cmhjNHNDWUhxWE9ibWVoTjV0MUE1bGhjck1saERGbk95ZWpMbHV3NWFXSFBv?=
 =?utf-8?B?b1dkZ3Z6ekxZc08zUmZwWGZuSHNXWmxOb1B1dlpHSGdIc0xGY3FwQk1TNDNX?=
 =?utf-8?B?OTVxc1gxY3FUd2xhN0ZXWjM1UG10WDcxd0NTRFJ5WExydGJDRFNXQ2lSMkJk?=
 =?utf-8?B?L2xWQ1ZNdlNURUxQeVA5Z0FCbis4THFoZHRMcDBYMUtPbVByN2I3M3IxRjJJ?=
 =?utf-8?B?T1RpWHlwWWFYckg2OEp6WFV5eW1QS1pDeTdwZXFRRTJSOGR4aktpZmt6L0Iy?=
 =?utf-8?B?U2VxZmQrNkZCZWV6QmVFcUkyOHVUMERqSlphaUp5Qk9OQ0ZtY21nN0Rub3lh?=
 =?utf-8?B?QWNlSWdQZXhjWDViQnZrR29TeUJTOFJDM2c1cnhrd2FRajZiRFE3UU1UaERM?=
 =?utf-8?B?UXd1MzBuSVczdk1QUzlCMGJYNnZXQzFxMWg0Sm5GSVFONDhUTzd4ZkwrSFE3?=
 =?utf-8?B?OXV0R0FIU3RjSVRHSTZjMDJ2MTIyVy90S2tzdUxYbUJtN21rc0VWWHUva3ow?=
 =?utf-8?B?VFJpNDRsYkU0Qk8xNUZDSnJRMlh5aE15WU1CSWRyQkgrMG5IMUhBbmlGTEQ0?=
 =?utf-8?B?VjFnR1RSTE4rWWpoWE9VWFJ3cWlPZlY2Yzl2UzAyVkhLai9MRmF2Z1dKUnRy?=
 =?utf-8?B?MEd6dlBiTHlYcXBwSTB5bHAxQW9MdllPaDdEY2xYdGdLbGo2ZUh1NWp4Umpi?=
 =?utf-8?B?bFQvUkhKV2o0ZHZtSkZiQzZNOGF0T2xncWwybDBhdmx2SUFVWThCMkpGcGZ2?=
 =?utf-8?B?S3NwUHlWTG50VE9VSUZUSGg5MGFHTzFWdHVYbWlmU2s2R2NScEkwVmxadzE5?=
 =?utf-8?B?dVZYQ1NaRGNYangwUUcyM0JPaG9taXJiMXhTcGFXYzVuRzdkZVFaQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea2bb26-9a84-4b51-0a8e-08da26a8d4d6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 10:46:19.4754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsQEmnazSdp3T2NTiKal4fkGQfSRx7XLPYFBG/3HEMstIecCe1SuCpNQLsBNPNCx2R1lG1ZCNS667kxcAvCTOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4377

With debug info retained, xen.efi can be quite large. Unlike for xen.gz
there's no intermediate step (mkelf32 there) involved which would strip
debug info kind of as a side effect. While the installing of xen.efi on
the EFI partition is an optional step (intended to be a courtesy to the
developer), adjust it also for the purpose of documenting what distros
would be expected to do during boot loader configuration (which is what
would normally put xen.efi into the EFI partition).

Model the control over stripping after Linux'es module installation,
except that the stripped executable is constructed in the build area
instead of in the destination location. This is to conserve on space
used there - EFI partitions tend to be only a few hundred Mb in size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: GNU strip 2.38 appears to have issues when acting on a PE binary:
     - the new file positions of the sections do not respect the file
       alignment specified by the header (a resulting looks to work on
       one EFI implementation where I did actually try it, but I don't
       think we can rely on that),
     - file name symbols are also stripped; while there is a separate
       --keep-file-symbols option (which I would have thought to be on
       by default anyway), its use makes no difference.
     Older GNU strip (observed with 2.35.1) doesn't work at all ("Data
     Directory size (1c) exceeds space left in section (8)").

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -461,6 +461,22 @@ endif
 .PHONY: _build
 _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 
+# Strip
+#
+# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
+# is installed. If INSTALL_EFI_STRIP is '1', then the default option
+# --strip-debug will be used. Otherwise, INSTALL_EFI_STRIP value will be used
+# as the option(s) to the strip command.
+ifdef INSTALL_EFI_STRIP
+
+ifeq ($(INSTALL_EFI_STRIP),1)
+efi-strip-opt := --strip-debug
+else
+efi-strip-opt := $(INSTALL_EFI_STRIP)
+endif
+
+endif
+
 .PHONY: _install
 _install: D=$(DESTDIR)
 _install: T=$(notdir $(TARGET))
@@ -485,6 +501,9 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
 		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
+			$(if $(efi-strip-opt), \
+			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
+			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
 			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
 		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
 			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \


