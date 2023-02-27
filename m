Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE6E6A431A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 14:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502557.774404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWdli-0005lv-Kz; Mon, 27 Feb 2023 13:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502557.774404; Mon, 27 Feb 2023 13:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWdli-0005j3-Hf; Mon, 27 Feb 2023 13:42:18 +0000
Received: by outflank-mailman (input) for mailman id 502557;
 Mon, 27 Feb 2023 13:42:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rB3s=6X=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pWdlh-0005ix-2t
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 13:42:17 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8acd6ebb-b6a4-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 14:42:15 +0100 (CET)
Received: from CY5PR15CA0083.namprd15.prod.outlook.com (2603:10b6:930:18::30)
 by DM8PR12MB5398.namprd12.prod.outlook.com (2603:10b6:8:3f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.29; Mon, 27 Feb 2023 13:42:12 +0000
Received: from CY4PEPF0000C96B.namprd02.prod.outlook.com
 (2603:10b6:930:18:cafe::71) by CY5PR15CA0083.outlook.office365.com
 (2603:10b6:930:18::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29 via Frontend
 Transport; Mon, 27 Feb 2023 13:42:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C96B.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.12 via Frontend Transport; Mon, 27 Feb 2023 13:42:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Feb
 2023 07:42:09 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Feb
 2023 07:42:09 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 27 Feb 2023 07:42:07 -0600
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
X-Inumbo-ID: 8acd6ebb-b6a4-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzQP2pcYko89hxHY6my5NlweUNlSnk6V6QO/FYGPArOecwiTuJbyGR8LD7zmQ/hfeYT2XcVXHyspkDbZ6jz8mFUAux7AnAs7DFsn4xDlj6IIBJoaSw0oKwjYX0X0XTw5H2j7/utrAhxIvM4NliTOu7wS5ucc8gSF3HSnwnEu//6j/YoYku5ztIWIHztGciQDx4f+uDsliKIS7nVJFEw/GaszdYSL5qAjBFAejafGQ1i1PRPYsDiNZmmPTsNZSUyy63MULoLfCqYc3N17qAtaqsnHVlxPEi8IIk7JDpJJ7wJKFY2U7KWKD8+M5lbTDfBHqCgrc5G1ofH9R6o9z17ZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrtonYJ2cuephbMDtS+XJ/En2k8EI8+VTQdt7Wmajcc=;
 b=QRLbmuvrVWbNjUROZ+1F5ogdcqiKWZaEHsy+IByLcl7w/wXr9I98TmnLrn2ofaeu/bo+98VRHE8/g8LQ86O04uKLNA7s12bD2WxvrKJEEdFkkVj9M9chJxFtoXBa8qZ1MhuJI9AiNSj7L8YeOoVm5Hxygx3DRxcZqmCmVknLSv6A1CFj8NOKzVU5moAbVkgEmP/5B8qlSpiRRcJDxrKvk6+lscoAAKuDa42bz3/c1NrsiI3ZA1H0xcD4Z8dwsWA/nyKU5JPlGiLTiTanw6IzmIqswu9wyfT4fS7xAE14p/cPBmVPLrlvrPNO8ACXRgjrytxWivUTVO0msNr6Rjc2og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrtonYJ2cuephbMDtS+XJ/En2k8EI8+VTQdt7Wmajcc=;
 b=LIrJaEhSEka06a8J7vE8X5NisXR44I+gQuswCmmffyVe8DhHFqtj9jgPZZKFl6TU494PHujTYfgrkn6qR126Sd7oOXrDxyCVipzpc2VnuGhfrI/PJM8Dvr0uZpRRO6aeoYv7NFMgOn28DDAx0qfjtLrGMeOluSwXQ0TnrILda6s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <113d8d74-19a6-85da-8b89-1a21bf95960e@amd.com>
Date: Mon, 27 Feb 2023 14:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] build: add crypto/ to SUBDIRS
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20230227095315.6483-1-michal.orzel@amd.com>
 <c16cbd72-9a5d-cea7-dd17-c9521328fffa@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <c16cbd72-9a5d-cea7-dd17-c9521328fffa@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96B:EE_|DM8PR12MB5398:EE_
X-MS-Office365-Filtering-Correlation-Id: 9505a3b8-e0ca-4612-95fb-08db18c86dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jsu9+vGqOdoo5xB42DlrVGD/POuiCANYz3dQwwOW2ssfxRCapk7p+vUK2ojGCn7Xmr1+UQgI/vqsTIQwY3lzfbGPOhFU4X7pyM3Twqe+j6DiRRlPRveN17zU+vrE7iLgc+5iTFwHc6iImgU0kxxEXbpO5SCxu3MDRPcr+IoJyx84Fd2dPOHk+CGlLXw+tpafxiH9UsEHuroAGo8DI/P1xFD8A/mjL9xpHExq93r4RUTbKon3fEW+YccNQ8LKw3Gx+9C633YZ/A1t4CwVcZgX+heQO3Woue2OjF4o1nhIzrb1GIL29uiyroc1vy7YB5057mDCMr8g4l4h6cheU6xdrMBRZm+Zr0sXf8i8+KEgj5A8qG5fZRr6EiioAAVS3+VStu+U3ryLYq0JBjVqmz0ku3ENu5SgqQ2+AdzAHR0ENaxizUmnjx0QFusTmBOORymU/iQYNTMq/0iZNpKn3z4q3TPoMo7r2cXyFdeZSDMPb11AGrg8xcDdj/moiCRdWQrkFEijfDgbLRlhicGmd2Bk5ZzaTjznIV+IHwHTXfEccMJgErOvAqMtjJ9dzRRbKTCE5KM9b2++6NRypP10bK/8lb8JHLmDdl/JdMkivPPKmPJeMkJOmtMOpeFxTlUy6yK0lvt9cuUxFgVLcuvoHT8aQ3s9Ed8lfrJ3n/q0aCAnhUfdsbW6JX+V3C5/PWKpSL1WL+0mdxu2dtnvfFv91JVcc+6mdlD4gnFmSiDFMPw7q21e87i5i45hN5vDpeykAgb0WUStbezRHNzQZ2D1aHeoHg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199018)(40470700004)(36840700001)(46966006)(40460700003)(186003)(81166007)(83380400001)(82740400003)(356005)(8936002)(6916009)(4326008)(70206006)(41300700001)(70586007)(2906002)(8676002)(5660300002)(36860700001)(44832011)(40480700001)(336012)(6666004)(426003)(26005)(47076005)(53546011)(478600001)(2616005)(316002)(16576012)(36756003)(82310400005)(86362001)(31696002)(54906003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 13:42:11.6875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9505a3b8-e0ca-4612-95fb-08db18c86dd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C96B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5398

Hi Jan,

On 27/02/2023 11:10, Jan Beulich wrote:
> 
> 
> On 27.02.2023 10:53, Michal Orzel wrote:
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -589,7 +589,7 @@ $(TARGET): outputmakefile FORCE
>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>
>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common crypto drivers lib test
>>  define all_sources
>>      ( find include -type f -name '*.h' -print; \
>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
> 
> As long as it's arch/$(TARGET_ARCH) that's used here, crypto should imo
> also only be included when selected (or at the very least only when an
> arch might select it, which afaics is possible on x86 only right now).
> 
> It would also help if in the description you made explicit that SUBDIRS
> isn't used for anything else (the name, after all, is pretty generic).
> Which actually points at an issue: I suppose the variable would actually
> better be used elsewhere as well, e.g. in the _clean: rule and perhaps
> also in the setting of ALL_OBJS-y. (That'll require splitting the
> variable, to that e.g. _clean would use $(SUBDIRS), $(SUBDIRS-y), and
> $(SUBDIRS-) collectively.) It is, imo, that lack of consolidation which
> has caused crypto to be missing from SUBDIRS.
> 
I think what you wrote can be split into 2 parts: the part being a goal of this patch
and the cleanup/improvements that would be beneficial but not related to this patch.
The second part involves more code and there are parts to be discussed:

1) If we decide to create ALL_OBJS-y from SUBDIRS, then we would need to carve out test/ dir
that is not part of ALL_OBJS-y and add it to SUBDIRS later on. Also, the order of ALL_OBJS-y matters
for linking, so we would need to transfer the responsibility to SUBDIRS. The natural placement of
SUBDIRS (including SUBDIRS-y, etc.) would be right above ALL_OBJS-y. However, when doing clean (next point),
need-config is set to n and SUBDIRS would be empty. This means it would need to be defined somewhere at the
top of the Makefile (thus harder to make sure the linking order is correct).

2) If we deicide to use SUBDIRS for _clean rule, then we would need some foreach loop, right?
Apart from that, there are other directories that are not part of SUBDIRS i.e. include/, tools/.
Together with SUBDIRS variable, it would create confusion (these dirs are also sub-directories, so why
not having them listed in this variable?). Also, I can see that we do clean not only for $(TARGET_ARCH)
but for all the existing architectures.

I would prefer to stick for now to the goal of this patch which is to add crypto/ so that it is taken
into account for the tags/csope generation. Would the following change be ok for that purpose?

diff --git a/xen/Makefile b/xen/Makefile
index 2d55bb9401f4..05bf301bd7ab 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -589,7 +589,9 @@ $(TARGET): outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
 	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
 
-SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
+SUBDIRS-$(CONFIG_CRYPTO) += crypto
+SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test $(SUBDIRS-y)
+
 define all_sources
     ( find include -type f -name '*.h' -print; \
       find $(SUBDIRS) -type f -name '*.[chS]' -print )


~Michal

