Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B745AA669
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 05:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397241.637756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxPY-0004vo-R0; Fri, 02 Sep 2022 03:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397241.637756; Fri, 02 Sep 2022 03:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxPY-0004t6-Mp; Fri, 02 Sep 2022 03:32:04 +0000
Received: by outflank-mailman (input) for mailman id 397241;
 Fri, 02 Sep 2022 03:32:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UH2R=ZF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oTxPV-0004Wz-Vf
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 03:32:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80052.outbound.protection.outlook.com [40.107.8.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd047b2f-2a6f-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 05:31:59 +0200 (CEST)
Received: from AS9PR06CA0574.eurprd06.prod.outlook.com (2603:10a6:20b:486::12)
 by DB4PR08MB9310.eurprd08.prod.outlook.com (2603:10a6:10:3f6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 03:31:55 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::c3) by AS9PR06CA0574.outlook.office365.com
 (2603:10a6:20b:486::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:31:55 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Fri, 02 Sep 2022 03:31:55 +0000
Received: from 141fe9bc610f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B76D6802-23C4-43D7-917F-32D5CBFEFB05.1; 
 Fri, 02 Sep 2022 03:31:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 141fe9bc610f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 03:31:49 +0000
Received: from DU2PR04CA0172.eurprd04.prod.outlook.com (2603:10a6:10:2b0::27)
 by GV1PR08MB8154.eurprd08.prod.outlook.com (2603:10a6:150:92::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Fri, 2 Sep
 2022 03:31:46 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::d4) by DU2PR04CA0172.outlook.office365.com
 (2603:10a6:10:2b0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:45 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:31:45 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 2 Sep 2022
 03:31:44 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:40 +0000
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
X-Inumbo-ID: cd047b2f-2a6f-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ay7mTJE10ZArryG2jdemEo1OTQBY9AiGecZlPT6Xqy5FCzQLXiE/0fEsYgOeMESJ61zuempf8B+sAdrAVVolL2fyKiXr5nLS4jvSeOqXt9FBNj/HJYWZ51BEDB9jt7hJZeB8hoceOGXbNPZN74eMkyfKUcBw857iUI6jz5S135MM5PYBA9pWGSRqxUQXqVcDrYwpPifiT7QXXnW5R4ysPvQi/bsxqD01w685T/hVnLJF8DDZRsuITzDUrjTY6Qqga5neJPB3PtBm4T8w5dxMj+p11Aa8jx2uhtAGOxRSd3sV3SM+uiwnpymL7IBuc0k5YgZik7q4hSa5DRXWdlRaUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3JxDfGTgCwV+3K/QsVhEvgokhqhriH7vz3pd5PWXsY=;
 b=WODcaVs7iMD5MbekUnN198T5u+wSLjx+g+iNE5FXYJluM4/oA47oLo3dkkW5zAobGFpt2t5X4PTA2zDMchpiZzLL6J0pa6GAlR8M98LwFbtV9hB0gp5KwhSHAzWwfxvl8t1/bk+usRASkF7wvabRdVF5joIObcZKPRO1PM3KrXrJLKYx4uzSgM7iQdg2ohfH6bgKHjmv6oeaHOItjFxITFGg9UsEFBjav0kctlXLr7s2wLzdhWjdC6yaePGqc5at+0hUozChCToLem4f7vJQY8bYTR/Q/uoPEFXhHm7pgrEvWaZtYmfY378jxcH0KN/e901jUxnOjggCgnANlpqq/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3JxDfGTgCwV+3K/QsVhEvgokhqhriH7vz3pd5PWXsY=;
 b=554UaewuSmuIxEp0HIv9AjKr40PioAVIbIFXBsnOgC4pN1wC5K61fRtoSExGNu3KheHwwuj9u5LNbu1GkPaSbOnv4t4M0zRuuQK/tb4aEbf4PYgP6Uil6czNXzdPyLX1gsYCQZWIz9DBEuMPF19GFZEIq6a+NaCYX4ZbWOmLYGY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae6dbf44dc684e6f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAqTYvORQPcMS+aug8+UfSzgOk7894pX0Z8816twi3u7ngi6/CsxVkT6TNBAqIctCnGf4NOpBUqiWDOe7vmKO0dJCqk7oke7Cakf6r3x6Wg0LAAJBkkQGsWkyJH9pezfy+uf1iVKKEOSu3SAVuySymSYX60Klgz/CSOCS1p+PPMayC8kOdX/NmZCLEgj0PRLj5qvyYzWXj5GshQNPFWtZCEbXNqXQHS5D1AcJZolw36Qycm7rUavu5HOL7R9S/tIayPHJW8AY+ycQM5jIWWBncj3VaSuTfehuq9MC4jGM0GaR7oy0G2qOXdTK3pYrhcFZ+gfsCWe48VLpaBeGuxwfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3JxDfGTgCwV+3K/QsVhEvgokhqhriH7vz3pd5PWXsY=;
 b=ZsY+s+9H1kyBGQ20WsTLy9LYJrakHh/MWi62FzKuoxltv2GejK4c80BvHmXnQ3bvtJ4d5OIuTD3e5aw/Qno0+p0cWivi1Sv6446YzDgzH2zeaGCpmMLFLm2OsFmE+UqCG1KgsBRBCk5bYZRiBO9xiaxnoAmXTS03xqiT/BIyrkt4vW5YjaquTqbsDAuHB9PFEVRvYAMS2RBosY9YorHAKY7pN2W7OCpX9DZJ9pqymRuaaSCIS82RykhUuue739G6gqGOwJmWADNF6wfDLXCXP5TcnvTKmKMo4jlB8UX55Tz9P0PQoqXquvwnQyZ/bLYZmdYAET6WnilNPmypGU2wYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3JxDfGTgCwV+3K/QsVhEvgokhqhriH7vz3pd5PWXsY=;
 b=554UaewuSmuIxEp0HIv9AjKr40PioAVIbIFXBsnOgC4pN1wC5K61fRtoSExGNu3KheHwwuj9u5LNbu1GkPaSbOnv4t4M0zRuuQK/tb4aEbf4PYgP6Uil6czNXzdPyLX1gsYCQZWIz9DBEuMPF19GFZEIq6a+NaCYX4ZbWOmLYGY=
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
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 2/6] xen/x86: move generically usable NUMA code from x86 to common
Date: Fri, 2 Sep 2022 11:31:17 +0800
Message-ID: <20220902033121.540328-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902033121.540328-1-wei.chen@arm.com>
References: <20220902033121.540328-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 7346aa42-52b8-4192-9fab-08da8c93af56
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB8154:EE_|AM7EUR03FT004:EE_|DB4PR08MB9310:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1z27gsK03g+NldG0H/II4d3ALIarp7U4GThMCpbRm1XUkaiNZ50ua5w2aZARF6jq06OE81zuLSYkTEkUM1ny4Ar1hfsR6on4qTvawnU/wSziapbigHlDhbgdoNAehO+MGvOyuu0Gy4smyNdA0caIn/dCsDgj5EJjs42f1FgxL4Son8L9pzUC9PpwxGZiXk7izcYK2k4u1RJOLUw0tE1FTUa6YeLEQSv6CYI/Rfd9j8LjyKytY9JZD1XRyTxTb0IOYdAAun/IM+lxJILjBIh6W9JLshQw9+ZqNedUkQXBU9BC+8x7wfu5Yz/8o4TNRihBHdxiKWL15RRutRo/filGwHLDY5RBV/xCh3qUxvVzeqo213ZkeT3IHi91Fw4xdRot2n3q4kEnrsc4N2G8emTBvqBpf8EEgpi8vX1gplepV8WjnkFvonISwJr8T8vY61I7bMTEcVNz5WbFZNv3vxBgWPGYNTVN6Mi/0yKjmh0A5nCGSllygpyhGyMn1XlD3VH3600r8LsT3Z+Yhftu9CSZmy1q7baIC+x6z7nquBaWTUDs12OaT3+r2mAh1wVVemxgy7pu9xwOU8xNcfoWYg68CnUNw2/UeYgpMseBIplnq8Q97Qbq6CRpqv25iatDKLYJxmWakn0iZF92XGi1XMFPP7Hqz3aRPTHyMb4KCULW4Gr8nI8mljh/BcpDdhBxE9wTciawaV3qD2y0SLyY+pOlAqKVJeW0u4J4wLP+4tWWsfjyStECDfTasQMbseWo56h28e9NNTAG5ZrEtiWLD+czHXl4raHI26mi6OyaUctcAwTcf5vWenP6IE6BTOJf1r/DTnISY3x6fDGk8eRCGsafMg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(40470700004)(46966006)(36840700001)(36860700001)(6666004)(82310400005)(36756003)(8676002)(5660300002)(44832011)(30864003)(2906002)(4326008)(83380400001)(8936002)(70206006)(70586007)(40460700003)(356005)(54906003)(6916009)(316002)(478600001)(41300700001)(40480700001)(81166007)(2616005)(26005)(186003)(1076003)(7696005)(82740400003)(426003)(47076005)(336012)(86362001)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8154
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd7ebdfe-e9ff-48ca-4ef8-08da8c93a988
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GTZWJUVJc68JJUS5hKDoVBbldyuSdEfDPCwg4i+QOlOnOSuwYBu6/j06e0J7dC0N9DLnxVHO0YA7FPIM9m2D2HjGA1je14WfVsPH6FP/jUOxv5Za0woUfOqE2rsD+WhDZiINByYPPVBWsOX8LghESqD/9CzUbcQKxFyQHs2HF6UCFt/cG0LibRnKJMsCrmZTgIrOoZ9yybBXlqptwflzTls9QOJLLDqwitM/Nb0P0B2vwuk+Q4FNQX6ySgXiGGab0h5csWIYgirKbJG5ht9tHx8ZJFiGffEsrPlTHSwcWhzLma9f9o+S63p+ZHi7vrHm0Oqh97PqPpsVWK6jlM5lwu2cBX+/QqVHLraZsl0d5yTrgkS9d9iYw2Hbx9dU3ucRnDuIlGjT+2NY8TWAj//mGKF5hHXYHkz2NfGHxxm3Ewe3pYxrv1j5koVXwcfskPWiCeWcfaCnHC9wtYzWlfoal2gRhDxp/6m869QnePoPiXKG1V1wiElvxlmiOJakj/HBdtdXnt7JaqVVfTb09G8/lV9BHBrdMFqmiDgjxJdyfU79QC9eVS1V6ntA41sAN6TmMWs8xtDepBnyrzjs0o02WRiEOCSSZTmMCn8lKwosODciyY9AVZ/QvDkwl0wcR9YRNRWgQX8P4eYEgl0Pq3rS2FAyK+3ie2lzWr0yeB0V66r8HBbEMDykhDrOCdMcG07s3U13UXTH6fKvsOFiVwmcQiey+Y7zDSRhHJIvRc27Sov/2EII5abLBjfo4UplFdfmvW81oq/fLIBnk3aPmpbXjgPZrk+qG65e1IpIc+6NRMc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(396003)(136003)(36840700001)(46966006)(40470700004)(26005)(186003)(7696005)(83380400001)(2616005)(81166007)(336012)(4326008)(70586007)(70206006)(8676002)(40460700003)(1076003)(478600001)(86362001)(6916009)(82310400005)(2906002)(5660300002)(47076005)(44832011)(6666004)(30864003)(426003)(107886003)(8936002)(36860700001)(36756003)(54906003)(316002)(82740400003)(41300700001)(40480700001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 03:31:55.5336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7346aa42-52b8-4192-9fab-08da8c93af56
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9310

There are some codes in x86/numa.c can be shared by common
architectures to implememnt NUMA support. Just like some
variables and functions to check and store NUMA memory map.
And some variables and functions to do NUMA initialization.

In this patch, we move them to common/numa.c and xen/numa.h
and use the CONFIG_NUMA to gate them for non-NUMA supported
architectures. As the target header file is Xen-style, so
we trim some spaces and replace tabs for the codes that has
been moved to xen/numa.h at the same time.

As acpi_scan_nodes has been used in a common function, it
doesn't make sense to use acpi_xxx in common code, so we
rename it to numa_scan_nodes in this patch too. After that
if we still use CONFIG_ACPI_NUMA in to gate numa_scan_nodes
in numa_initmem_init, that doesn't make sense. As CONFIG_NUMA
will be selected by CONFIG_ACPI_NUMA for x86. So, we replace
CONFIG_ACPI_NUMA by CONFIG_NUMA to gate numa_scan_nodes.

As arch_numa_disabled has been implememnted for ACPI NUMA,
we can rename srat_disabled to numa_disabled and move it
to common code as well.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3 -> v4:
 1. Restore compute_hash_shift's return value to int.
 2. Remove unnecessary parentheses for macros.
 3. Use unsigned int for proper variables.
 4. Fix some code-style.
v2 -> v3:
 1. Remove acpi.h from common/numa.c.
 2. Rename acpi_scan_nodes to numa_scan_nodes.
 3. Replace u8 by uint8_t for memnodemap.
 4. Use unsigned int for memnode_shift and adjust related functions
    (compute_hash_shift, populate_memnodemap) to use correct types for
    return values or parameters.
 5. Use nodeid_t for nodeid and node numbers.
 6. Use __read_mostly and __ro_after_init for appropriate variables.
 7. Adjust the __read_mostly and __initdata location for some variables.
 8. convert from plain int to unsigned for cpuid and other proper variables.
 9. Use __attribute_pure__ instead of __attribute__((pure)).
10. Replace CONFIG_ACPI_NUMA by CONFIG_NUMA in numa_initmem_init.
11. Add const for some functions' parameters.
12. Move srat_disabled to common code with new name numa_disabled.
13. Fix some spaces code-style for numa_emulation.
14. Change from int to unsigned int for numa_fake.
v1 -> v2:
1. New patch in v2.
---
 xen/arch/x86/include/asm/acpi.h  |   1 -
 xen/arch/x86/include/asm/numa.h  |  57 +---
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/numa.c              | 430 +-----------------------------
 xen/arch/x86/smpboot.c           |   2 +-
 xen/arch/x86/srat.c              |   8 +-
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 442 +++++++++++++++++++++++++++++++
 xen/include/xen/numa.h           |  67 +++++
 9 files changed, 517 insertions(+), 492 deletions(-)
 create mode 100644 xen/common/numa.c

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 9a9cc4c240..5c2dd5da2d 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -102,7 +102,6 @@ extern unsigned long acpi_wakeup_address;
 #define ARCH_HAS_POWER_INIT	1
 
 extern s8 acpi_numa;
-extern int acpi_scan_nodes(u64 start, u64 end);
 #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 extern struct acpi_sleep_info acpi_sinfo;
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 237f2c6dbf..6c87942d43 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -9,72 +9,17 @@ typedef u8 nodeid_t;
 
 extern int srat_rev;
 
-extern nodeid_t      cpu_to_node[NR_CPUS];
-extern cpumask_t     node_to_cpumask[];
-
-#define cpu_to_node(cpu)		(cpu_to_node[cpu])
-#define parent_node(node)		(node)
-#define node_to_first_cpu(node)  (__ffs(node_to_cpumask[node]))
-#define node_to_cpumask(node)    (node_to_cpumask[node])
-
-struct node { 
-	paddr_t start, end;
-};
-
-extern int compute_hash_shift(struct node *nodes, int numnodes,
-			      nodeid_t *nodeids);
 extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
-#define VIRTUAL_BUG_ON(x) 
 
-extern void numa_add_cpu(int cpu);
-extern void numa_init_array(void);
-extern bool numa_off;
-
-extern int arch_numa_setup(const char *opt);
-extern bool arch_numa_disabled(void);
-extern bool srat_disabled(void);
-extern void numa_set_node(int cpu, nodeid_t node);
+extern bool numa_disabled(void);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
-static inline void clear_node_cpumask(int cpu)
-{
-	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-}
-
-/* Simple perfect hash to map pdx to node numbers */
-extern int memnode_shift; 
-extern unsigned long memnodemapsize;
-extern u8 *memnodemap;
-
-struct node_data {
-    unsigned long node_start_pfn;
-    unsigned long node_spanned_pages;
-};
-
-extern struct node_data node_data[];
-
-static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
-{ 
-	nodeid_t nid;
-	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
-	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift]; 
-	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]); 
-	return nid; 
-} 
-
-#define NODE_DATA(nid)		(&(node_data[nid]))
-
-#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
-#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
-#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
-				 NODE_DATA(nid)->node_spanned_pages)
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
 extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 21037b7f31..ae470ea12f 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -20,7 +20,6 @@ void early_time_init(void);
 
 void set_nr_cpu_ids(unsigned int max_cpus);
 
-void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 void arch_init_memory(void);
 void subarch_init_memory(void);
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index a5bc7a78c9..90b2a22591 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -4,20 +4,11 @@
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */ 
 
-#include <xen/mm.h>
-#include <xen/string.h>
 #include <xen/init.h>
-#include <xen/ctype.h>
+#include <xen/mm.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
-#include <xen/keyhandler.h>
-#include <xen/param.h>
-#include <xen/time.h>
-#include <xen/smp.h>
-#include <xen/pfn.h>
 #include <asm/acpi.h>
-#include <xen/sched.h>
-#include <xen/softirq.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -26,28 +17,13 @@
 /* from proto.h */
 #define round_up(x,y) ((((x)+(y))-1) & (~((y)-1)))
 
-struct node_data node_data[MAX_NUMNODES];
-
-/* Mapping from pdx to node id */
-int memnode_shift;
-static typeof(*memnodemap) _memnodemap[64];
-unsigned long memnodemapsize;
-u8 *memnodemap;
-
-nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
-    [0 ... NR_CPUS-1] = NUMA_NO_NODE
-};
 /*
  * Keep BIOS's CPU2node information, should not be used for memory allocaion
  */
 nodeid_t apicid_to_node[MAX_LOCAL_APIC] = {
     [0 ... MAX_LOCAL_APIC-1] = NUMA_NO_NODE
 };
-cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
 
-nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
-
-bool numa_off;
 s8 acpi_numa = 0;
 
 int __init arch_numa_setup(const char *opt)
@@ -69,267 +45,6 @@ bool arch_numa_disabled(void)
     return acpi_numa < 0;
 }
 
-bool srat_disabled(void)
-{
-    return numa_off || arch_numa_disabled();
-}
-
-/*
- * Given a shift value, try to populate memnodemap[]
- * Returns :
- * 1 if OK
- * 0 if memnodmap[] too small (of shift too small)
- * -1 if node overlap or lost ram (shift too big)
- */
-static int __init populate_memnodemap(const struct node *nodes,
-                                      int numnodes, int shift, nodeid_t *nodeids)
-{
-    unsigned long spdx, epdx;
-    int i, res = -1;
-
-    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        if ( (epdx >> shift) >= memnodemapsize )
-            return 0;
-        do {
-            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
-                return -1;
-
-            if ( !nodeids )
-                memnodemap[spdx >> shift] = i;
-            else
-                memnodemap[spdx >> shift] = nodeids[i];
-
-            spdx += (1UL << shift);
-        } while ( spdx < epdx );
-        res = 1;
-    }
-
-    return res;
-}
-
-static int __init allocate_cachealigned_memnodemap(void)
-{
-    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
-    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
-
-    memnodemap = mfn_to_virt(mfn);
-    mfn <<= PAGE_SHIFT;
-    size <<= PAGE_SHIFT;
-    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
-           mfn, mfn + size);
-    memnodemapsize = size / sizeof(*memnodemap);
-
-    return 0;
-}
-
-/*
- * The LSB of all start and end addresses in the node map is the value of the
- * maximum possible shift.
- */
-static int __init extract_lsb_from_nodes(const struct node *nodes,
-                                         int numnodes)
-{
-    int i, nodes_used = 0;
-    unsigned long spdx, epdx;
-    unsigned long bitfield = 0, memtop = 0;
-
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        bitfield |= spdx;
-        nodes_used++;
-        if ( epdx > memtop )
-            memtop = epdx;
-    }
-    if ( nodes_used <= 1 )
-        i = BITS_PER_LONG - 1;
-    else
-        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
-    memnodemapsize = (memtop >> i) + 1;
-    return i;
-}
-
-int __init compute_hash_shift(struct node *nodes, int numnodes,
-                              nodeid_t *nodeids)
-{
-    int shift;
-
-    shift = extract_lsb_from_nodes(nodes, numnodes);
-    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
-        memnodemap = _memnodemap;
-    else if ( allocate_cachealigned_memnodemap() )
-        return -1;
-    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
-
-    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
-    {
-        printk(KERN_INFO "Your memory is not aligned you need to "
-               "rebuild your hypervisor with a bigger NODEMAPSIZE "
-               "shift=%d\n", shift);
-        return -1;
-    }
-
-    return shift;
-}
-/* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
-{
-    unsigned long start_pfn = paddr_to_pfn(start);
-    unsigned long end_pfn = paddr_to_pfn(end);
-
-    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
-    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
-
-    node_set_online(nodeid);
-} 
-
-void __init numa_init_array(void)
-{
-    int rr, i;
-
-    /* There are unfortunately some poorly designed mainboards around
-       that only connect memory to a single CPU. This breaks the 1:1 cpu->node
-       mapping. To avoid this fill in the mapping for all possible
-       CPUs, as the number of CPUs is not known yet.
-       We round robin the existing nodes. */
-    rr = first_node(node_online_map);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-    {
-        if ( cpu_to_node[i] != NUMA_NO_NODE )
-            continue;
-        numa_set_node(i, rr);
-        rr = cycle_node(rr, node_online_map);
-    }
-}
-
-#ifdef CONFIG_NUMA_EMU
-static int numa_fake __initdata = 0;
-
-/* Numa emulation */
-static int __init numa_emulation(unsigned long start_pfn,
-                                 unsigned long end_pfn)
-{
-    int i;
-    struct node nodes[MAX_NUMNODES];
-    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
-
-    /* Kludge needed for the hash function */
-    if ( hweight64(sz) > 1 )
-    {
-        u64 x = 1;
-        while ( (x << 1) < sz )
-            x <<= 1;
-        if ( x < sz/2 )
-            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
-        sz = x;
-    }
-
-    memset(&nodes,0,sizeof(nodes));
-    for ( i = 0; i < numa_fake; i++ )
-    {
-        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
-        if ( i == numa_fake - 1 )
-            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
-        nodes[i].end = nodes[i].start + sz;
-        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
-               i,
-               nodes[i].start, nodes[i].end,
-               (nodes[i].end - nodes[i].start) >> 20);
-        node_set_online(i);
-    }
-    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
-    if ( memnode_shift < 0 )
-    {
-        memnode_shift = 0;
-        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
-        return -1;
-    }
-    for_each_online_node ( i )
-        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-    numa_init_array();
-
-    return 0;
-}
-#endif
-
-void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
-{ 
-    int i;
-    paddr_t start = pfn_to_paddr(start_pfn);
-    paddr_t end = pfn_to_paddr(end_pfn);
-
-#ifdef CONFIG_NUMA_EMU
-    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
-        return;
-#endif
-
-#ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes(start, end) )
-        return;
-#endif
-
-    printk(KERN_INFO "%s\n",
-           numa_off ? "NUMA turned off" : "No NUMA configuration found");
-
-    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
-           start, end);
-    /* setup dummy node covering all memory */
-    memnode_shift = BITS_PER_LONG - 1;
-    memnodemap = _memnodemap;
-    /* Dummy node only uses 1 slot in reality */
-    memnodemap[0] = 0;
-    memnodemapsize = 1;
-
-    nodes_clear(node_online_map);
-    node_set_online(0);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-        numa_set_node(i, 0);
-    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, start, end);
-}
-
-void numa_add_cpu(int cpu)
-{
-    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-} 
-
-void numa_set_node(int cpu, nodeid_t node)
-{
-    cpu_to_node[cpu] = node;
-}
-
-/* [numa=off] */
-static int __init cf_check numa_setup(const char *opt)
-{
-    if ( !strncmp(opt, "off", 3) )
-        numa_off = true;
-    else if ( !strncmp(opt, "on", 2) )
-        numa_off = false;
-#ifdef CONFIG_NUMA_EMU
-    else if ( !strncmp(opt, "fake=", 5) )
-    {
-        numa_off = false;
-        numa_fake = simple_strtoul(opt + 5, NULL, 0);
-        if ( numa_fake >= MAX_NUMNODES )
-            numa_fake = MAX_NUMNODES;
-    }
-#endif
-    else
-        return arch_numa_setup(opt);
-
-    return 0;
-} 
-custom_param("numa", numa_setup);
-
 /*
  * Setup early cpu_to_node.
  *
@@ -378,146 +93,3 @@ unsigned int __init arch_get_dma_bitsize(void)
                  flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
                  + PAGE_SHIFT, 32);
 }
-
-static void cf_check dump_numa(unsigned char key)
-{
-    s_time_t now = NOW();
-    unsigned int i, j, n;
-    struct domain *d;
-    struct page_info *page;
-    unsigned int page_num_node[MAX_NUMNODES];
-    const struct vnuma_info *vnuma;
-
-    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
-           now);
-
-    for_each_online_node ( i )
-    {
-        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
-
-        printk("NODE%u start->%lu size->%lu free->%lu\n",
-               i, node_start_pfn(i), node_spanned_pages(i),
-               avail_node_heap_pages(i));
-        /* sanity check phys_to_nid() */
-        if ( phys_to_nid(pa) != i )
-            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
-                   pa, phys_to_nid(pa), i);
-    }
-
-    j = cpumask_first(&cpu_online_map);
-    n = 0;
-    for_each_online_cpu ( i )
-    {
-        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
-        {
-            if ( n > 1 )
-                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-            else
-                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-            j = i;
-            n = 1;
-        }
-        else
-            ++n;
-    }
-    if ( n > 1 )
-        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-    else
-        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-
-    rcu_read_lock(&domlist_read_lock);
-
-    printk("Memory location of each domain:\n");
-    for_each_domain ( d )
-    {
-        process_pending_softirqs();
-
-        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
-
-        for_each_online_node ( i )
-            page_num_node[i] = 0;
-
-        spin_lock(&d->page_alloc_lock);
-        page_list_for_each(page, &d->page_list)
-        {
-            i = phys_to_nid(page_to_maddr(page));
-            page_num_node[i]++;
-        }
-        spin_unlock(&d->page_alloc_lock);
-
-        for_each_online_node ( i )
-            printk("    Node %u: %u\n", i, page_num_node[i]);
-
-        if ( !read_trylock(&d->vnuma_rwlock) )
-            continue;
-
-        if ( !d->vnuma )
-        {
-            read_unlock(&d->vnuma_rwlock);
-            continue;
-        }
-
-        vnuma = d->vnuma;
-        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
-               vnuma->nr_vnodes, d->max_vcpus);
-        for ( i = 0; i < vnuma->nr_vnodes; i++ )
-        {
-            unsigned int start_cpu = ~0U;
-
-            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
-                printk("       %3u: pnode ???,", i);
-            else
-                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
-
-            printk(" vcpus ");
-
-            for ( j = 0; j < d->max_vcpus; j++ )
-            {
-                if ( !(j & 0x3f) )
-                    process_pending_softirqs();
-
-                if ( vnuma->vcpu_to_vnode[j] == i )
-                {
-                    if ( start_cpu == ~0U )
-                    {
-                        printk("%d", j);
-                        start_cpu = j;
-                    }
-                }
-                else if ( start_cpu != ~0U )
-                {
-                    if ( j - 1 != start_cpu )
-                        printk("-%d ", j - 1);
-                    else
-                        printk(" ");
-                    start_cpu = ~0U;
-                }
-            }
-
-            if ( start_cpu != ~0U  && start_cpu != j - 1 )
-                printk("-%d", j - 1);
-
-            printk("\n");
-
-            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
-            {
-                if ( vnuma->vmemrange[j].nid == i )
-                    printk("           %016"PRIx64" - %016"PRIx64"\n",
-                           vnuma->vmemrange[j].start,
-                           vnuma->vmemrange[j].end);
-            }
-        }
-
-        read_unlock(&d->vnuma_rwlock);
-    }
-
-    rcu_read_unlock(&domlist_read_lock);
-}
-
-static int __init cf_check register_numa_trigger(void)
-{
-    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
-    return 0;
-}
-__initcall(register_numa_trigger);
-
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b46fd9ab18..9df08e9366 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1350,7 +1350,7 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm)
 
     x86_acpiid_to_apicid[acpi_id] = apic_id;
 
-    if ( !srat_disabled() )
+    if ( !numa_disabled() )
     {
         nodeid_t node = setup_node(pxm);
 
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index b62a152911..4c7f0c547e 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -238,7 +238,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	unsigned pxm;
 	nodeid_t node;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (pa->header.length < sizeof(struct acpi_srat_x2apic_cpu_affinity)) {
 		bad_srat();
@@ -274,7 +274,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	unsigned pxm;
 	nodeid_t node;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (pa->header.length != sizeof(struct acpi_srat_cpu_affinity)) {
 		bad_srat();
@@ -313,7 +313,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 	nodeid_t node;
 	unsigned int i;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
 		bad_srat();
@@ -520,7 +520,7 @@ void __init srat_parse_regions(paddr_t addr)
 }
 
 /* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(paddr_t start, paddr_t end)
+int __init numa_scan_nodes(paddr_t start, paddr_t end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 3baf83d527..9a3a12b12d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
 obj-y += multicall.o
 obj-y += notifier.o
+obj-$(CONFIG_NUMA) += numa.o
 obj-y += page_alloc.o
 obj-$(CONFIG_HAS_PDX) += pdx.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
diff --git a/xen/common/numa.c b/xen/common/numa.c
new file mode 100644
index 0000000000..03e7318d72
--- /dev/null
+++ b/xen/common/numa.c
@@ -0,0 +1,442 @@
+/*
+ * Generic VM initialization for NUMA setups.
+ * Copyright 2002,2003 Andi Kleen, SuSE Labs.
+ * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
+ */
+
+#include <xen/init.h>
+#include <xen/keyhandler.h>
+#include <xen/mm.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/softirq.h>
+
+struct node_data __ro_after_init node_data[MAX_NUMNODES];
+
+/* Mapping from pdx to node id */
+unsigned int __ro_after_init memnode_shift;
+unsigned long __ro_after_init memnodemapsize;
+uint8_t *__ro_after_init memnodemap;
+static uint8_t __ro_after_init _memnodemap[64];
+
+nodeid_t __read_mostly cpu_to_node[NR_CPUS] = {
+    [0 ... NR_CPUS-1] = NUMA_NO_NODE
+};
+
+cpumask_t __read_mostly node_to_cpumask[MAX_NUMNODES];
+
+nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+
+bool __read_mostly numa_off;
+
+bool numa_disabled(void)
+{
+    return numa_off || arch_numa_disabled();
+}
+
+/*
+ * Given a shift value, try to populate memnodemap[]
+ * Returns :
+ * 1 if OK
+ * 0 if memnodmap[] too small (of shift too small)
+ * -1 if node overlap or lost ram (shift too big)
+ */
+static int __init populate_memnodemap(const struct node *nodes,
+                                      unsigned int numnodes, unsigned int shift,
+                                      nodeid_t *nodeids)
+{
+    unsigned long spdx, epdx;
+    unsigned int i;
+    int res = -1;
+
+    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
+    for ( i = 0; i < numnodes; i++ )
+    {
+        spdx = paddr_to_pdx(nodes[i].start);
+        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+        if ( spdx >= epdx )
+            continue;
+        if ( (epdx >> shift) >= memnodemapsize )
+            return 0;
+        do {
+            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
+                return -1;
+
+            if ( !nodeids )
+                memnodemap[spdx >> shift] = i;
+            else
+                memnodemap[spdx >> shift] = nodeids[i];
+
+            spdx += (1UL << shift);
+        } while ( spdx < epdx );
+        res = 1;
+    }
+
+    return res;
+}
+
+static int __init allocate_cachealigned_memnodemap(void)
+{
+    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
+    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
+
+    memnodemap = mfn_to_virt(mfn);
+    mfn <<= PAGE_SHIFT;
+    size <<= PAGE_SHIFT;
+    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
+           mfn, mfn + size);
+    memnodemapsize = size / sizeof(*memnodemap);
+
+    return 0;
+}
+
+/*
+ * The LSB of all start and end addresses in the node map is the value of the
+ * maximum possible shift.
+ */
+static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
+                                                  nodeid_t numnodes)
+{
+    unsigned int i;
+    nodeid_t nodes_used = 0;
+    unsigned long spdx, epdx;
+    unsigned long bitfield = 0, memtop = 0;
+
+    for ( i = 0; i < numnodes; i++ )
+    {
+        spdx = paddr_to_pdx(nodes[i].start);
+        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+        if ( spdx >= epdx )
+            continue;
+        bitfield |= spdx;
+        nodes_used++;
+        if ( epdx > memtop )
+            memtop = epdx;
+    }
+    if ( nodes_used <= 1 )
+        i = BITS_PER_LONG - 1;
+    else
+        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
+    memnodemapsize = (memtop >> i) + 1;
+    return i;
+}
+
+int __init compute_hash_shift(const struct node *nodes,
+                              nodeid_t numnodes, nodeid_t *nodeids)
+{
+    unsigned int shift;
+
+    shift = extract_lsb_from_nodes(nodes, numnodes);
+    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
+        memnodemap = _memnodemap;
+    else if ( allocate_cachealigned_memnodemap() )
+        return -1;
+    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
+
+    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
+    {
+        printk(KERN_INFO "Your memory is not aligned you need to "
+               "rebuild your hypervisor with a bigger NODEMAPSIZE "
+               "shift=%d\n", shift);
+        return -1;
+    }
+
+    return shift;
+}
+
+/* initialize NODE_DATA given nodeid and start/end */
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
+    unsigned long start_pfn = paddr_to_pfn(start);
+    unsigned long end_pfn = paddr_to_pfn(end);
+
+    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
+    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
+
+    node_set_online(nodeid);
+}
+
+void __init numa_init_array(void)
+{
+    unsigned int i;
+    nodeid_t rr;
+
+    /*
+     * There are unfortunately some poorly designed mainboards around
+     * that only connect memory to a single CPU. This breaks the 1:1 cpu->node
+     * mapping. To avoid this fill in the mapping for all possible
+     * CPUs, as the number of CPUs is not known yet.
+     * We round robin the existing nodes.
+     */
+    rr = first_node(node_online_map);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_to_node[i] != NUMA_NO_NODE )
+            continue;
+        numa_set_node(i, rr);
+        rr = cycle_node(rr, node_online_map);
+    }
+}
+
+#ifdef CONFIG_NUMA_EMU
+static unsigned int __initdata numa_fake;
+
+/* Numa emulation */
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
+{
+    unsigned int i;
+    struct node nodes[MAX_NUMNODES];
+    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
+
+    /* Kludge needed for the hash function */
+    if ( hweight64(sz) > 1 )
+    {
+        uint64_t x = 1;
+
+        while ( (x << 1) < sz )
+            x <<= 1;
+        if ( x < sz / 2 )
+            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
+        sz = x;
+    }
+
+    memset(&nodes, 0, sizeof(nodes));
+    for ( i = 0; i < numa_fake; i++ )
+    {
+        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
+        if ( i == numa_fake - 1 )
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
+        nodes[i].end = nodes[i].start + sz;
+        printk(KERN_INFO "Faking node %u at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
+               i, nodes[i].start, nodes[i].end,
+               (nodes[i].end - nodes[i].start) >> 20);
+        node_set_online(i);
+    }
+    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
+    if ( memnode_shift < 0 )
+    {
+        memnode_shift = 0;
+        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
+        return -1;
+    }
+    for_each_online_node ( i )
+        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+    numa_init_array();
+
+    return 0;
+}
+#endif
+
+void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
+{
+    unsigned int i;
+    paddr_t start = pfn_to_paddr(start_pfn);
+    paddr_t end = pfn_to_paddr(end_pfn);
+
+#ifdef CONFIG_NUMA_EMU
+    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
+        return;
+#endif
+
+#ifdef CONFIG_NUMA
+    if ( !numa_off && !numa_scan_nodes(start, end) )
+        return;
+#endif
+
+    printk(KERN_INFO "%s\n",
+           numa_off ? "NUMA turned off" : "No NUMA configuration found");
+
+    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
+           start, end);
+    /* setup dummy node covering all memory */
+    memnode_shift = BITS_PER_LONG - 1;
+    memnodemap = _memnodemap;
+    /* Dummy node only uses 1 slot in reality */
+    memnodemap[0] = 0;
+    memnodemapsize = 1;
+
+    nodes_clear(node_online_map);
+    node_set_online(0);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+        numa_set_node(i, 0);
+    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
+    setup_node_bootmem(0, start, end);
+}
+
+void numa_add_cpu(unsigned int cpu)
+{
+    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+void numa_set_node(unsigned int cpu, nodeid_t node)
+{
+    cpu_to_node[cpu] = node;
+}
+
+/* [numa=off] */
+static int __init cf_check numa_setup(const char *opt)
+{
+    if ( !strncmp(opt, "off", 3) )
+        numa_off = true;
+    else if ( !strncmp(opt, "on", 2) )
+        numa_off = false;
+#ifdef CONFIG_NUMA_EMU
+    else if ( !strncmp(opt, "fake=", 5) )
+    {
+        numa_off = false;
+        numa_fake = simple_strtoul(opt + 5, NULL, 0);
+        if ( numa_fake >= MAX_NUMNODES )
+            numa_fake = MAX_NUMNODES;
+    }
+#endif
+    else
+        return arch_numa_setup(opt);
+
+    return 0;
+}
+custom_param("numa", numa_setup);
+
+static void cf_check dump_numa(unsigned char key)
+{
+    s_time_t now = NOW();
+    unsigned int i, j, n;
+    struct domain *d;
+    struct page_info *page;
+    unsigned int page_num_node[MAX_NUMNODES];
+    const struct vnuma_info *vnuma;
+
+    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
+           now);
+
+    for_each_online_node ( i )
+    {
+        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
+
+        printk("NODE%u start->%lu size->%lu free->%lu\n",
+               i, node_start_pfn(i), node_spanned_pages(i),
+               avail_node_heap_pages(i));
+        /* sanity check phys_to_nid() */
+        if ( phys_to_nid(pa) != i )
+            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
+                   pa, phys_to_nid(pa), i);
+    }
+
+    j = cpumask_first(&cpu_online_map);
+    n = 0;
+    for_each_online_cpu ( i )
+    {
+        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
+        {
+            if ( n > 1 )
+                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+            else
+                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+            j = i;
+            n = 1;
+        }
+        else
+            ++n;
+    }
+    if ( n > 1 )
+        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+    else
+        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+
+    rcu_read_lock(&domlist_read_lock);
+
+    printk("Memory location of each domain:\n");
+    for_each_domain ( d )
+    {
+        process_pending_softirqs();
+
+        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
+
+        for_each_online_node ( i )
+            page_num_node[i] = 0;
+
+        spin_lock(&d->page_alloc_lock);
+        page_list_for_each(page, &d->page_list)
+        {
+            i = phys_to_nid(page_to_maddr(page));
+            page_num_node[i]++;
+        }
+        spin_unlock(&d->page_alloc_lock);
+
+        for_each_online_node ( i )
+            printk("    Node %u: %u\n", i, page_num_node[i]);
+
+        if ( !read_trylock(&d->vnuma_rwlock) )
+            continue;
+
+        if ( !d->vnuma )
+        {
+            read_unlock(&d->vnuma_rwlock);
+            continue;
+        }
+
+        vnuma = d->vnuma;
+        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
+               vnuma->nr_vnodes, d->max_vcpus);
+        for ( i = 0; i < vnuma->nr_vnodes; i++ )
+        {
+            unsigned int start_cpu = ~0U;
+
+            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
+                printk("       %3u: pnode ???,", i);
+            else
+                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
+
+            printk(" vcpus ");
+
+            for ( j = 0; j < d->max_vcpus; j++ )
+            {
+                if ( !(j & 0x3f) )
+                    process_pending_softirqs();
+
+                if ( vnuma->vcpu_to_vnode[j] == i )
+                {
+                    if ( start_cpu == ~0U )
+                    {
+                        printk("%d", j);
+                        start_cpu = j;
+                    }
+                }
+                else if ( start_cpu != ~0U )
+                {
+                    if ( j - 1 != start_cpu )
+                        printk("-%d ", j - 1);
+                    else
+                        printk(" ");
+                    start_cpu = ~0U;
+                }
+            }
+
+            if ( start_cpu != ~0U  && start_cpu != j - 1 )
+                printk("-%d", j - 1);
+
+            printk("\n");
+
+            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
+            {
+                if ( vnuma->vmemrange[j].nid == i )
+                    printk("           %016"PRIx64" - %016"PRIx64"\n",
+                           vnuma->vmemrange[j].start,
+                           vnuma->vmemrange[j].end);
+            }
+        }
+
+        read_unlock(&d->vnuma_rwlock);
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+}
+
+static int __init cf_check register_numa_trigger(void)
+{
+    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
+    return 0;
+}
+__initcall(register_numa_trigger);
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 7aef1a88dc..baef4cd553 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -18,4 +18,71 @@
   (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
    ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
 
+/* The following content can be used when NUMA feature is enabled */
+#ifdef CONFIG_NUMA
+
+extern nodeid_t      cpu_to_node[NR_CPUS];
+extern cpumask_t     node_to_cpumask[];
+
+#define cpu_to_node(cpu)        cpu_to_node[cpu]
+#define parent_node(node)       (node)
+#define node_to_first_cpu(node) __ffs(node_to_cpumask[node])
+#define node_to_cpumask(node)   node_to_cpumask[node]
+
+struct node {
+    paddr_t start, end;
+};
+
+extern int compute_hash_shift(const struct node *nodes,
+                              nodeid_t numnodes, nodeid_t *nodeids);
+
+#define VIRTUAL_BUG_ON(x)
+
+extern bool numa_off;
+
+extern void numa_add_cpu(unsigned int cpu);
+extern void numa_init_array(void);
+extern void numa_set_node(unsigned int cpu, nodeid_t node);
+extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
+extern int  numa_scan_nodes(paddr_t start, paddr_t end);
+
+extern int arch_numa_setup(const char *opt);
+extern bool arch_numa_disabled(void);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
+
+static inline void clear_node_cpumask(unsigned int cpu)
+{
+    cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+/* Simple perfect hash to map pdx to node numbers */
+extern unsigned int memnode_shift;
+extern unsigned long memnodemapsize;
+extern uint8_t *memnodemap;
+
+struct node_data {
+    unsigned long node_start_pfn;
+    unsigned long node_spanned_pages;
+};
+
+extern struct node_data node_data[];
+
+static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
+{
+    nodeid_t nid;
+    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
+    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    return nid;
+}
+
+#define NODE_DATA(nid)          (&node_data[nid])
+
+#define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
+#define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
+#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
+                                 NODE_DATA(nid)->node_spanned_pages)
+
+#endif
+
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


