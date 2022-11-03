Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19B46185A5
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 18:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436937.691192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdce-0000su-UG; Thu, 03 Nov 2022 17:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436937.691192; Thu, 03 Nov 2022 17:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdce-0000q9-Qs; Thu, 03 Nov 2022 17:03:20 +0000
Received: by outflank-mailman (input) for mailman id 436937;
 Thu, 03 Nov 2022 17:03:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OB6F=3D=citrix.com=prvs=299187ae8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqdcc-0000Xu-RQ
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 17:03:19 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65401f76-5b99-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 18:03:11 +0100 (CET)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Nov 2022 13:03:15 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5312.namprd03.prod.outlook.com (2603:10b6:208:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 17:03:13 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%5]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 17:03:13 +0000
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
X-Inumbo-ID: 65401f76-5b99-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667494997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=PLbpNoBl19EFTypyz3W81ikc0X/QmIRH0jO2ZY90Z1k=;
  b=fMDCSpwn2pDh8obL0Mq8kyKPqOLp17r/ahK0zgvIdpDwsWFd2yLr95pm
   ElEax9R7o3ALUqNsuucxJcLY2LRnrLi3WxgM1s0pnP5hpj/RuCg5f8p1y
   z8xUs+YdBSdrLTp6EvlyXe8ShxerAuLbhelV34ihmP9ICq3T9SIqAG3lV
   U=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 84136024
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pLoiOahPhD8mD327IYSj67PBX161UxEKZh0ujC45NGQN5FlHY01je
 htvD2nVPf/cYDTzeNF3a4znpEJUvpTdn4I3HAM4qH9hRi4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QeFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQfIQ4MUk7Ao9icnqKCUdtnheIec/bkadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGyarI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXOnAdlMTOfknhJsqE+I7FY9IxAPbwTlgenn0Vz9UN9TA
 lNBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQGucksVHoV3
 1mGt9rzAHpkt7j9YXCX+6qQrDiyETMINmJEbigBJSMa5/HzrYd1iQjAJuuPC4awh9zxXDv2k
 zaDqXFkg61J1JFRkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshVZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:tkdPZ6iTTiOp2jsISb8UgtbVyHBQX0F13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hqAV7CZnichILMFu1fBOTZslnd8kHFltK1kJ
 0QCpSWa+eAcmSS8/yKhzVQeuxIqLfnzEnrv5an854Ed3AXV0gK1XYdNu/0KDwUeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0l9
 gsAp4Y6o2mcfVmHJ6VfN1xJ/dfKla9NS4kY1jiVmjPJeUgB0/njaLRzfEc2NyKEaZ4v6fa3q
 6xG29liQ==
X-IronPort-AV: E=Sophos;i="5.96,134,1665460800"; 
   d="scan'208";a="84136024"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwYokqzqKMS2vY6BV5PHTqrajLQFqTu042hm8OdBNwqujc8+pUgMGAw4qCRhXanwHXwnrbz7h2ut9QQcu30vCT1LIOQbo04FQdswvd4GBay4hz9wQHJkTGqQd47K6I6fJ/cvBhJGC6MgiHqGZ3ledwdX3y0iXnRc5j45oNevYS7qjM9v9mddUK9a1n4URggh8kkxOcJdE5oc0A8K4iTbmppv9ypMmu5eF6CK8PquWDWe4WezoAGD05d72qFz42dQHB/afIu+hM6HlmqAn6sYQcrKZPGAS7bPIOwZw6m3260H0eJ7Tr7Jc8+tH+asgiIuCayv0mXqPmFEKtmhXZpzAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CElUPn28iYIvbpP32jZwx7fJ1f1O4O5cnT/1nta7z4=;
 b=RXOeczk4myTxOu1PA0rERkL8MfCZhlTR7/FbfoS/Eovir+X49ibHOGs5v2Ju//wHwas9uTZpIa/JPhE5MW3vSujuMv0A74nNI9NVn8zUIOAsYsr+NTb0HSP6tqdWUqJ2BtqaDK8JW9xNUvr4cg5MpvlbnOPlf9BHZl8PmaBFwuHrd7g1WGL3S6AZ37gn+PRpi81QgOAlPxUfHITFMYKB17ioUpD4hxc1PFVmua7RazoCkZ97Gzduwg1XYAz7OkWaoBXdMZQnFFyMsY9/LqX4EEDVmTe9X1mEKSuAV6yoxyMtBwKnjFQoZ6iU7Qg7//sC1TuScDEcaW/1MVqrrSZa8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CElUPn28iYIvbpP32jZwx7fJ1f1O4O5cnT/1nta7z4=;
 b=DAj3pZTX53z355s5uSrFFQAogh86/DzUMVYZ2WylRukfgQ0cwH9fe9E3hllYbT/WMI/LSYS43i8i/BJA+QC8xmLFz4anuwlODTO1vf4BAwcHywoS9GYWgJwUPOUwOry8a3VoZQ/b2yNYFIfLn0OLAN+3cD3vj3sCZbVoJ57A64E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 v3 2/2] amd: remove VIRT_SC_MSR_HVM synthetic feature
Date: Thu,  3 Nov 2022 18:02:44 +0100
Message-Id: <20221103170244.29270-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103170244.29270-1-roger.pau@citrix.com>
References: <20221103170244.29270-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2c677b-b2ce-4c4e-b771-08dabdbd4aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P+ia/89gSe1BTIiPFvgjSgqkepReIuArpdYkCjtiCHY2Moc6fklxvpLYQWYmC4kTxJJGqmUlSEHEpmKIWwwnU1C4B5CgCX1TgOVJjc2gNp2lFpS36WF9rjV6LwqZY+CJ+0CSwk0OvIcn0+mRDfDWmEm9zgJ4jaAh/Nbh5zYk1FFQf51BTsW3/lfID9oVr7Atv7RmiOgQOwejwssviAW8pWGghtQJPLr8Oa7kiQOUkQNPuzV83IaA4hhidLFnxnlgY6eCaKnj5iGZtvtRAVQ1bhkM7fQoL20cADvGeb0/QFrg9D4GcjbjimUJrpun3cDae2NCwdGNJrTc1n+gG7RkIFqB6tZi/cMj4FmMnzFq0lK0c6UwsX+BFHMRDJ/Ydylx2/rhzzJz+Omasv9AZxEVK3VOZ41T4X1QUyF5iBuhH4nhDLEFR7torM18FiinYkfFR7ll0Tj9D4G/Zf/SXuTgGb1NBOWGgIciBkegktOXxCRNqjdwBHjBtKzxEp5Zc2PCpN6vEBDICfhxATS4Uwfxq9KJpYFsJT0YtzM9fpS+oFR+Wp54WrT4MBndd8PEMv/VddUg9Kih3K5WBCsEhEyB48ni447WUqeb4d3LHggQpk4/2AaQPe92lQGbFQ0gY5gQeHMvVWqT4KF3g5SHuTAPnnxhLn7pdBFCyo6dGd1uLKgAPPXdGATLPR/qeF+GCXMzJRMOnF/Nzh5fr4QtZhBOPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199015)(36756003)(5660300002)(86362001)(4326008)(6916009)(82960400001)(38100700002)(316002)(54906003)(8676002)(186003)(1076003)(66946007)(8936002)(83380400001)(6512007)(2616005)(2906002)(478600001)(6666004)(41300700001)(6486002)(26005)(6506007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDBmb1UwRnVXUWtpMUdwak4rdjVzS05lcnIwUXY2WEtyREhhYlRORVhodjhI?=
 =?utf-8?B?YU5tckwrekZ0Z0g0ZGlJV0dYa0ltQlpRUEdvTk8vdE5sL01HNWVkTWU5Znll?=
 =?utf-8?B?VVJKZlZSZmx3aXoxWFU4QkJydXFZbGdXL3BKcTV0MW84aFFpb2dHdVFyR1U3?=
 =?utf-8?B?TlE0b1VqbDMyQUd4WlppeDNDOHBJdENJWGlLT25xY1dFbjQxOW56Y0xERWJR?=
 =?utf-8?B?YndQNndUeFhsbXlUQmQyVXlXWk8rQ3ZYajkrUGw2QzJ4QjBoNHpPUTBzYVNm?=
 =?utf-8?B?UE55aEZJVUkzUXpmUXYyTUVnN2FSVFVuVUpwWVdrdEJsZGttd3BLMDZaWW1T?=
 =?utf-8?B?Q2RnZFptQUppVHRQK0pqT2JaMDFxTG12ZzBYTk5Uekt0bDdFR0t5TkJSRTZF?=
 =?utf-8?B?Mit3ZTdMUW0vZDlHaDJ4d0ZnNWR0cWwrQ2tWQ1ZJT2R2SUNhSDRCKzRCTSts?=
 =?utf-8?B?c2RZZ1BSQWpoZk03aHdhWVZMT3g0djRiYUQ2Y1gxbE9qWDhRamV0V0dwaFhS?=
 =?utf-8?B?Y1ZxRlp6VG1pN0YvVkNkTmtna1NpTU1zc0dQc0g4WW4xV1llUkMwVlZ4aVg0?=
 =?utf-8?B?b3FDbjNYYWd5OFFPeG14a0dKcGpxODNxR3hzSVZ1V0d1K2p1eTdSeEl6bDhZ?=
 =?utf-8?B?a1c5ci9sK3p4dWZTTHc2TkFlTDJEMHJuUzA1UEw1eE8xUXdHWlFpVTZPU1Nm?=
 =?utf-8?B?ZHJmaWJ2cFgySEV3bjlGa1h1MEZhTU1QTG15ZVZiNEhneXB0SmdhTlJJWTln?=
 =?utf-8?B?YWVHNjRpRUZZUEhyeFFsTmhkVENOeTZSbmdNSElDTDBubUFqM3JFSE5jV1pF?=
 =?utf-8?B?VHdOWlV5Z2J1eGZrTEpvbFRUbnpzYlB1ZVdXTWcyRm1NZmE3NHlPWlFLcS85?=
 =?utf-8?B?akxTVzlGK1pOM1dkZzZqZCtZYXZaSUsyUkZrS05aU3JWVDI1RFhvVkRhWkk1?=
 =?utf-8?B?ZTNVRmxhUDFYZUpRbUJMVEE1aEY1eElCMmNrSmxObFVhVm5lVnhCS2R3WXpY?=
 =?utf-8?B?b1FPbkVpN3JQZE9Dek9NSXpvZGt5cy9XOXRmalEwSmFUVkJNbm52cHIxSk5Q?=
 =?utf-8?B?aUE3VW9xNE0zZ2FhYkIwTlJMNnNVcmZBVERVQ1hhYXJhZ0hlRkNhOTFtTW1x?=
 =?utf-8?B?Qml4MTVrSFBpRFozUVdyZ2JJa2x3S292cmk5ck1aODkxbmhGdnFwMlNERnRa?=
 =?utf-8?B?SVU1RXRCVmFvdjRiU1A3aG96S05BUk9LNzF3RHpTWm52YU5UWVNYeEZRY2J3?=
 =?utf-8?B?U3ozZHhLaU51b3RhTWl2VFpVRUwzQnU1QTJhWUlOOGU3T1dOVGQxSGt4TEZr?=
 =?utf-8?B?M0Z2cFM5cnY2aEZXZTJrVHRrcm1MT0YzUGhHR1dMRUxCMnJMYUt3UlE2VHB4?=
 =?utf-8?B?VmRjdStZY01nd2NFYVRtZStXSUFZL2dTWlJJSDYyUExpY0J3VnoyZ0c4RDdB?=
 =?utf-8?B?eS9BKzhZdW1BOVQrNzY3UUIxYlprTDZiMENHWlF3MHFHbkdsTzlIbGI0eTZm?=
 =?utf-8?B?U0JRYzdVREdIdVprV3BoV3Q1dlNERUt5UlYxK3pKaTZJYWU1V1YvUzBCYjBm?=
 =?utf-8?B?djBHMnYrTFRyMnU0UUFmUFhrSGtDYjZScWVwemNjTVNEd0hVMk1WZU4xTTR4?=
 =?utf-8?B?eVk0YktCSFpmdVZVSzVrZ3kzKzFQVzhWQkZESEgwaHI2VlU1ZllGUEhLeDdm?=
 =?utf-8?B?ZzQrdGNxZUtkZmt4dnJWZ2pLeVRGRHRNUWhOSi9wbnZ3bU0wbzNxK3YxVHpy?=
 =?utf-8?B?dnNNQ1I1RlRidWVQa0JDZDJNQ2NGYjlEa0J6dmIxN0ZlVm43dE5rL1I0bEZr?=
 =?utf-8?B?MjBWYndkNDlmdEUvenh3M1VnbnNORTRPTGtFVTcvNENyR25OeFhna0pGdjVY?=
 =?utf-8?B?aXl4VEc0ODhYcWZRYWVseVQyTEp3Y0c4K0Z1YVJlcUpZWDhRRWJHTnpSMjBK?=
 =?utf-8?B?blc1bFF0ajYvVDhBMVNFM1FvbVVSZXRocUVJVk0zK1ZUTkZPY3NNbkppWDdC?=
 =?utf-8?B?SHVEY1ErRzltNm5WejM0a1JVdVlhREpSTnYzNDlycnFpbktHSzhqOWJRN2U3?=
 =?utf-8?B?Z2Y0cUROcnBZek1IWFkyUEsreDIzTU1BekFnZVdhTjFhNk1rcEcxLzZvNXFT?=
 =?utf-8?Q?KJC8cqL7Eykjm1YlozL/8wXqs?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2c677b-b2ce-4c4e-b771-08dabdbd4aba
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:03:12.9846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnZGggXsFmLgyndIcr1WI7e/s11V3LGQ1Rv17B2+cy+AhPp+TYMSr/CINBUj6aW45HeKzRKZ9euLSi0V23RHVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5312

Since the VIRT_SPEC_CTRL.SSBD selection is no longer context switched
on vm{entry,exit} there's no need to use a synthetic feature bit for
it anymore.

Remove the bit and instead use a global variable.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/x86/cpu/amd.c                 | 1 +
 xen/arch/x86/cpuid.c                   | 9 +++++----
 xen/arch/x86/include/asm/amd.h         | 1 +
 xen/arch/x86/include/asm/cpufeatures.h | 2 +-
 xen/arch/x86/spec_ctrl.c               | 8 ++++----
 5 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 05d72c6501..11f8e1d359 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -49,6 +49,7 @@ boolean_param("allow_unsafe", opt_allow_unsafe);
 /* Signal whether the ACPI C1E quirk is required. */
 bool __read_mostly amd_acpi_c1e_quirk;
 bool __ro_after_init amd_legacy_ssbd;
+bool __ro_after_init amd_virt_spec_ctrl;
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 822f9ace10..acc2f606ce 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -3,6 +3,7 @@
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/nospec.h>
+#include <asm/amd.h>
 #include <asm/cpuid.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
@@ -543,9 +544,9 @@ static void __init calculate_hvm_max_policy(void)
 
     /*
      * VIRT_SSBD is exposed in the default policy as a result of
-     * VIRT_SC_MSR_HVM being set, it also needs exposing in the max policy.
+     * amd_virt_spec_ctrl being set, it also needs exposing in the max policy.
      */
-    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+    if ( amd_virt_spec_ctrl )
         __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
@@ -606,9 +607,9 @@ static void __init calculate_hvm_def_policy(void)
 
     /*
      * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
-     * VIRT_SC_MSR_HVM is set.
+     * amd_virt_spec_ctrl is set.
      */
-    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+    if ( amd_virt_spec_ctrl )
         __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     sanitise_featureset(hvm_featureset);
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 81ed71710f..5c100784dd 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -152,6 +152,7 @@ extern bool amd_acpi_c1e_quirk;
 void amd_check_disable_c1e(unsigned int port, u8 value);
 
 extern bool amd_legacy_ssbd;
+extern bool amd_virt_spec_ctrl;
 bool amd_setup_legacy_ssbd(void);
 void amd_set_ssbd(bool enable);
 
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 3895de4faf..efd3a667ef 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SYNTH( 8)) /* APERFMPERF */
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
 XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
-XEN_CPUFEATURE(VIRT_SC_MSR_HVM,   X86_SYNTH(12)) /* MSR_VIRT_SPEC_CTRL exposed to HVM */
+/* Bit 12 unused. */
 XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
 XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
 XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 4e53056624..0b94af6b86 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -514,12 +514,12 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
-            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) ||
+            amd_virt_spec_ctrl ||
             opt_eager_fpu || opt_md_clear_hvm)       ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
-            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM)) ? " MSR_VIRT_SPEC_CTRL"
-                                                       : "",
+            amd_virt_spec_ctrl)                      ? " MSR_VIRT_SPEC_CTRL"
+                                                     : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_md_clear_hvm                          ? " MD_CLEAR"      : "",
@@ -1247,7 +1247,7 @@ void __init init_speculation_mitigations(void)
     /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
     if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd &&
          (cpu_has_virt_ssbd || (amd_legacy_ssbd && amd_setup_legacy_ssbd())) )
-        setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
+        amd_virt_spec_ctrl = true;
 
     /* Figure out default_xen_spec_ctrl. */
     if ( has_spec_ctrl && ibrs )
-- 
2.37.3


