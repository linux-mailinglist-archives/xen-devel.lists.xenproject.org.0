Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5E3605731
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 08:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426150.674428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOpp-0002UJ-Te; Thu, 20 Oct 2022 06:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426150.674428; Thu, 20 Oct 2022 06:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olOpp-0002Qm-Qq; Thu, 20 Oct 2022 06:15:17 +0000
Received: by outflank-mailman (input) for mailman id 426150;
 Thu, 20 Oct 2022 06:15:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=umfN=2V=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1olOpo-0002BJ-MZ
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 06:15:16 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140054.outbound.protection.outlook.com [40.107.14.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ff4c3f8-503e-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 08:15:15 +0200 (CEST)
Received: from AM6PR10CA0057.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::34)
 by AS4PR08MB7805.eurprd08.prod.outlook.com (2603:10a6:20b:518::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 06:15:12 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::50) by AM6PR10CA0057.outlook.office365.com
 (2603:10a6:209:80::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Thu, 20 Oct 2022 06:15:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Thu, 20 Oct 2022 06:15:12 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Thu, 20 Oct 2022 06:15:12 +0000
Received: from a3a542a781b0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F040717-9E47-428C-962C-CFE91661B20A.1; 
 Thu, 20 Oct 2022 06:15:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a3a542a781b0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 06:15:05 +0000
Received: from DU2PR04CA0260.eurprd04.prod.outlook.com (2603:10a6:10:28e::25)
 by DU0PR08MB8065.eurprd08.prod.outlook.com (2603:10a6:10:3e8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 20 Oct
 2022 06:15:04 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::d) by DU2PR04CA0260.outlook.office365.com
 (2603:10a6:10:28e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Thu, 20 Oct 2022 06:15:03 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Thu, 20 Oct 2022 06:15:03 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 20 Oct
 2022 06:15:02 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 20 Oct 2022 06:14:59 +0000
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
X-Inumbo-ID: 8ff4c3f8-503e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LdR72guAIt3Su1zentttDKsz0W4J1uBfw0L2wWhcXzZlyxDZaUuWJJpxu6CNSM9z4cRU/GanDd+aDrMxuYFcK5Q7eEKerWQUd+7ex3UySysU/CWUb5TzOEK5r8TCkI9Md6TFUAEZ+OEXAJGqt/Ouq08gNiP6oS4OE+AOa+aMwKvukQz0qoAiD81g1a2RPY5ICa2mo4aWxJN9TJxpcxCHsdKRTp4XnWlD80/FWa5jnI2pdwa3VwtywMTuWutTZGFAaPR1Wrf60rOiE0qMSP06tH5/iVmbDOcSQP0SYhuNQyOzxSA6wFunHH1XPhrWeLAAhoATYV3XXYDVnJbOhGycJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvH9wa2333jE45Y3VR8tOi+XK23VkwLg26N4R4RSZFM=;
 b=B0DEjhYDmOa1BDE77LcwrED8IEhvbW+wl79xaIO6rME9oFMZ2wUzQnYlQH6t9v69hSjSi4rAYmf+iEdzT4imaRW+dWqBLk3xCLDeh1FgjJpjbdc4DjReSapY8ETgWbyYtpJfuOuY5lYrCP6V9uCdDCk/Iv2YRvhnLeHlc2zzVabwTRgJu9Tes77f9gaFPbLW8nky47He8ND9cc9r4ltHUngAwLEqTw9DJbZUr4Fix9oeiiWK6Gsy23amn7OsQquajeLJGBXU8vxaGGj0zkekMcrLYaud4Di3h89pe3JOqB+B5T9vABzdOSGLNKcCrbZLx0TJvuJfzx+pHRWRUHJjEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvH9wa2333jE45Y3VR8tOi+XK23VkwLg26N4R4RSZFM=;
 b=4dgmNuRZ7yjY9XI4VtTp9Ji56lgA0XHcdFMrcCKT8X8Ef7jDNK3PgA0pERqjEtEB+fQww0P3kLui8r+1UyS2OuHpiRJ6f4o15vhMXWSYfLgFoVEHI89fmDijUx1s2A1uV2TZ/vIKDnF30u5TIuBt5dKj4Bb0E5qr5PEr+yOryw0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2169fa7b3ed6e4c4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrM88a7CkSS8QiASm+icfwUqapS8DILZsKQJ0/3UKWwasCJcBq7kZLTrGAS0pgEyjKkbiA5eS6cPOWJJ0/2FPilFxbz2huyNc1gk4n4QEZOl6alkOguTnccD3RPpxMqfP2koXDb6wzIr4LWhe/80fvf2exoY21pYItlsYK80rr0gI4XQ11dexj9GX56uyEH4VBGz5Kdi8xfmq5knAGlrOWTlfb+r9kXPKfgldkCBJxkJzZl7YeJdJL/PdvOIgXQqvZrmnPn6BbpzSx/IWH8+z1Ngn3NaKZ6kxclfwbDMHjmIIqxMj/n/33G3MHxCls49qaPx78JIhYOqG3L4VQiV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvH9wa2333jE45Y3VR8tOi+XK23VkwLg26N4R4RSZFM=;
 b=iKy0Y2j87oeyqh7dBC7/e+OZfbiN6IGLO3T8cu3yWy4qQ/SWJcUnDPORa+q/GlLwUJGzMVmXSjZYVDNUtU6M3XiPX9TyZ0mWXNXWpOunUQJnmVQ96Cu4r0tBhpekRVq0jI4KN0dEEBo70ZpnPcaSoimOFhz+Jl3oAehlyW0mNy8O4AwgqM6+ZVzMPW/r/1GBsMWchHmzVP0w0gvYrBLbYSDjUA9F2HhwIjQ/rlEY6/GIXBJE15g/C3UT4sCz4MrZJ9vyhQFTHsi0cmh8XTAIJBhfHKEKHMQrEI9nODwtbbvw16AY6muCJWAlU6dsH3J/kZAiKHV9l+YzZuTNx6GlKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvH9wa2333jE45Y3VR8tOi+XK23VkwLg26N4R4RSZFM=;
 b=4dgmNuRZ7yjY9XI4VtTp9Ji56lgA0XHcdFMrcCKT8X8Ef7jDNK3PgA0pERqjEtEB+fQww0P3kLui8r+1UyS2OuHpiRJ6f4o15vhMXWSYfLgFoVEHI89fmDijUx1s2A1uV2TZ/vIKDnF30u5TIuBt5dKj4Bb0E5qr5PEr+yOryw0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Jiamei Xie
	<jiamei.xie@arm.com>
Subject: [PATCH v7 3/6] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
Date: Thu, 20 Oct 2022 14:14:42 +0800
Message-ID: <20221020061445.288839-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020061445.288839-1-wei.chen@arm.com>
References: <20221020061445.288839-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT034:EE_|DU0PR08MB8065:EE_|AM7EUR03FT012:EE_|AS4PR08MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 214bfbd9-7c83-43ce-380c-08dab262728a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Mlo2Ei7OdBYJyXomd+fdEXzfb8c5tQRyB9IgAmQn8TDaDat8WZHcxsdwYrUKXDCeFxtAPk4S0gmldzaZYimttdxjjN3x6i382F1OCTWJvE0nT54+e0NeIbHV5Bccvhkuoz842Lk9F/uAxBaw5pSeqg1OYJ+STPFnSWhlRkW/q3ZEJvR062fup7fVsLt1AFuj05WVPdkNk5uTb7FWTsjwtAIVqNzbctsTBgX2KIA/YOM9Thxbg8yRyYlAXMhxw6O4FWKwuYaxCqqq+HhO2fQ0StX+zFI+tl1WkgDpq3PxmdT3tvFx/vDiu/zEA2cuhOxFTy9Z+BUD4UQ9MFcXWpC/c40yUMeNrgoKAEejTHnuPg84dIRz2e3+DrlSK0BGeUTULjhfWM+PAhf3jpFQeGGycRq+unjpu4cNANoyJQq5rGmICEcFo4/keE5Qj8TbS20YUPE006gjgEqEmvnmWmv7DjTT1kr1XtJ63ugRhPkyVNDb2c4CqXWdg0MRKNXESclftCJMCdZSDfU2soSa9/Kq99j5WjN+MogBxani+w9iWZr0U1BVPF29lfSHH1G63O/CwzknnlFzL/po6A/5r9l3pGSpvv1qIMejTrZWlBsEt11NRD6GPu+EyU4MnucOeEy7wr3o6KEwzdbnk03Sy3dmofxx0Mz4jcwfCLDnnG04UwwjBvxJb9Gpn+CHvAu+noLYHe4TzmfXIzvwPPHnV5zzDniH/4adKxRaRWclEh/OJjucPTd0+mpsa1g1OoIsBYk0VIQVEraRWOQP/I97rkMn4DeLy13XEqM1MtmUD1OWTqCQ7S/o3K4B9swhZ6Hz/WqA
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(83380400001)(336012)(36860700001)(40460700003)(8936002)(81166007)(356005)(5660300002)(44832011)(86362001)(82740400003)(41300700001)(4326008)(7696005)(82310400005)(2906002)(70586007)(186003)(6916009)(70206006)(6666004)(8676002)(316002)(54906003)(26005)(1076003)(40480700001)(2616005)(478600001)(426003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8065
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5e7b836a-bb2c-49f9-fed4-08dab2626d46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/FYKtd7BJem3fzSA/LpzYal88571gb1XmDzG3FH8owYXUzXL7b3XqPCezZ1ngo1rlR+g+vJfk+HDrLiinhNd8fzzceilW+inGVEoR56GGxLmsuaDq2eWCzeHsm2YmFZFomHzL62eSfiZmpDZV1jF3x1YkkBxSssnGq0Q0zqI7XI9pO2ltpGir8LYswji1wibarUQX/kK8j6pbdmTieiXl9JX3j8GnPmG6p3H0H9A3+X5N8+i14Wms1sYMc+KEKRqohLBKeuBPzd5W9L9jr7aCOi0yfI5d/dUGI5j9CW0UmByuDLpB9aAhBxcq693SZgVrId9CnDUsz9T1Utmkwv/0VdTktJVudvGcHKxGXgD2nfj43odt4/fVcHFxnvC/0RT3JXEqr+qkzHo13LptskndYVXCEfDMEqXX5iBd4PDICTBH5vD15MOzPxAFSL6JAntGAe5eGtPF5C4mqNL+9wzxMDIA4P1CJczEMNgSDceso6ZkV4EqIEpmZhsK2IqxgXFubzEoP01x37v0EzmFBafNLLIv+TySvxX3lpSDEogZ1tEWFZDd3MGsE40jfTzVwNR5t/Oi0VgMXiHdIxcMViopS50CZ9v0rOwmgITinS4e65ktZwYsyFL81C79QvmipwmuXi4os/1yadIgNsPHBPUPaqOaSAxDHGbGNGNvDPAS6vRqvcDD5YM5rvWXhZwREF9MdYhOsrd88IcziPKfs5QIW43eytOKX1nUFe3+DLz9z9DJUSm3Jv4e8Nlo+KaFHjgEWIIyjym8SUjy8EimMOSVA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(81166007)(40480700001)(40460700003)(36756003)(82310400005)(86362001)(41300700001)(26005)(8676002)(4326008)(6916009)(8936002)(7696005)(70206006)(44832011)(5660300002)(478600001)(6666004)(70586007)(316002)(2616005)(36860700001)(54906003)(82740400003)(47076005)(426003)(1076003)(186003)(336012)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 06:15:12.3921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 214bfbd9-7c83-43ce-380c-08dab262728a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7805

VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
results in two lines of error-checking code in phys_to_nid
that is not actually working and causing two compilation
errors:
1. error: "MAX_NUMNODES" undeclared (first use in this function).
   This is because in the common header file, "MAX_NUMNODES" is
   defined after the common header file includes the ARCH header
   file, where phys_to_nid has attempted to use "MAX_NUMNODES".
   This error was resolved after we moved the phys_to_nid from
   x86 ARCH header file to common header file.
2. error: wrong type argument to unary exclamation mark.
   This is because, the error-checking code contains !node_data[nid].
   But node_data is a data structure variable, it's not a pointer.

So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
enable the two lines of error-checking code. And fix the left
compilation errors by replacing !node_data[nid] to
!node_data[nid].node_spanned_pages. Although NUMA allows one node
can only have CPUs but without any memory. And node with 0 bytes
of memory might have an entry in memnodemap[] theoretically. But
that doesn't mean phys_to_nid can find any valid address from a
node with 0 bytes memory.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v6 -> v7:
1. No change.
v5 -> v6:
1. No change.
v4 -> v5:
1. No change.
v3 -> v4:
1. No change.
v2 -> v3:
1. Remove unnecessary change items in history.
2. Add Acked-by.
v1 -> v2:
1. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
2. Adjust the conditional express for ASSERT.
3. Refine the justification of using !node_data[nid].node_spanned_pages.
---
 xen/include/xen/numa.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 5b3877344b..04556f3a6f 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -35,8 +35,6 @@ struct node {
 extern int compute_hash_shift(const struct node *nodes,
                               unsigned int numnodes, const nodeid_t *nodeids);
 
-#define VIRTUAL_BUG_ON(x)
-
 extern bool numa_off;
 
 extern void numa_add_cpu(unsigned int cpu);
@@ -69,9 +67,9 @@ extern struct node_data node_data[];
 static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
 {
     nodeid_t nid;
-    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
     nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
-    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
     return nid;
 }
 
-- 
2.25.1


