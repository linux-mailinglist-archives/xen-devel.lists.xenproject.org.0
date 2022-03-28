Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519134E8F37
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 09:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295332.502517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYk0K-0005lC-Sv; Mon, 28 Mar 2022 07:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295332.502517; Mon, 28 Mar 2022 07:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYk0K-0005jN-Pm; Mon, 28 Mar 2022 07:41:32 +0000
Received: by outflank-mailman (input) for mailman id 295332;
 Mon, 28 Mar 2022 07:41:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nYk0I-0005jG-JD
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 07:41:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a5a43f8-ae6a-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 09:41:28 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-ua31YCwNPOOmifpnqtC3RQ-1; Mon, 28 Mar 2022 09:41:27 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB7652.eurprd04.prod.outlook.com (2603:10a6:20b:285::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 07:41:26 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 07:41:25 +0000
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
X-Inumbo-ID: 7a5a43f8-ae6a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648453288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ntH+YI2glGh1hhQvbnS5boURGCiH0lvIpdbNClN8A1A=;
	b=cEmLEdW5onnrENauCL6LjrsNNpvVk90nYCva8UhK7mMn+qXFxUjKESWTD+fSOPLAM45Fm8
	BXvAG7JC0ivTkb746F6vDvoaS4bzkh3pfb6QzWBP6vtaL54us9MOU/7m+AvoZPpT9fdukd
	HR/yV+0cYz4NdOvSpPk/7BCf6wm8SDc=
X-MC-Unique: ua31YCwNPOOmifpnqtC3RQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJpFsfZUL6+yy+rVfore7w0ElgTrsC1w0CWy5D0Xv2NBO1aW1stEcBJ3bbXkfNxhda4SLFW688Zq8d8ZUuddwz4KJ8Q+jmFLkvEhmoHc8jtWnu57MKZ9wprnIa+IBBarCXiYkgh+0ugShXF5oS6B4VqCYyWXCLADELU9Tl9DzRiY6KgmjrR163fglINKmP1MTjYscGJh0ya4hcQkir39D2L2l9tGGCLdXkCG0oIbu9AaM3WJNMJyxVL67TsDTqFH9Ktd7gfuu6kXU7aF/zaeYeaokuYl79v+3boD+KY3jTSVI/OPGQ4vMO4peorubJ6aG/JchqnOkUi0kbHC/2g7gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntH+YI2glGh1hhQvbnS5boURGCiH0lvIpdbNClN8A1A=;
 b=RYOds1lGy+iv+7RhiISgSjUhPdJiscAE1a015df5cV5MoT4RwrGCcJjiM7Xx/7atoG6EcVNeuoSKYUwmgzjddSPniYs2PMCf6nfR9TX9bC3iAJZbAJ47A5zAf4hl2fHuD52reCmAR5HkrBTMm6e7zVaNYsvVmCzDqHP/QPfX7ehQRRsbeEUht0Hd0brTzZFx/CaiU4R+rtIg3jT8T4qj9C0BTvhZ7HaS9bf+q5apWVH938sTQXqabOOu+mSTrHB070tSsfZVZGfIr/VIEwVTyMb+jDk2sm7gCvq2XAHHZR9ZWDQH3KLvE/jh0LhQdeGJmxnb1cjui7udRHD/gi2IPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49190e22-c802-3830-9d4c-8e6100132687@suse.com>
Date: Mon, 28 Mar 2022 09:41:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: generic top-level rule to build individual files
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0047.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c7364df-0d4e-4cc0-0a09-08da108e5ce0
X-MS-TrafficTypeDiagnostic: AM9PR04MB7652:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB765279F2A29E72743DDF6CCDB31D9@AM9PR04MB7652.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/94W2tMb9M7R8aWqoOJiZdPqu070c1Yj2gdv4E2FcisqMG16RmkxrY8/6FkwAiid5+fWjva/dsirBZMagKsLamrySzYXSUvzaotI5AEXKR9vr2f9wKZaz0KD9WDcE2JkimeCAyvDiNFzcBndQrg5Q4iSsifwMJc5/swQfMIOJgUJT5Em/21Yef8dtHGfivVFqOK3L8BX0o+dtQv5r+W6D3Urc+xdUzvJ/ae6gCrR9NRdr969PxgEkerTlzTWd5Atom3yLIKAE0ISLN46o6v65xZN9ccAwayNSMcSvg6E8x2U7MAfXTGTVnPDY9inFZlBmnt+WlrCElooR43Wma3KjH2fH4vPkWCwKeQpXCgu42QwahUhMWiW837zo2NEPn36udmj4xmr7eAR68F7NLSKme1YzYkL3EVivSBa/8be6ftiuruX2evxmJrgjUK74X1wi1u+831OJLTI8l24jnHsSkgCK7biyvHTGUZ6uzw99NHBv1w1aut/WcUm5pO3Yw/gEDE3XfnEgdJtNtt7wdHhqbWd11rWWQMvF9Fnr+1rDlcIzxSycXBmNH389mhdQP2sBhoOtqt/CJO9o8AZm+L3eLXn6Pu6domKqZ3eFnl+KDK0/Bari9VKNyCrTdO+UZmtdJ2Re7FtKh5bTxT0i8DXubbgQ2JYbgPIKeQpvHttA9lrCUJSD3+jN4FobYQziTM41ti8DI9DthcvjTBHYmo259WpK0d+I26RaF5cd57QKIIks4Pq40xDZ/2QNDEoKz3kV8XyjbdBk0hXml8GcFEuYorG3/zi9Do0XfdKa3FJxYrLrp/6Ryl1ukENjthZsTt+yJqsQ86fYF5U5lH9CyNYMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(36756003)(8936002)(8676002)(66946007)(66476007)(26005)(66556008)(316002)(31686004)(31696002)(186003)(54906003)(4326008)(2906002)(6512007)(86362001)(5660300002)(2616005)(508600001)(6486002)(6506007)(966005)(6916009)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTRCQmNRL1RrSE13WGFtMkxzMHk4T1RKTCtKc3Y5eFJ1eGRpWjZvQWFUdWVV?=
 =?utf-8?B?UzBZeUUxOEJIa01JR2dSblpNQ0hMTGovVk9iSy84RnNPYlVMMXJ5ZWR6LzVT?=
 =?utf-8?B?MVlubm50bVNtTmFVRHpOTmVQdGVaNG1EWW5yUTlqRVRGMVFYVm5ScTBQR1Vj?=
 =?utf-8?B?L3phMGtMdVVEa1QrZ1VibmdZcVR1eUxucFdVSTY1THNJRzhETC92N2NlQm4z?=
 =?utf-8?B?WkxnT1hnWmdKZWZUelArcXdKOXAxOUFlY2w0Nk50VVEwZUdWWFJuR0hXVWVY?=
 =?utf-8?B?eWpuditaV2lmbXcyUHI5T3NKVzgrdFVtdWVkNzI1ZTBraU5VcUh6RncxSEhR?=
 =?utf-8?B?aHA4aE80Zi9mR1RqODgxdmxiaDdpS013SkIvTjUvUXBFNjJKY2pyakdOZDk0?=
 =?utf-8?B?QllYQUJvUUR2M3RNdEYyTFV1cTJ3TS9UT2FqT1lENThBUENZYVZoejc5RDJN?=
 =?utf-8?B?WlpQVFpmMTFFazdGS3VPWUZCUm9wczFWNmREYkprZzl0cUtkbVRlZzJzUGQy?=
 =?utf-8?B?T2tLQmxrOVhnbWxtdFRrSVp6NWJtczBWSGx3eWJDSVNSRlowMitzQWczaDBj?=
 =?utf-8?B?QWJJN3B0M2pjbnNlMmt3bnQ0VTF1VnA1NHAvOGxUb2ljRFpQQkhyOXcyenkw?=
 =?utf-8?B?TEJGejU2cFRUQUVKWkF1anJzYVFkdkZhRFp2cTloWVdlaGRUV2R4dVNQR2w3?=
 =?utf-8?B?UmxpeHpXVEZzQUFpRlJDM0hUQVA1SlA4blRoRHdxakV6c1BiY3phOTM3cXQ2?=
 =?utf-8?B?aEZKL2d3dTI1aWhQK0dyYmUvN1hmeGJsZkwxNjh1Zk9yZk5FankwcUpSZ3ZO?=
 =?utf-8?B?VW9DMTJXU2hWWHBUcXg5WTRVNkZ5WFMwbnZ5cmJYQmUrWHlid3BnT0d2QS80?=
 =?utf-8?B?NnhSTisxaStUS3FyUGhWemljZGhCTEVNcjFPT09Ec1RKN0tmUG5ycnNqd3Rw?=
 =?utf-8?B?ekJ2Q0ZLckRxU2xZUmxqUWQzN3hHelFmUk1iVU9QcnRhbnJHLzRFTnZLN3do?=
 =?utf-8?B?bTM1elBIY29BNktDOW9DVFk4U25pM2FDcW9lZkNzdnY3RkcyRUdTRy9EM3Yr?=
 =?utf-8?B?Y2RmOFdiK0lSWGxlTHhhdU16alNHejI4YmJmOW05T2lNd3IrRnlKNGxwUmFk?=
 =?utf-8?B?R3FBNmdHV1MxL0tEQUpmOHNZdjJmVElyWnJSa1JQUFl6K21uM1dNc0V1NkVH?=
 =?utf-8?B?UXg4TVkxUFd1ZjhFaFQvRERWY29QS1RJSS9zRGR6cUhNb1Rya0hJTytRaHBu?=
 =?utf-8?B?Qm1aWU5USGVqMU4vLzhkVWJTMXNNcWo4a2FJbUZuS3p2YUZYR3R1NGY4Z3RV?=
 =?utf-8?B?bG1MVllUc2MwNWNicG1ybUxhZm1OelJBOXBnUiszVkVPSjFsMHA3VUZFQnhp?=
 =?utf-8?B?VUwyaklMb2x1R1ZMcnBoVkFaTDN3ZkxMblVyNTBkMDFLMmxKbG45aWxlS2s5?=
 =?utf-8?B?RS9PL2tmTTkzK3lWUENtOXVBZXJqVmtHd2h5Yyt0SUlnM2gyamNnQXRVNWNz?=
 =?utf-8?B?T08wenNBNElLMnBiUm5zL0lobUZZZkQ2UFI0V1VRUk1MM0hhaHNaS0dLUTNq?=
 =?utf-8?B?clhZM1dPYmhvR3FqMHBHcm0wMzhTZWlsdU1FRTlYNVZ2RmVPUTI5RGZSUmwv?=
 =?utf-8?B?Z001OTRGa2lybFA4OXB3c1BmOHNKeWZQYkxHaFhIT0FIY3BwNkp2OTVEeDFh?=
 =?utf-8?B?MTlYODFmS1E0WmluZ1NvNG5lV0E1NjNLWmw4MWRJbVVPWWFIS3ZPYlRiRXhj?=
 =?utf-8?B?YmFpM1pGRlA5TG9mWndpN3Q1RFUyTDlubHF2U3pzMEE0SVpCVFFjQTJEN3V2?=
 =?utf-8?B?MFptQitONXNMam14c1c1M2QxalpaaEpMa2owZS83enJiZmxSWm5nemFOOWpV?=
 =?utf-8?B?Z0FEdHgrTUVJZjlNVEdpOVJySHZ1aUVPenUvOUpoSHRlUGthNmRIRmJmQjRj?=
 =?utf-8?B?U0t2MWRqbE5BRGVBTUlXZ1ZnOTViTm9CRWVhNDJkakNBakVoY3FoY0lNUDFV?=
 =?utf-8?B?YWxHQmtXeHRtbE9hdXZyUHdvZ0hOOVZkOXlwTkptd3JPVkJsLzA2VjY0eXJt?=
 =?utf-8?B?Vno0THU0ZjBHTllja3dYYmREa2p0UjNiY0Ura0VRZDlzNDQvejMwUTJRbXVJ?=
 =?utf-8?B?WHlRZHJuamd4bXhKTWNaenFHcXBRcUNiLzJuZ0xvam02OG1hMW1Hb2xnSXBi?=
 =?utf-8?B?c0tTT1h5UUR3RWljZDJRZ3ZXUzZVS0dTbWpvbWlUS2lhYkU0ZEU4SXRjd0lt?=
 =?utf-8?B?VU9wNHU1a0JFSml3VE9jZUJvYjBFcmQ1T0JaQUhuR2M4d1ZKbFc0bVRzSTE4?=
 =?utf-8?B?ckY5MjFNOUFYa2NwVy9wc3JORW1SWXBvSzFGRmxMcTVpb3Z1ZmFGdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7364df-0d4e-4cc0-0a09-08da108e5ce0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 07:41:25.7026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0KkoagWhDLl3XQ4hHB+zOkA7MwxqkzkEct7mxmUB2DxkGhMzeE+QZiv/gjy5/IkrPB7238JgqkaOrjRtxPq/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7652

In particular when cross-compiling or having in place other tool chain
overrides, invoking make to build individual files (e.g. object,
preprocessed, or assembly ones) so far involves putting the various
overrides on the command line instead of simply getting them from
./.config.

Furthermore this helps working around a yet unaddressed make quirk [1]:
Variables put on the command line are invisible to $(shell ...), unless
invoked from a recursive make: During the recursive invocation such
variables are put in the recursive make's environment and hence become
"visible".

Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] https://savannah.gnu.org/bugs/?10593

--- a/Makefile
+++ b/Makefile
@@ -75,6 +75,13 @@ ifeq (x86_64,$(XEN_TARGET_ARCH))
 	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom pv-grub-if-enabled
 endif
 
+define do-subtree
+$(1)/%: FORCE
+	$$(MAKE) -C $(1) $$*
+endef
+
+$(foreach m,$(wildcard */Makefile),$(eval $(call do-subtree,$(patsubst %/Makefile,%,$(m)))))
+
 .PHONY: build-docs
 build-docs:
 	$(MAKE) -C docs build
@@ -334,3 +341,6 @@ uninstall: uninstall-tools-public-header
 .PHONY: xenversion
 xenversion:
 	@$(MAKE) --no-print-directory -C xen xenversion
+
+PHONY += FORCE
+FORCE:


