Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B27556BBF3
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 16:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363469.594022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pO4-0007DI-N1; Fri, 08 Jul 2022 14:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363469.594022; Fri, 08 Jul 2022 14:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pO4-0007BK-K5; Fri, 08 Jul 2022 14:55:20 +0000
Received: by outflank-mailman (input) for mailman id 363469;
 Fri, 08 Jul 2022 14:55:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EO41=XN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o9pO3-0007Ai-70
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 14:55:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80070.outbound.protection.outlook.com [40.107.8.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faf61f11-fecd-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 16:55:17 +0200 (CEST)
Received: from FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::7) by
 PAXPR08MB7550.eurprd08.prod.outlook.com (2603:10a6:102:24d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Fri, 8 Jul 2022 14:55:15 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::3e) by FR3P281CA0071.outlook.office365.com
 (2603:10a6:d10:4b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.13 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:14 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Fri, 08 Jul 2022 14:55:14 +0000
Received: from e4df9d7cd0e0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0D4ED391-D037-4F64-8AA7-E34F472A8656.1; 
 Fri, 08 Jul 2022 14:55:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e4df9d7cd0e0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 14:55:07 +0000
Received: from DB6PR0501CA0008.eurprd05.prod.outlook.com (2603:10a6:4:8f::18)
 by AM9PR08MB7029.eurprd08.prod.outlook.com (2603:10a6:20b:41b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Fri, 8 Jul
 2022 14:55:05 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::a7) by DB6PR0501CA0008.outlook.office365.com
 (2603:10a6:4:8f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:04 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:04 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 8 Jul 2022
 14:55:00 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 8 Jul 2022 14:54:58 +0000
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
X-Inumbo-ID: faf61f11-fecd-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Y8rlz8VKvCJ+pb3wMHP1qpBkwPNuhFHtB0PdNP3YEn5chgAM9ryASwJgPHIuprT3oi//6PdAQbQVJXsdZCY5c+PMZkC+ZDcJPgTZ2hQ8pNxF9cA2XSzA5FjLiIb+F4DlAmu0fkxqa8X+Vy78NJhTKUwWsGA+hasxXuOJwsyIeCGbpF1+Uq1t3IbeqyTJYJNHMt7sjUMHWx/XWz12sbxT7FHo94/MnTECFODCoib5Zb4fhWk1NJjB4pN3TtDtDdpIwnFHqem1BXoINgv2olAjTWuwHQ1ltLdwddcy/N/Wa2uAGJxhOvOrj1jxniz+WkQl6tbvwLQpFAR0uKntv25XDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ho4BETRsxA2qUWrMdXER8nJ1DBBHm4uFN3lKRvF6is=;
 b=NDruzvjU1gpf2YANfcp81r7JhVKYs9/aag8ZsZxYfjHy1SCwhEqhgbqkVaHrELsbQ41OKZm5DaETIJd0EHzRKN6gUCj5W6Yz0lG6koUP9fOdZ/ofdeLMVsrY03jgO1iMK8YXdxivDFaqosbVZOJ84UENk2xhobfZBMMdc2C5Jvg5f5BLjwmWXHIFpOmG3IzuJh/Lc5jpSAh/bz5yBX59nspmAVotIiJ/l7t1SwzEnT2RAHaLj9VqvG+klWhWe3Ma8LyX0VZK+xUiu2Jpve+XRb4RmQLy78V9ZEm3POptNtVYqqvNB9JIxmtbuGMrDbTZ5tsQwm+MTO0bNnXDArTdcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ho4BETRsxA2qUWrMdXER8nJ1DBBHm4uFN3lKRvF6is=;
 b=JGRpIbcUDYc8VOZ45VEnA5jLosCAjxYj5oIRqghV11XlYoe9L8v7ZD9nT/rdAV7xlY5EHn5HqGNdPtgzQINAva4Or1WwS7T8wEpYsAmHZRCoLRWT/b+PJZ1Bbomtm9JLIEfMoa/dz92th6BuxC1sjnylGlZtzx1zhTVxOTglOOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: acad7d1847ba8541
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SW7SOapgsaHjy5V6+jxaS1v2fpGORrIv151bhleD8GlSdsJKBFWBYAO05H5auCvOy33B9xfJVrtQygf1cpnlgB66xCRvWbzpXKx2XQD8ZUUxPUIXdkUsQjF0Exll0TC4tWfYla4kJHPJXOI1bXwu3AiNqBUQeLSFjnput2EcMM3MAMEweCq4lpb1aMezjJ5LwdY3q7ktUWPd1Kgg/gLtBP99H6mIFOp2wXqRp++q928VHCtGSgfKQtU3R6mZ0tPuRVv+K4sJ11YQbaKdZ505vp33ZP4blzgTH6bt9AM8I4hm8ExS1PVJqFlRFCPuNxXvTBJxlh6+AxA3fNgH4hsLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ho4BETRsxA2qUWrMdXER8nJ1DBBHm4uFN3lKRvF6is=;
 b=Q4qjvS+JVog5XPlhW15T5rKgeJZS4cqEP74uaEbX7FJwLaRdP0LvYnKJMoz6jK6R463Ic22wspdCcSEa6gfe6NKQcH15aRkshSSjlVIH+EHanB7pAmRMVU6qkX8jsYtoruGl4sOvIl9L9ups+2KX2JigxOAbqQbs6uRwAbvlpAzrBlypD0uB6DOfbyGG31VYugc3hfRdt5+1kMIVH3WSmY//Y+cq3qjswbNaBEQ2khRExSLEHSY10MbRf28RSN7SyP9tBOEveeerXXYdN1aJkpTPVyejYcm1rOQ4yjqfzbuQeirrD+OTSgcCA7thhJY3UsZiBLeb6gRps6MnRE32gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ho4BETRsxA2qUWrMdXER8nJ1DBBHm4uFN3lKRvF6is=;
 b=JGRpIbcUDYc8VOZ45VEnA5jLosCAjxYj5oIRqghV11XlYoe9L8v7ZD9nT/rdAV7xlY5EHn5HqGNdPtgzQINAva4Or1WwS7T8wEpYsAmHZRCoLRWT/b+PJZ1Bbomtm9JLIEfMoa/dz92th6BuxC1sjnylGlZtzx1zhTVxOTglOOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Date: Fri, 8 Jul 2022 22:54:17 +0800
Message-ID: <20220708145424.1848572-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708145424.1848572-1-wei.chen@arm.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 7e826c80-2867-4879-d9c9-08da60f1dda5
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7029:EE_|VE1EUR03FT033:EE_|PAXPR08MB7550:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AJdPe4WqzibUEo4iL+zKkkA4luh8/sgCE6g9v4kfNCaN11LUAlKMskmnRYFFyOmKkWv2gVFcear9ZuiYsmeIV4nc+RV1tEEtmtxsq+U+9kmzPkkSVJl76vZZl8zXBtFn9A98EHGEBtX1FUErlwvnWvymp4s5Zs6CH17aMVutUSDiDqBmJPi4H2oBCRhTWZGPTzvlcQh64NsonbTLHCCQfl70BxwIeF/mfSVFP5Pm4QWz5NZlhQ38Y23QI3yHXOsPdhBQhsQW+ybxu7wv3s5Whbolmsu3wBCACJkF5pEvoWdt0ZsSkhhpLzTGjMk+J8IyrDJ5htVFLSQJpR5GDHe2WtvefqFUf72EV1HwMTTG+svAQrmSpds1DD6SKMkBydKLFVPOW14h1/lRlY1DJm2n6+rDXp7Mw/JhtFGwuNBk/3fBwQXVjpAnOihV/mmhz6n3aBZq0Zn2jgD4Tk0ha4aY2+0A2e02caKc+b436Yq2mz2Bq/SXAG5hpkH03sbJs0bKm1doX+2x5sqXsbd2Vctao7ox2MoJTIyc5bzRQWA588aNDKnGEIVCZgS9AFBsBTi64zBtTsUkz3+ZI7Hf2WS7vkSUlqIFOxxRqHkCKFQTe76pACnOyy7FOpKlSIUfKhe10ZE/4BjGZp+mNa3YvRw1rQXstuAC+TyhburzWnXt9USJnlJMC9hHEYyl2r+8dg+1i33ccT3XHYDDmABcvpxTuND2j+HXKnZKZQPeH1v8ZiySGI1GtvfUOxHD1LkTHLVpxy2JzfaBe7r1BpVMrUaTvWxs4R5X4YEErkV4fr0FhW7iKoyQ23x7BcnZlMg3T8pV+8mMpJky/Ax5vPMJzsLGFBolJPJVnfIAydBTw24hLdw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(396003)(376002)(36840700001)(40470700004)(46966006)(82310400005)(44832011)(8936002)(40480700001)(5660300002)(81166007)(356005)(6916009)(1076003)(54906003)(82740400003)(7696005)(186003)(2616005)(478600001)(316002)(41300700001)(26005)(40460700003)(36860700001)(47076005)(336012)(6666004)(8676002)(4326008)(426003)(36756003)(70206006)(70586007)(83380400001)(2906002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7029
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f8a719d-dc85-41a2-0ac2-08da60f1d7b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HdbZJfUTAZfylp7ukb+DMc25W7zMCIASwTQ8v7Lc3WMlMF7uu4zI+56geyFk4pcF+cEnFtdf4k6tKC5yx0SIRCJNWjwfizvdLZ+CPPEoybNuNDA3EjpbqrIZJkQzeNZAq6Hspec1+WlhWONdmjq9/DeCin+/rpKNf4pAMuXocfQUycURVwaPDoLPFiWHfCzHGwxAUEFofH/nGj+koYq5QIJpVpvxPpQdVQU2nHRfmC9C2TTwqMabpFF40p6lYAR21Ak4+hEO8M3gxWfEBQXVRfOQB956mRaPl8rv99Jq5amsvBKp4DH1QHak/1RuYnaVNIemdsVVmzFYBpTkQnYgb8sNPi0sqqddfFk/+Ksx51FPs2kaXPzmFh3OvFKUxReqNF2CZ0RwnGnmgBagV3steYEou6dyZLv2wEIEadxFTZ46tknMPpTo4WprNNava0cN6zv/guEi/jMeuNVJVOCLChEVbdVhcvcNbKHmag/+SQWIREDmQV+bQJBgoVFRDuvPO44M+3qE1NcH5f7H8NyVZP/HX5mTXs2gy0V2rh4g4kGyaGukaakiHtbZYfgdVzglF+suY88makgz37v1gsUoJ1d67Tfx27qs4OUlE14wxDX9BiAzEFihugqSVJrTELVANAZy+yz50XWWYMSyeK0AO2drVezkaovIaf9mNfuxVOXBzyy45OuuPuRHIvosNrbkfqr13kcsLJZJCDgFyhxPTngF5WJruQ3xcQgEbUfjMNFYI856AwnX4b/xf6HvLIxN5iHhgNUwMB1ykna4ntiJsYuo867xQ/5Jox6MBi9sBR9OQZZJk+KxGMQiJFkjYYsH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(136003)(40470700004)(46966006)(36840700001)(83380400001)(1076003)(426003)(82740400003)(186003)(5660300002)(2616005)(2906002)(47076005)(36860700001)(44832011)(40480700001)(36756003)(8936002)(336012)(54906003)(478600001)(41300700001)(7696005)(6666004)(26005)(4326008)(86362001)(82310400005)(40460700003)(81166007)(8676002)(70586007)(316002)(6916009)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 14:55:14.6959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e826c80-2867-4879-d9c9-08da60f1dda5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7550

In current code, x86 is using two variables, numa_off and acpi_numa,
to indicate the NUMA status. This is because NUMA is not coupled with
ACPI, and ACPI still can work without NUMA on x86. With these two
variables' combinations, x86 can have several NUMA status:
NUMA swith on,
NUMA swith off,
NUMA swith on with NUMA emulation,
NUMA swith on with no-ACPI,
NUMA swith on with ACPI.

In this case, we introduce an enumeration numa_mode in this patch
to indicate above NUMA status, except NUMA on with emulation. Because
NUMA emulation has another variable, numa_fake, to indicate the number
of nodes for emulation. We can't use the enumeration to replace it at
the same time. But it still can be indicated by numa_on and numa_fake
as what it has been indicated.

Based on the enumeration we introduce numa_enabled_with_firmware for
callers to check NUMA status is enabled + ACPI. Using this helper is
because some NUMA implementation will use other firmware, this helper
will be easy to them to check enabled + others.

As we have touched srat_disabled, we have corrected its return value
from int to bool.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Remove fw_numa.
2. Use enumeration to replace numa_off and acpi_numa.
3. Correct return value of srat_disabled.
4. Introduce numa_enabled_with_firmware.
---
 xen/arch/x86/include/asm/acpi.h |  1 -
 xen/arch/x86/include/asm/numa.h | 16 +++++++++++++---
 xen/arch/x86/numa.c             | 28 +++++++++++++++-------------
 xen/arch/x86/setup.c            |  3 ++-
 xen/arch/x86/srat.c             | 13 +++++++------
 5 files changed, 37 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 9a9cc4c240..ab0d56dd70 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -101,7 +101,6 @@ extern unsigned long acpi_wakeup_address;
 
 #define ARCH_HAS_POWER_INIT	1
 
-extern s8 acpi_numa;
 extern int acpi_scan_nodes(u64 start, u64 end);
 #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index c32ccffde3..ee8262d969 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -28,12 +28,22 @@ extern nodeid_t pxm_to_node(unsigned int pxm);
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
 #define VIRTUAL_BUG_ON(x) 
 
+/* Enumerations for NUMA status. */
+enum numa_mode {
+	numa_on = 0,
+	numa_off,
+	/* NUMA turns on, but ACPI table is bad or disabled. */
+	numa_no_acpi,
+	/* NUMA turns on, and ACPI table works well. */
+	numa_acpi,
+};
+
 extern void numa_add_cpu(int cpu);
 extern void numa_init_array(void);
-extern bool numa_off;
-
+extern bool numa_enabled_with_firmware(void);
+extern enum numa_mode numa_status;
 
-extern int srat_disabled(void);
+extern bool srat_disabled(void);
 extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 627ae8aa95..0777a7518d 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -47,12 +47,16 @@ cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
 
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
-bool numa_off;
-s8 acpi_numa = 0;
+enum numa_mode numa_status;
 
-int srat_disabled(void)
+bool srat_disabled(void)
 {
-    return numa_off || acpi_numa < 0;
+    return numa_status == numa_off || numa_status == numa_no_acpi;
+}
+
+bool __init numa_enabled_with_firmware(void)
+{
+    return numa_status == numa_acpi;
 }
 
 /*
@@ -254,12 +258,13 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 #endif
 
 #ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes(start, end) )
+    if ( numa_status != numa_off && !acpi_scan_nodes(start, end) )
         return;
 #endif
 
     printk(KERN_INFO "%s\n",
-           numa_off ? "NUMA turned off" : "No NUMA configuration found");
+           numa_status == numa_off ? "NUMA turned off"
+                                   : "No NUMA configuration found");
 
     printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
            start, end);
@@ -292,13 +297,13 @@ void numa_set_node(int cpu, nodeid_t node)
 static int __init cf_check numa_setup(const char *opt)
 {
     if ( !strncmp(opt,"off",3) )
-        numa_off = true;
+        numa_status = numa_off;
     else if ( !strncmp(opt,"on",2) )
-        numa_off = false;
+        numa_status = numa_on;
 #ifdef CONFIG_NUMA_EMU
     else if ( !strncmp(opt, "fake=", 5) )
     {
-        numa_off = false;
+        numa_status = numa_on;
         numa_fake = simple_strtoul(opt+5,NULL,0);
         if ( numa_fake >= MAX_NUMNODES )
             numa_fake = MAX_NUMNODES;
@@ -306,10 +311,7 @@ static int __init cf_check numa_setup(const char *opt)
 #endif
 #ifdef CONFIG_ACPI_NUMA
     else if ( !strncmp(opt,"noacpi",6) )
-    {
-        numa_off = false;
-        acpi_numa = -1;
-    }
+        numa_status = numa_no_acpi;
 #endif
     else
         return -EINVAL;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f08b07b8de..4841af5926 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -329,7 +329,8 @@ void srat_detect_node(int cpu)
     node_set_online(node);
     numa_set_node(cpu, node);
 
-    if ( opt_cpu_info && acpi_numa > 0 )
+    /* Print CPU info when NUMA is enabled with ACPI. */
+    if ( opt_cpu_info && numa_enabled_with_firmware() )
         printk("CPU %d APIC %d -> Node %d\n", cpu, apicid, node);
 }
 
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index f53431f5e8..422e4c73e3 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -185,7 +185,7 @@ static __init void bad_srat(void)
 {
 	int i;
 	printk(KERN_ERR "SRAT: SRAT not used.\n");
-	acpi_numa = -1;
+	numa_status = numa_no_acpi;
 	for (i = 0; i < MAX_LOCAL_APIC; i++)
 		apicid_to_node[i] = NUMA_NO_NODE;
 	for (i = 0; i < ARRAY_SIZE(pxm2node); i++)
@@ -260,7 +260,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 
 	apicid_to_node[pa->apic_id] = node;
 	node_set(node, processor_nodes_parsed);
-	acpi_numa = 1;
+	numa_status = numa_acpi;
 
 	if (opt_acpi_verbose)
 		printk(KERN_INFO "SRAT: PXM %u -> APIC %08x -> Node %u\n",
@@ -295,7 +295,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	}
 	apicid_to_node[pa->apic_id] = node;
 	node_set(node, processor_nodes_parsed);
-	acpi_numa = 1;
+	numa_status = numa_acpi;
 
 	if (opt_acpi_verbose)
 		printk(KERN_INFO "SRAT: PXM %u -> APIC %02x -> Node %u\n",
@@ -484,7 +484,7 @@ static int __init cf_check srat_parse_region(
 	    (ma->flags & ACPI_SRAT_MEM_NON_VOLATILE))
 		return 0;
 
-	if (numa_off)
+	if (numa_status == numa_off)
 		printk(KERN_INFO "SRAT: %013"PRIx64"-%013"PRIx64"\n",
 		       ma->base_address, ma->base_address + ma->length - 1);
 
@@ -499,7 +499,7 @@ void __init srat_parse_regions(paddr_t addr)
 	u64 mask;
 	unsigned int i;
 
-	if (acpi_disabled || acpi_numa < 0 ||
+	if (acpi_disabled || numa_status == numa_no_acpi ||
 	    acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat))
 		return;
 
@@ -528,7 +528,8 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 	for (i = 0; i < MAX_NUMNODES; i++)
 		cutoff_node(i, start, end);
 
-	if (acpi_numa <= 0)
+	/* Only when numa_on with good firmware, we can do numa scan nodes. */
+	if (!numa_enabled_with_firmware())
 		return -1;
 
 	if (!nodes_cover_memory()) {
-- 
2.25.1


