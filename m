Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4984B4ED731
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296836.505410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrLm-00049T-Ga; Thu, 31 Mar 2022 09:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296836.505410; Thu, 31 Mar 2022 09:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrLm-00045x-BT; Thu, 31 Mar 2022 09:44:18 +0000
Received: by outflank-mailman (input) for mailman id 296836;
 Thu, 31 Mar 2022 09:44:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZrLk-00045p-Uw
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:44:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20c3e33f-b0d7-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 11:44:15 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-_Zx8KvpfOFC4ipwVfs8MMg-1; Thu, 31 Mar 2022 11:44:14 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4648.eurprd04.prod.outlook.com (2603:10a6:20b:1b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Thu, 31 Mar
 2022 09:44:12 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:44:12 +0000
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
X-Inumbo-ID: 20c3e33f-b0d7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648719855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=voY3bdBFf59fNk/Uj9SHwXXjsrtdUHrNi408J4DKvGE=;
	b=PonIiyPJ8xi0RxPUAUFSHwbsdj9RaDI4hIYYidOa3l3PShAbfp7hf1HCAGTU7LsH+ONUQA
	WXL5Eh69gGSV32ap9qnBILC5ggQrtUcvSMaOFobtOvQndpHE34Trc4CAiJAM1aheZNSc2F
	/GAYLbfzxo4sVDtEk5Z/oGQ7MwF6KMg=
X-MC-Unique: _Zx8KvpfOFC4ipwVfs8MMg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGBB3IaIQaaAJTyc6pgLpim2uzkIORrZFszSuuPPQOKyCJKlyCr+rs+Kwvvaof6AYOMX0kR5xHk9ju685fxDoHVhPHAYVcr6sh46gJgpuRxc4UWHvFQjwekkXkTe9YbXPUb05f4le1m4RZToADDfvsgEJ3EXnFY+NnhWba2Tabj8JHXQKj0hv6kOb/212vFL9MzvGfI7RT6iLWG4tdC7ED5/t3kF/ugAe/aGIVf6y1E0iOKt4QmBHfmtqhpmeYSKBB8ngGA5pAY4wyu97BRVGczuvPwtdGjSuTBRLDzZLDQpmY+BtuzeCG+UsaimgxZEDVvFRfcL6rjPjM/Wt/1+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voY3bdBFf59fNk/Uj9SHwXXjsrtdUHrNi408J4DKvGE=;
 b=XU0lJtzet8bNjEAwuuPC5HXgmkL7haDRzUJx3tnq9s1GYh2huYAbUTFSpIQzrZn+NyXqhqboTMncFJJpu1Sb+F2d6VrJkeHoekCbk1fVUtgNVr/2kxOc4OSgvdHhEueiRi4GxRI9pfJCOMp7tidf9ThvAYAyTFZ0myRIIfZZ1F8h9RoXztTEJQzGQfUE8Fg6w8xYWBVsJfTO8afIEOr8GU7uaE51fa97qBTeb//GURwYr4DtfPnw5nvcQiCudfkP0kJYZ7wFkph2BWsWncFY1cg2NdqJH09CxzoHR60Cbxc+3eUC3CXbEbaAugNc4TMLXYL5v5NvtBP1LNzNIkXV+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3fb7f3e9-a6cf-4f8e-1141-100848b1bdd0@suse.com>
Date: Thu, 31 Mar 2022 11:44:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v4 1/8] x86/boot: make "vga=current" work with graphics modes
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
In-Reply-To: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0059.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ece3c8bd-43bc-4a8d-222f-08da12fb02c6
X-MS-TrafficTypeDiagnostic: AM6PR04MB4648:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB46483CF4687AD3D89DA31396B3E19@AM6PR04MB4648.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	80A4EL+eI6t7xUX909/xDGhdfA3RNbvT8RSHhliLzKMd4lf4BEri2+v8JPRFGtqW+9f3Rvl9NyxIWH14TG+h1M6YNNkXAatL/KB5KRCegiDx4a6EKnK7yq79yO4j+vG0QOusFCcFDO5s5GfcQBZT5nAu3vnTgLHTbR8wcIKhIhhz7BEPpsbLNz6IiyASS+8d+QrBWHBtWkcqEjEBwqkfoZhYVyDqa4DTN4J9w+4AA5L+I1gJrvhYbgW6kK9kPwqbLT0UpOkvXoDGnrAuqJiC0SHijpCGhkymDGqSqPk+OR0usPZeTKBPg/Mx235IPRWcFy1Acq5+7/N0zmAPgZ/+SnBeNoOCtiSW4GybNzqtXAzlklaWjE78487WDueqLZ28ih0RjabjMBdkqgE2+GrUQSdhtilgyLH6BhgHWE69lO3hWxhlIyDdxg9Up+hi8EvHIONc2GxrxyCMzthDDgwtAyE2O+r1ILIdFewSBLW7p+WMiN8Y0oO1DxeBw4Lzi8Y4wnCYEOmKksO1rZHYYpWmrIpUgYmUhvNaEKeZV4AIFdab9HqL8NKT47al27X3s4cOqAx7+3CMA9U44VV0dZVhCbLPRXuJLILfXSf3s3QETvDw0sMlD5/PUzIWa1ooqxQPToBC1Fdp4tmGh6aK3drkW9CHgXdSimP91cmuu8OgnoQThm9yQ1PwyFcwJPglMJfk9GwmdmHDeOTjfE8fnjHg85r2lPsCLtEIoXBXPzvXpgQjj4QWFui6z9oh6ptE+ehspzFWI5DLOZuQIxKCXGX37EAiIGisSwxFDkMAWhzIoINL7ymZTlOCCaa4kgkT2LnBiI/Vk0vC73Q1rebKf1uxzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(316002)(2616005)(86362001)(31696002)(4326008)(26005)(5660300002)(54906003)(38100700002)(8676002)(8936002)(186003)(2906002)(36756003)(83380400001)(6512007)(66946007)(66556008)(66476007)(508600001)(6506007)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dml1bnJJYVN1T0RkT1lKejFlanRUSWY2K3RQTG8zeThOWSs3cEZrVytJdWUz?=
 =?utf-8?B?WlY5dW5ybUFSL2dVMU9qQ0JUckFaVWprTUMzaUJjN3ZzRGJiUmMrRnQ5WjUz?=
 =?utf-8?B?VkhWNDlhUk1GWW4yWTdmU09kdVdCckNCV1I2cHR6ZjBMdWp3aFhwcDJxZ0dn?=
 =?utf-8?B?bFEwU1FWbXlIbGNybDF5MVVyMkM5L2NrS2cvYUVWbG9FR0c2U1VwV1Y1TXNa?=
 =?utf-8?B?OXdCWTdoMm5ub05qYUtmN2xrcUJEUFdJajJWVWRBWElleS9ENzlCM1JpTDhB?=
 =?utf-8?B?RkRsN1NqUk1DYWhGenJweGZsTSthNE1mRUFFQlIvOW5uY2dxb2FzUndRUmNB?=
 =?utf-8?B?dWg3QWpKcXhWQ0dKQjNrZitPOXhsa0R5dkdVU2tpT1Ixa1RLYnBZYUVCcEpa?=
 =?utf-8?B?NFZzMzZxODV0M0JSMWgrS1gvZlNNOEtzNDRIeCtqNkRaZGY0Z0hkcExYSGpm?=
 =?utf-8?B?bTNacWt6cC9Gd3B5ZmNYSXpHMUY5aCtPcDdibWRPNDZhcTNwc2s5SWlBMDVl?=
 =?utf-8?B?TnpLb1R6UkptSThGR0xtbFlMQ0t6aVZvVENIdmlVdHcwckFyRlRBWGl6eGpQ?=
 =?utf-8?B?bGFqdjkwWnoyTHFOdUQ2eVdoMlZ3K0FxanNKd0tlZ1dNTXEwTVBNcUppKzN6?=
 =?utf-8?B?SEhITmFNbkZCVVh3Rm5IRzljV01XdUNLUngzOEZydURsNFJ1enJ6c29ESGRN?=
 =?utf-8?B?VzRqOXVMVm9ZZVhrdjZzQmdCY1g5cnM4eGVKTzUxanB2a2gycWNEVWFpSmYz?=
 =?utf-8?B?aFdKcFNUT0pIYnZ3dDNZYlg0a0c4blBBY2p3ZXk4Y3FLQkpyOXJ2QmoxVnd5?=
 =?utf-8?B?WExoMWg5aWFxRytYZlVxZUJWaTJmdzdRNnVqbGc0TzFka2g1SzZTaFcyTVRy?=
 =?utf-8?B?by9qWTl4aFpxME5PUmVOUFJPU0tPQjV5Uno1T2VOSGpHTHI3VGJsWVB3eFZO?=
 =?utf-8?B?V28wR1cvVUw0S2x6ZVhXelBVOWUveDdSeXVXRVVTUE1aMXRlOUl0aGxoUHVp?=
 =?utf-8?B?MWNGUFhqdHVveEhZdjQ4N2oxcnRtc09KTUtPemdVeEp5aEtrZlRETEdMQ3d1?=
 =?utf-8?B?MjFnYzJqaTFwOEs3aHhPem5KR2haeHl3MGVxK0RmYVJZc2dKMkE1Wnc2TmR6?=
 =?utf-8?B?YU9EV0g5UW55dytqaU1WSzRQQzZxdTM3eVYzWmlDUnhHSlA4eHJ5R3Bac0p3?=
 =?utf-8?B?akl4VWJsMHlZMGFEVnVrSTJ1WXh0WG1UTUdFby9tbnhid0R1MExYTHYybzNL?=
 =?utf-8?B?K0srYmU0TzdQRlZhWWhEV1llYWFtam1LM2lidS9SbWZ5N29INElYOXdQYith?=
 =?utf-8?B?SjU1KzNSK0VvOURSaDV6UmVjWCtxcXBXakRZNTlYMStydTVjeHkyNzhnM0tL?=
 =?utf-8?B?T0drWDVnVUlNMlhNcmFaMTlEMVZRNWFnbGJ5VzdxQW1xR0FvQjZtU0RJVVFl?=
 =?utf-8?B?cWlzdkREZU9ENGh1VXg4c0VyV21HR3kvMWNGdUIrWkZ0OGgvblJpU1FoSlFZ?=
 =?utf-8?B?aEZGVVR5bDBFYU5rK3ZUb3h0dDlVUC9jMWVNWGhKTktiK0szcmVqZmhUTnZI?=
 =?utf-8?B?T1FDUlIweGRidkkvRklXS0NtVTk5TExDZEdEYTdiSmVhOVBrYVRWTFdzZ3Fa?=
 =?utf-8?B?YVdNTEpDRFVQRUg0dllJRUd0L0VrUlI0NE9yUkI2U1JKeGxHVTFxQ1YzM0VV?=
 =?utf-8?B?K09ESTZFYjdON0FDaEtPaTgvTlluWFlEMDdFOXFlbm1yMnVMZFdjcDE2bDdV?=
 =?utf-8?B?RGhnakRMdHdFWFFXY0RQZkM2SFgzcW85MWw1dDM0YWIxb0VJVVJxL0Zmbklk?=
 =?utf-8?B?ZmVvb2lpUkloa0RldXppd2tROUtyV0VRSzlzMnN2TGZoTmFvbDlxYjkwYUJu?=
 =?utf-8?B?ckFaNk5NZUV0VmFYbGpHbjR4Q3dtMXFvM3pFWVFIZHUrVmVxSzVqRER5bklC?=
 =?utf-8?B?THlhM1pkZmNPaWY3U1ZGdXlIcm9DaGlDMTdwckRkU3h3YWRoVFptbVpPZDNO?=
 =?utf-8?B?eGtXbUM0bHYzUUh4cnRUSlh5eXBaV0JiQTcrVFF1Ui91VWdoSkk5UGR5TmtM?=
 =?utf-8?B?Y3ptSWRleDVKQlR3WGRxc0Z4QTI5TlM0NHZ3Z2tzVXQvSGFJS09lQTFlR0l2?=
 =?utf-8?B?L3ZRZ0hnaFBMbG5ma0xzZkVZbmtKQXVYcTBSWEprclRNejNrT2FTOFJFVG9S?=
 =?utf-8?B?Rm5YakMvVFRTc0FPbHVRdGNyVVJ4QTZLeFhkSDdBV01kN0ptTzg2YWJ3NWtv?=
 =?utf-8?B?c1ZaRjNlNlZWWTkzYVRWbXRRc2FBYmNZa3pGT3cwWlVYTDdOLy9QZTVtWjQ4?=
 =?utf-8?B?OWxmOGZjWmRxcGM5TEJwQ3EwdkZEVSthY1JXVysxV1h1blphWEQ5Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ece3c8bd-43bc-4a8d-222f-08da12fb02c6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:44:12.0539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJqxkes8nz84/DSHiQjx0dY81P4ef8p15sbRNV4asNPyzpTS2UZeYxyv1f8HDLhJMdgUKdMPE9Tdw55OvOxBZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4648

GrUB2 can be told to leave the screen in the graphics mode it has been
using (or any other one), via "set gfxpayload=keep" (or suitable
variants thereof). In this case we can avoid doing another mode switch
ourselves. This in particular avoids possibly setting the screen to a
less desirable mode: On one of my test systems the set of modes
reported available by the VESA BIOS depends on whether the interposed
KVM switch has that machine set as the active one. If it's not active,
only modes up to 1024x768 get reported, while when active 1280x1024
modes are also included. For things to always work with an explicitly
specified mode (via the "vga=" option), that mode therefore needs be a
1024x768 one.

For some reason this only works for me with "multiboot2" (and
"module2"); "multiboot" (and "module") still forces the screen into text
mode, despite my reading of the sources suggesting otherwise.

For starters I'm limiting this to graphics modes; I do think this ought
to also work for text modes, but
- I can't tell whether GrUB2 can set any text mode other than 80x25
  (I've only found plain "text" to be valid as a "gfxpayload" setting),
- I'm uncertain whether supporting that is worth it, since I'm uncertain
  how many people would be running their systems/screens in text mode,
- I'd like to limit the amount of code added to the realmode trampoline.

For starters I'm also limiting mode information retrieval to raw BIOS
accesses. This will allow things to work (in principle) also with other
boot environments where a graphics mode can be left in place. The
downside is that this then still is dependent upon switching back to
real mode, so retrieving the needed information from multiboot info is
likely going to be desirable down the road.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not convinced boot_vid_mode really needs setting here; I'm doing so
mainly because setvesabysize also does.
---
v4: Add changelog entry.
v2: Use 0x9b instead of 0x99 for attributes check: I think the value
    used by check_vesa also wants to be converted, to match vesa2's.
    (Perhaps the value wants to become a #define, albeit before doing so
    I'd question the requirement of the mode to be a color one.)

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,6 +6,10 @@ The format is based on [Keep a Changelog
 
 ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
+### Changed
+ - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
+   this requires use of "multiboot2" (and "module2") as the GrUB commands loading Xen.
+
 ### Removed / support downgraded
  - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
 
--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -575,7 +575,6 @@ set14:  movw    $0x1111, %ax
         movb    $0x01, %ah              # Define cursor scan lines 11-12
         movw    $0x0b0c, %cx
         int     $0x10
-set_current:
         stc
         ret
 
@@ -693,6 +692,39 @@ vga_modes:
         .word   VIDEO_80x60, 0x50,0x3c,0        # 80x60
 vga_modes_end:
 
+# If the current mode is a VESA graphics one, obtain its parameters.
+set_current:
+        leaw    vesa_glob_info, %di
+        movw    $0x4f00, %ax
+        int     $0x10
+        cmpw    $0x004f, %ax
+        jne     .Lsetc_done
+
+        movw    $0x4f03, %ax
+        int     $0x10
+        cmpw    $0x004f, %ax
+        jne     .Lsetc_done
+
+        leaw    vesa_mode_info, %di     # Get mode information structure
+        movw    %bx, %cx
+        movw    $0x4f01, %ax
+        int     $0x10
+        cmpw    $0x004f, %ax
+        jne     .Lsetc_done
+
+        movb    (%di), %al              # Check mode attributes
+        andb    $0x9b, %al
+        cmpb    $0x9b, %al
+        jne     .Lsetc_done             # Doh! No linear frame buffer
+
+        movb    $1, bootsym(graphic_mode)
+        movw    %bx, bootsym(boot_vid_mode)
+        movw    %bx, bootsym(video_mode)
+
+.Lsetc_done:
+        stc
+        ret
+
 # Detect VESA modes.
 vesa_modes:
         movw    %di, %bp                # BP=original mode table end


