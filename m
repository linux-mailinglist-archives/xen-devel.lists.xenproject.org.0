Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109317CBD69
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 10:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618139.961430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsfSD-0001Ts-OC; Tue, 17 Oct 2023 08:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618139.961430; Tue, 17 Oct 2023 08:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsfSD-0001RR-LC; Tue, 17 Oct 2023 08:29:29 +0000
Received: by outflank-mailman (input) for mailman id 618139;
 Tue, 17 Oct 2023 08:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BgJ9=F7=citrix.com=prvs=6472a2412=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsfSB-0001RJ-Gt
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 08:29:27 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 466d9fe9-6cc7-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 10:29:25 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Oct 2023 04:29:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5541.namprd03.prod.outlook.com (2603:10b6:5:2ca::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 08:29:17 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 08:29:17 +0000
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
X-Inumbo-ID: 466d9fe9-6cc7-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697531365;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=dpzB4/Pk6vMweDI0cavq74LUVdNpMSu8rZZbWzhJ9es=;
  b=Prec9+SSHqakd9/oC+6qrdoKsfQjWWlcC2VBXmnzz3mtMu1RyFheGQWD
   E2IG6cLY5QR5x4RLXgBPqYWAcuXaWstq4rP9/eNauxdjs2FsWV9sMxMd3
   VnFvj+eS8w+hvTyGqCnmE5iICWbluLiF9sTJiEFgZStg2NWSQqkUJq+rP
   A=;
X-CSE-ConnectionGUID: IN2ZL/IRSsK3zLkkw693vw==
X-CSE-MsgGUID: cnR+YTpkSQes99t0H/KRtw==
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 125667687
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:8VvGyKIVga3VNHUDFE+REJQlxSXFcZb7ZxGr2PjKsXjdYENS0GNTy
 GNLX2CEPPffZmX0fNF3btu1pE8HuZLXzYVhHlBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gVhPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5WJzt80
 bs5EgsWTUuRo+G13+zqEfdz05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSLpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyjx2LGQw3OkMG4UPLa+zL1bvEWQ/VUeE0xHSQOb5tqDllHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAkQzhbeZoZvck5bTUw0
 xmCmNaBLT5lvaCRSHmd3qyJtj70Mi8QRUcdYQcUQA1D5MPsyKkrhw/LZsZuFuiylNKdJN3r6
 zWDrSx7gqpJi8cOjv+/5Qqf32rqoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaLxl8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:HSqOra+byKeAGwPYDLduk+AiI+orL9Y04lQ7vn1ZYzN/V4ixms
 20kO4AvCWZtN93YgBFpTngAtjkfZq4z/VICOYqTNSftXbdyRaVxe1Zg7cKugeQZBEWr9Qtq5
 uIEJIOauEYb2IK/PoSiTPQe7wdKb+8kZxAqt2uqUuFJjsLV0gP1WhE4tLyKDwLeOGeaKBJc6
 Z0nvArm9NWQwVuUizqbkN1JtQqWrXw5enbiQRsPW9c1DWz
X-Talos-CUID: 9a23:NsYOymMmqQCtB+5DeQ89xmpTO/oeaV6G3lPTIFDmWD13V+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A9bmH7w7aaMBo/AjKy0Lwhe/Hxoxj5Z7tOXwVkq4?=
 =?us-ascii?q?/ttLVZDAoG3C+tiioF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,231,1694750400"; 
   d="scan'208";a="125667687"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrSUunqN2PtIeLP6KoPiNNPfOj1I/FuRiqehLvZAua88yAeRBTOk/2Rspk0zmCSZ7gddk/yv65B9pXItqtDre9AbZl7kcspWLs/YVbXtKZGsnOg414E5hN6SVKNzBxKjPHOP/mMCZ85AOLT+W7jWVZ7e3DI4GaKQKKeHPbBgbqluaqXHMdUIAdEE79SvOSurJsyIFsHVedSz67Q5aGar+ZvTvNCexAy8AXIAhVAoraPgCMqZJhR8sVlNAakY9Bl33l2JSV5fl4ne6R5nCl4tW9P9+wjhcqJZ+8RwuKdiQQ25AReb9xK6bt7vZ9Um3W479G27MAr0469FwQrBghdtCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Vu7yBp8ThX2WE3+gXCv46d1txt8MKSCB0guvSb2mgk=;
 b=OQ9PbTeXgO/JKdEf4cXZT/qLFakpty3QXqQKQhQ7WQzik5mCgKdLl+s8r5NytzUKMKhxHbu/0V1glHjWjRS8JVhOHOSy2d8FwiY51HUo5hdZTJgMyOYVvapDBOhR0Ce9f4/nKjimdQ9d2iWFH7PUhS2hZyx5EMWFWdl3Ruj+w58XCceCmCM1kXVe63/Ib8sd3CtPiQ5HJb6cdC7bevH0+cuhsuPw9e65FerTbA2fx4VT61lTQc93NnFQo9S41QPLC52HAuiJTx89rrq6Yv0dzn51bJ3M17Pm7Pux4HGmXtm/RIWfGJJ3mOKvVdYcaF0jz/m26cIpQQwtbF3N7FyHnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Vu7yBp8ThX2WE3+gXCv46d1txt8MKSCB0guvSb2mgk=;
 b=VUh8rdptpmO6N8THs6dpVxgUZbg82D64fsojbcLMcEVhcYF8DVMhnLjhQC4AmX8uEhyA80UYUzSmPFflYK7fl+NeBFTVsd1WWN/DpKK9AnUwC43WBIGeqVbCCkKNzUXtcadpitoCj9C2r3Xf26Zfy9/AKjMZM7+PZII0vSDCwrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.18 v3] x86/pvh: fix identity mapping of low 1MB
Date: Tue, 17 Oct 2023 10:29:07 +0200
Message-ID: <20231017082907.14455-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0462.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5541:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e58ad4-fe7d-4433-e100-08dbceeb26ff
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sWBY8Os1igl85qYj2EY4Om4jASj9Slx5MTtxye4b37jnLBt/aBF4VrL7DgFOL0YlLrNHlC+okE1QspdgydTwLyW29/sRyhGfd0XQKzozG7u/wNjKNORSZkHZv1sieuSuOVNaPnFq/8BlIApAOrhQ4kyTDhhQQR5pqvqW1PT7QjJDBFXc2O1FO21y4lfJYuAt1miT0Kty8QBaE28nlYI6wm9yVWCBW76vpVnvghUpBvvzx6kyZjxKTygJCVhQ6ytTBasEbSX6uB+t5Kzjs9BuWTXPfdmckCuk+gwoXUgXJo4oogoMOHTw4v39f202c+YZc2E2NjDvdvJhKFp+3cbOHs4vEBgTACXhWNOb8T+QC1/Ygz1SaBAnW3MtyM35vmt/x80VlvMxfbNyldQs2WYxYkZg3teyRJLkT2FH9hASNUGFICbmrYfEz0QkTGI5O/eZ2PyEFVZhuwY6rsqKo+52xF7RHzQlrGVgzkb9V11QYMId61oq9IQEbZm3xly6ZsXwUdzpqB6QTR3SpttHiN5tnaxXDrSjBB6szcMH7SCCwfWK9GUdrq86YQf7PRWTUW+s
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(316002)(6486002)(66556008)(66946007)(66476007)(54906003)(6916009)(2616005)(1076003)(26005)(83380400001)(38100700002)(86362001)(82960400001)(36756003)(478600001)(6512007)(6506007)(6666004)(2906002)(41300700001)(5660300002)(4326008)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0s0d3VaeUxSVjBPZ21oZzhubjVnNENnM1M2S3NGMk94V0FGemZRZnRLaTZK?=
 =?utf-8?B?SGt6aVZJRnlpblptL1AzUzU3WEorWEZ2ZUpjekloOTNkNFNFdXNxOWsydWl4?=
 =?utf-8?B?bUVKV0pZQ1B4UXVPQ0ZuKzQrQkR5bkoyZnpWUXdGNldFamY5UDcvUkF6VTZu?=
 =?utf-8?B?M2w5VVBidVhWQkZUTEhpeWo1UUNDeC9nbXdEL01icHJ0ejhLdDhpdVpFcEND?=
 =?utf-8?B?azVmZGRaYmxLQWxuMkEvNjJiT0s0azE4WUhac0pRa2JtZm1EQVRKMllTN3ZK?=
 =?utf-8?B?WlNiWVUxWC9LbFI0dEJhdEVEeG9FTmVlVHNyS2cwNU0rMHRJN29LZHZwQkZk?=
 =?utf-8?B?NUhOZjNsKzd1Tm5kMkIzVUlQaFNWTWplcHhUZ3FsSkRhZU9xc1RCRmdOOE43?=
 =?utf-8?B?OXF5U05hZDFhNUxKYkdqYnNoaUI2TmhMcnA1am1NUm05MkFML25icVpDMjVr?=
 =?utf-8?B?SXE2QTdsVmJBcHU0U0NCcGlxRmV2eHJEL1dzZTlNZDA1R2M2dDBibHBCVVpa?=
 =?utf-8?B?N3pYTFhTNlA3Z0tKaGIxUkZmYWo1UmdOU2J0RWxqWXlvRSt2czB4OXhUUnA3?=
 =?utf-8?B?NzBtcDRtbndnbzhmMmM3ZmJOZ0VjdEt5em45ZlhCRnphOWVmTmFGMnlWUUlE?=
 =?utf-8?B?QmpLak5YN2wzMlI0K3UyM0c4Nlp2ZnRJMmRsSGtSK2RzcVlIbkNNQm5uUmh5?=
 =?utf-8?B?c1lBWVFhV2UyOU5lZkkwNlZ1dHk3cENXNVM0RzdJVW5kSG1rb2FndTB1b2hW?=
 =?utf-8?B?WTFrL2lQV3Q1VlBZT2s3SzdQdm1GYlk4b3JTTWlFd2UveVRHSmdTU0ZwYkJF?=
 =?utf-8?B?NUZKOHRHR0swdXBMd0Q4N0xTc2dJRy9oaExWazFyNG9wRVF3K3k1QlpxTEFB?=
 =?utf-8?B?RUkwdkxDNll6WmJCWUl4N0d4aDhlV2NlM2dPRFNkZGwvRnZyeGE0MnFlM1lz?=
 =?utf-8?B?aDlIZmY0a3BLTDNlZXcydGFQY2RsOGtmRmZHa3RUT2I4MytBcGZwWjY5SVQ5?=
 =?utf-8?B?YlNTSkpuVWExQi9aOEZ6OHVPeXQ3QkxleFRGSWtHWkhaTUhwZFcxTkZmWnVH?=
 =?utf-8?B?MXdNREcyRmlvQTQ0VzhqVVliNHY1OU1EaC9GellDNlNZU3MraFJrMmJQd3Vo?=
 =?utf-8?B?U3A3NE8yT1hPeWdOampvdkowZXd6U3E3M3FOMDFPQ1EyRmJZNmlYZjJIR3Br?=
 =?utf-8?B?aVVHc1EyS1gwenYzLzFJM25DZTFpSGM3aUZ1eW5SZlRpc1VUU3pOaThXOUt6?=
 =?utf-8?B?Mm5UbmhBTVR6YXBwTWNTU3Y1YkhvbXo0aFdLazc1bERKaTFPTStybXAxOVFi?=
 =?utf-8?B?b3V5aGYyOWJhWnZKZUwwVnZFa1djWDJSSkZPOVhQdUxCRyt1cC9QWmNwZ3FJ?=
 =?utf-8?B?aDEzMzBNUVdWMXphMGoxbUxrZmN1ZllBbmhHUUZOd203VXB1T2s5Rnl5ME5n?=
 =?utf-8?B?aHJDUExpNi8wRkxUTGUySEMvWlFGVThCU1F1bG82bm9OUkdZOWVqdUZHTzZO?=
 =?utf-8?B?WFgwT0kvbENDWU5XdmZSVlZxUVRaWjFYbUdlZjVmZXo5ZnYzbTlQRE8xVGky?=
 =?utf-8?B?N2ZUMkpFN3MyZnlrbkxObTlqMTRuSDBxTHhDR21Oc1o0eG9JUFN3UWtrc2xY?=
 =?utf-8?B?U3JURWlmMkIwYjdudm9nMTdIYWFXU0lMZW9qeXA2U2xjMjN6VnZFNXJXalA2?=
 =?utf-8?B?MWgxSzlhRmlCWU5Ga3IxK0xMREtKZjRDZ3VVS2ZBVC9Zcnl1VFVzSW9sWFY2?=
 =?utf-8?B?WW1wZ1g2ZlY1YS9rd1l0UFMzTE5tTSsyMXFWZUJWdU45VDhnU1V3eHJxTXF5?=
 =?utf-8?B?U3hzVG1mRkdSOWVXa0lhb3ppWVdKT2k4eTFLK1NoUngzS3dUS1Y2MXl6ZjNC?=
 =?utf-8?B?RkFHaU4rRDhEYXlIc1NXbDNDWlFnTG4rK296eU85dXlJaW9PNlNyd3BqY3o5?=
 =?utf-8?B?Yjc4UDM4YkxIY0ZuTFVyK1VHN3dxOFNjREUrS1JaQjUvU2RoZWl5Y2xJWjg3?=
 =?utf-8?B?VCtZQzJLMmthb3hPVmt3bzR3MGV5eXJubkwzQjFIaVZJZGlMQVZPRitpWUs2?=
 =?utf-8?B?S0hYSlB3dFo4NjhEenZEOG9lN0lnMTVKM1R1TW8zQko0TlM3aitrdVRMR3Ji?=
 =?utf-8?B?NEZPMnpHTHQyY29yV3Z3L2kxUEV5U2pxbXYveS9JNHBsZVdtUHB6WVpwSDNQ?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HIoXAJ9pGFeqxLzQEjW75eIqwPMdwmuvtQZK/53X65TM28JlVNgAzkiRDxkDBKHjRZwHZCYulUS0P2gm3oLOxvV/AUtxZbYI+yPlclcvIz4UhcVgchjSmPBzPEKY11d87fzVg7LJwNfHruwXU1Z/w3kECWk4qw6VmeMuSx7q08K2DXjc4R/vOkuUkrU2RnuY5v+RkhNPCMmWIBknRd6yzLcEAxo/7r+p95dFfOKjwVJhQa5XuGGVMwic89EjdTbyONFPPPiX847nFfOdSkP5v+9dv/EpsRxQ1nX62MxukCctJjnW27lKP8MMYI25ZDPNz/EM7J8CKVoAxmBAynRM4xffP74foEzw18pn6AAkj9rs0i2ul5InFA2r3+PZ+w6Nk74cHFurI+fm6OeRLiADRGqFlyVKuRoFn26W6n4Kb9Lo4QRcoXLi5J5reWlaXEVE+N7PQTDbYmVeH8fpcVXpJeMYc4lJG5J+gmEZHKyjuA46XNH3EBx8duqUNmS/zRa1QAW6Zw+NGoj+OWtyP/TRzO1s9+flW4rmCqLuuD/hTUyBte/xl9mCfo4oyCFV9igQx3MTeFLbbqNTX7MSaiIv1Fgz2bW7RI95UBO6mnuPmEOpCkMKDN3J/3pwW0mPzj1SH36WBruS7+Gw7eQatkTapcQJSiBW22oA5c73nRCpOQwYWj5GN4EjoCmCDinP0A00y3Glmm8/P3QWaTc1wlmvI8tQbmsKM4KQB8txdDX7kzMyws+I1tAT7fFAur0kZiMSN40PCQBM007y+BBGRe3yz+1uZ3fsOgec3k1hbXnGZ3XBoU2eB4mh+HrWtTBU+Q8ii+Rwh/7UM7EEW5Fj2DIR3n8IZj0tBJY9ZeFwq5F6qjY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e58ad4-fe7d-4433-e100-08dbceeb26ff
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 08:29:17.2404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nZaaUrkKETHWv8gvjSVykFzoTpvXLWMVvyX+YObYgwt9lmRjLnOwnA7lFzbjCgbw92l+fKLd8FiSOLGTtEwqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5541

The mapping of memory regions below the 1MB mark was all done by the PVH dom0
builder code, causing the region to be avoided by the arch specific IOMMU
hardware domain initialization code.  That lead to the IOMMU being enabled
without reserved regions in the low 1MB identity mapped in the p2m for PVH
hardware domains.  Firmware which happens to be missing RMRR/IVMD ranges
describing E820 reserved regions in the low 1MB would transiently trigger IOMMU
faults until the p2m is populated by the PVH dom0 builder:

AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0

Those errors have been observed on the osstest pinot{0,1} boxes (AMD Fam15h
Opteron(tm) Processor 3350 HE).

Rely on the IOMMU arch init code to create any identity mappings for reserved
regions in the low 1MB range (like it already does for reserved regions
elsewhere), and leave the mapping of any holes to be performed by the dom0
builder code.

Fixes: 6b4f6a31ace1 ('x86/PVH: de-duplicate mappings for first Mb of Dom0 memory')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Leave the identity mapping of holes in the low 1MB.

Changes since v1:
 - Reword commit message.
---
 xen/arch/x86/hvm/dom0_build.c       | 6 +++---
 xen/drivers/passthrough/x86/iommu.c | 8 +-------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index bc0e290db612..b8c27c1b1646 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -449,7 +449,7 @@ static int __init pvh_populate_p2m(struct domain *d)
         }
     }
 
-    /* Non-RAM regions of space below 1MB get identity mapped. */
+    /* Identity map everything below 1MB that's not already mapped. */
     for ( i = rc = 0; i < MB1_PAGES; ++i )
     {
         p2m_type_t p2mt;
@@ -459,8 +459,8 @@ static int __init pvh_populate_p2m(struct domain *d)
             rc = set_mmio_p2m_entry(d, _gfn(i), _mfn(i), PAGE_ORDER_4K);
         else
             /*
-             * If the p2m entry is already set it must belong to a RMRR and
-             * already be identity mapped, or be a RAM region.
+             * If the p2m entry is already set it must belong to a RMRR/IVMD or
+             * reserved region and be identity mapped, or else be a RAM region.
              */
             ASSERT(p2mt == p2m_ram_rw || mfn_eq(mfn, _mfn(i)));
         put_gfn(d, i);
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index c85549ccad6e..857dccb6a465 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -400,13 +400,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
     top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
 
-    /*
-     * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
-     * setting up potentially conflicting mappings here.
-     */
-    start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
-
-    for ( i = pfn_to_pdx(start), count = 0; i < top; )
+    for ( i = 0, start = 0, count = 0; i < top; )
     {
         unsigned long pfn = pdx_to_pfn(i);
         unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
-- 
2.42.0


