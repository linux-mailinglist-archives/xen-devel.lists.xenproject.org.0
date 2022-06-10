Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C3E545F36
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 10:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345945.571642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nza56-0000TW-Qa; Fri, 10 Jun 2022 08:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345945.571642; Fri, 10 Jun 2022 08:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nza56-0000RO-Nd; Fri, 10 Jun 2022 08:33:24 +0000
Received: by outflank-mailman (input) for mailman id 345945;
 Fri, 10 Jun 2022 08:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0XP=WR=citrix.com=prvs=1532263ae=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nza54-0000RA-Hw
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 08:33:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb0fb2e4-e897-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 10:33:20 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jun 2022 04:33:12 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB5767.namprd03.prod.outlook.com (2603:10b6:510:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 08:33:08 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 08:33:08 +0000
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
X-Inumbo-ID: fb0fb2e4-e897-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654850000;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=9KJQ2h6hrhgJD9t4ADu6fSuwAnN2c9GIrQ6DBIoVeg8=;
  b=NQXve0vxzD3Aae1g0YbnS/2LjN9YmmDqj5G6qIkQqeKvglVhrjn414mx
   5ledvX/41voDzn3iyhrWl+MD79v3uJxvzZjmQEJ+Kjbn/GhgOc4+kv8xM
   DvjqGC+NMDdNP6jUij22zO6E1SQpgDJjSs+GvssoSo0NB4MSIXvYgBv7a
   A=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 73147832
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VeSwnq3qnjulUDW5S/bD5alwkn2cJEfYwER7XKvMYLTBsI5bpzxSm
 GsXWDiCOvncMzfxeNt/adjk80gA65GBn9BiTgE6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tAx2YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Sha3uaS51O5bXv90/DAIAPjhuO4tvreqvzXiX6aR/zmXgWl61mrBCKR9zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82cBfyVure03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutriakKmEH+AnPzUYxy27TylQvi4ffC/3ceMCoAuZxm3eUg
 0uTqgwVBTlfbrRz0wGt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydG7gEOjX9NUK
 2QP5zEj66M18SSDUd3VTxC+5nmesXY0Q9NNF8Uq5QfLzbDbizt1HUABRz9FLdAj6sk/QGVz0
 kfTxoy2QztyrLeSVHSRsK+Oqi+/MjQUKmlEYjIYSQwC4J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjQxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:gIJORaoayCqaabfE40CSGgoaV5vNL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwI080kqQFmbX5XI3SJTUO3VHFEGgM1/qH/9SNIU3DH41mpN
 pdmtZFebrN5DFB5K6VgTVQe+xQuuVvm5rY4Ns2oU0dLj2DPMpbnnxE40ugYzpLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmUCzpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+74oAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKiQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgcdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfVsRLQkjQxo+ao7bWzHANhNKp
 guMCic3occTbqiVQGUgoE1q+bcHkjaHX+9Mzs/U4KuontrdUtCvjQlLfwk7ws9Ha0GOud5Dp
 z/Q8JVfZF1P7orhPFGdZM8qfXeMB29fTv8dESvHH/AKIYrf1rwlr+f2sRE2AjtQu1B8KcP
X-IronPort-AV: E=Sophos;i="5.91,288,1647316800"; 
   d="scan'208";a="73147832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtJAHXqfzZkmqQuUrrOu4hZdTbYzm44iW5+PcQC/vdQkEINJRFVHBFeTZ4ShQwofxHwyeEvdDnYJn/vC3DVwPl24Yk4RDwbLGnGl0i80/I5poZc2ac8S2tujuL1eEZAj5drRrp7MpaM7I9STUqxwX2ek0HBkCCVAGKiMtPukksWmIT334b4K55Nusrk60IrLNr1Alid3aI5my4E9GFf5q1T0hXh2F64hrs/KayS6XhJmu6m+qzkbq+kPavhOxapyjFZ6Rhn6a7zcQzABN2HF19ZfDjrK0Gl2fgF8mHKBRNO09hqEbJQFZEVnD+lZ9Qt3SNWwYR8VJaySx+7zcEcXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DyW1xcDZldX1qb0nLrAkp+PKepSFMDyWUhGZOq7rdg=;
 b=STsph8KXndZwlzPfOz4QVczCrabc5mDHweJ4Wqk2wooTesjjuTXbWwESTiBuANPI8Vlbsp007XgLuHFk4FxikSUsnfJLJwixHUryQGVytn3X265RurHqln0GzNEjBKiyq1cUcoHWRAiiiomcA/qva9fCGgqk9GEM1EQ9Bor+eMISpgrmYbJdBxRReGKqmHHfaEPObG5S+kdHAD3Ot7572n4BSQI6mQ7NShYUQ3d5th+266XOmjbrYt+AUJVc/Lv+G9JrkHqlwBQjt1XPGTrupXMiYz3v8MffUfF1ua0t42BE7Ch5eOToIlYE8D7P61IF7/gHqRxkZktRh3Tkg1g+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DyW1xcDZldX1qb0nLrAkp+PKepSFMDyWUhGZOq7rdg=;
 b=dIpTHVPV6GiEC5FRX4g3k44U5HPB7u+kHGOFYlRhDShwzNmTlw0NFj4JWezILXTL6LlGggl8pgP58634AzsltuRg1BJAKLwWhsBuDgINleiiih/K3xFvhNSnT4YB0IrNCExmlWHgbO2Vlvw3QGJWGYc4CvnpTWPu3+n6APdbjnw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH] iommu: add preemption support to iommu_{un,}map()
Date: Fri, 10 Jun 2022 10:32:48 +0200
Message-Id: <20220610083248.25800-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0142.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29fecd27-c0d8-458c-46ef-08da4abbd8aa
X-MS-TrafficTypeDiagnostic: PH0PR03MB5767:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB5767CB5E03D24072B08F96668FA69@PH0PR03MB5767.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OP4yJs39IC4nZ1bj0aGHYs2LIRO5zuIlG9+X2YkC5mFPu6ayMp2xJLH1iuS7v/3pSlBPkgmHKuk92tP0JQuzy0uO9OGj4eJdRYX9amu7f9cIy6AWR38redgzTki9kqXXJTPeX9qCKISDwGw4yicMBrz+NnsGgaRAPJ2Pi7TjZLx8F3snqjvo+GIRq+iD49+VINixpN/M6U8gAjyUMeNt0hTKyVhcP5xVArncoSPafgspqsOaqed2EhprhxF6W5JaxJb+C71t74dwVjt+MkTt6YJEbpEseLHmPhSwxVMR06kv/XTJ34Y1TMgxfSoF+XUCSv0iyQCqDTOPMSdCiO8yI043s5svcQSMSx+fIB4aexWLqJfTAsCxXbqgB/DI9NPh/RM+b4yOqfzY1uPLXDmuOOLmUWNKXa8tKoPkPyh7d4OaWB++5KQJRCii7hGRZ6f97aChNF1YAfVsN+voAFHZqDNV1ROndTu6CzhN33A516p4uFVxYJoD8vVyG1sl3iLf9Rsb8UvPpdlwtED+xZJ4AQzgH3w2N84S6DHH2ILrPhcNrZxqeCIBQ+n2QPYLkBg3fmi1LWBtflZpPfbmG0B/Apnsr3xI71pqgRmOhYCTBa8OwwxiPLkC8uNf9jPPP60FkaSNu+PD+YobYO9NpGceIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(1076003)(54906003)(8936002)(6916009)(2616005)(4326008)(8676002)(66946007)(66556008)(86362001)(316002)(6666004)(26005)(82960400001)(66476007)(38100700002)(6506007)(6512007)(508600001)(186003)(83380400001)(6486002)(36756003)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RksraGowVDdMQUNjT2J2dS9lSTVjQ2tuRGJERXYvdzBwd29FKy9oTVVLNUtS?=
 =?utf-8?B?Y04zK1V0NlJ3UWxWcmpyQ0lkSnhPRzZFOE5Ud1JiY0FCRkcrMnNTTTVsamxy?=
 =?utf-8?B?ZlNQVjhvcXVXQ1FyMUJhM2lVaW9UZVBBYWladllObWNwVWFZV0t3OHRvdGZR?=
 =?utf-8?B?aS8yelRDNnVSamlwYXNoNDJYZEE0TG9Sc1p6RUUza1k5MTJTMFExenlGaHdW?=
 =?utf-8?B?bEFkUUl6bUkxQXJia1NZWkx3N0Q1dnJXV01oMnpRUXdESjBScktJd1pGSGEr?=
 =?utf-8?B?Z0xNdlZrYVpGSDJNdmFSNTRXZ1JjTHlNYjRCeFpZSWRJWEdYQzkwRTZ4bjZl?=
 =?utf-8?B?a1JIdDJ3RkdPQ0hmTzVDUk0rVEpaVXNndlpkU3Nhc1BaNnVCQk9QTGl6UWZ2?=
 =?utf-8?B?QlNMd29iaVY5b3I2cDVHOGZ1NDJUT3BsK2JGZFhOU2hMQXRWNlI0azdoZTBI?=
 =?utf-8?B?WlZsTU5pamhreThaS05jZUYzT3plNUd2RlFYdk5mOU1KUUo5T0xDQmk3OE5C?=
 =?utf-8?B?VkQvZzM3aTZacjZzaXhaQ1Y5NXpKTmVQOW1ndU9WQjVlV1NkN210czUxaDZy?=
 =?utf-8?B?RklDYXJlZUJjS0ZISVBtYS9WVjdUMmh2cHJHNXZORTZwb29qTkplc1Z4cHd4?=
 =?utf-8?B?NTRNTmpaZnJLU2syeE82MFoyZTRpbVNON0UyZWM4TDFRRmhiL1hCb2tUOHFR?=
 =?utf-8?B?VCt0bWZZTVRFTzRCRFQvbnNvV3h1WUpqdW1pdTNMbXllcldWeWJ3RTlOenNh?=
 =?utf-8?B?UStjY3AzaDNGRFJSdmllUi9WTFBqSUFjaU1qUTRTMFJlNjFCODVxZ3U4Kyt6?=
 =?utf-8?B?Ri9ycGwrZTgveVNWMjVqajRpeVovSXI1SE1YL1BEMGZpQWRHYWFxRVNBOEQ1?=
 =?utf-8?B?dUpUc2s5bDVYYzQ0QTV2QVhKclIvQ0hON0o2VGlKQ2EwalBiUEE3OHNnWkRa?=
 =?utf-8?B?S05GUUdyYjFNNWZibEhjT3lFNjFFVUZrNDg0dmVnekVFcEZLMXNZWTZCQ0Er?=
 =?utf-8?B?M0NPT0E5eEp1REp1RlRUOGVWRG16M2lHdFFFaFJobFhzdWxseXV2TUxJaC94?=
 =?utf-8?B?c05UMkw0OE5aZGRSZzhmM2YyM2VkbFJLOUU5WlNvdzdpWW1BQlY4byt5Ymxx?=
 =?utf-8?B?ck92SWhqQmovTVQzR1M1ZTk1a3pobnpGdXRrZHRjOGZJM3ozMHV1ZEhmRDho?=
 =?utf-8?B?ZGZxZ09pdmFYWUdrTFJWTm5pVlZNQk5GT0hlM1BncW5XcHoxcFR4VG5yVWRH?=
 =?utf-8?B?bXBVZUxTM2FZUEp1TGFZV29VclhaWFFQU1duWUpkWXdmaEpNTXFRS29mZllx?=
 =?utf-8?B?SGl6ZzNpWTlKUW1zZVNJMWkvM1VGSyt2U2tjS1Ira1BGblZYejRwdjlIaGtU?=
 =?utf-8?B?NlJlNXVucldZYW1MdU13bmw1bzAxR2FhWXVsRzNuUERlYVBTc1ZXckdMT2Fw?=
 =?utf-8?B?a0YyZCt2a09WUEFieFlJZXJKRTVoN1paUmNseTRtM05IeURNQzlBVkZrWFFn?=
 =?utf-8?B?QnU5bWtqSDdha21SNXNxa05GVFRQWmY1QWxqbWp2aERpSExaV1FodDVBeHpZ?=
 =?utf-8?B?RDU1MWJ0ejZzYm9uVjVnMEE5dVRpN1RnVGx1VkJNamU3ZzdyVmN3c2QyNmNa?=
 =?utf-8?B?QmNOeG9MZ21XUUV0ekhyRUtWSnpHaGR4UjR1OGJ2VUlPZysvMVU0aHRhbjBO?=
 =?utf-8?B?S011SjFTamRHK2ZZRFN5cXh6NmpGMTJSbHdvdlBYVXZCeWpOaUhHQVZPOTRm?=
 =?utf-8?B?b2w1UjJuWXZacHRONG45UlRWYngzTWJnZHdKZ3hSc1JocVBrdFNxMzNMS1Uy?=
 =?utf-8?B?eWtVbkd6QnBmWk5yWEVQM0J5bVNuZ21LWWdXVlprVmNCMjc2aG9wZGR6ZWp5?=
 =?utf-8?B?bmRKSHZwZnEzMVFzUXBUZFdiMlZjL2xoOEFhRHFEZWlUck94cVFaRU9LaEIr?=
 =?utf-8?B?aytBa2RWNUVtbHltZy8vY2ZFVkhXMG9iYk5Va0t6NDV4NTJ4VDkzUUFBZ01X?=
 =?utf-8?B?R2VJTjR2b28xN3UyVnJnVXlxZFFtb01mMHovcHR5N3lZOWRVQzkvb05FV1E5?=
 =?utf-8?B?WXJ0OXBQcXFST2x6cmRGN25ZY3dBSVBqK29PcW1WYTdCdkkwV0U5TFdycVBy?=
 =?utf-8?B?WjNuMjlMeWFzMTg1N2VDMEZaazh1YncrU3lvOVZ6bldtMnFsYWxNcjRxNk5T?=
 =?utf-8?B?cjNoaXl6TU1uNlpzOFhQV3VJT3RDcWRKZkZnZ0FDWWdKTWVNK1lMS3VCSnpm?=
 =?utf-8?B?cHd5d29qTXpTWUdkcmwrVXR6VmJtbHlQdzRwQjNjMk9XNy9xYUp3dHJTL3VW?=
 =?utf-8?B?UHAwYW90Uk9aaHRrdmVBSENrY2EwTUMwbG44TVNncnI2dUdaUlY2Mk0yZ1Rw?=
 =?utf-8?Q?O3P2hMqaUcXigz6g=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fecd27-c0d8-458c-46ef-08da4abbd8aa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 08:33:08.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTbKX5BJ65j8M6l1oJv+pdfzuqBA67WOqnQ5ps934Jd5OVAQNRSV2ag7vUQAqyRTcHjLFmtNpjDsnK03Ii1R3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5767

The loop in iommu_{un,}map() can be arbitrary large, and as such it
needs to handle preemption.  Introduce a new parameter that allow
returning the number of pages that have been processed, and which
presence also signals whether the function should do preemption
checks.

Note that the cleanup done in iommu_map() can now be incomplete if
preemption has happened, and hence callers would need to take care of
unmapping the whole range (ie: ranges already mapped by previously
preempted calls).  So far none of the callers care about having those
ranges unmapped, so error handling in iommu_memory_setup() and
arch_iommu_hwdom_init() can be kept as-is.

Note that iommu_legacy_{un,}map() is left without preemption handling:
callers of those interfaces are not modified to pass bigger chunks,
and hence the functions won't be modified as are legacy and should be
replaced with iommu_{un,}map() instead if preemption is required.

Fixes: f3185c165d ('IOMMU/x86: perform PV Dom0 mappings in batches')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/dom0_build.c        | 15 ++++++++++++---
 xen/drivers/passthrough/iommu.c     | 26 +++++++++++++++++++-------
 xen/drivers/passthrough/x86/iommu.c | 13 +++++++++++--
 xen/include/xen/iommu.h             |  4 ++--
 4 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 04a4ea3c18..e5a42870ec 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -77,7 +77,8 @@ static __init void mark_pv_pt_pages_rdonly(struct domain *d,
          * iommu_memory_setup() ended up mapping them.
          */
         if ( need_iommu_pt_sync(d) &&
-             iommu_unmap(d, _dfn(mfn_x(page_to_mfn(page))), 1, flush_flags) )
+             iommu_unmap(d, _dfn(mfn_x(page_to_mfn(page))), 1, flush_flags,
+                         NULL) )
             BUG();
 
         /* Read-only mapping + PGC_allocated + page-table page. */
@@ -121,13 +122,21 @@ static void __init iommu_memory_setup(struct domain *d, const char *what,
                                       unsigned int *flush_flags)
 {
     int rc;
+    unsigned long done;
     mfn_t mfn = page_to_mfn(page);
 
     if ( !need_iommu_pt_sync(d) )
         return;
 
-    rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn, nr,
-                   IOMMUF_readable | IOMMUF_writable, flush_flags);
+    while ( (rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn, nr,
+                            IOMMUF_readable | IOMMUF_writable,
+                            flush_flags, &done)) == -ERESTART )
+    {
+        mfn_add(mfn, done);
+        nr -= done;
+        process_pending_softirqs();
+    }
+
     if ( rc )
     {
         printk(XENLOG_ERR "pre-mapping %s MFN [%lx,%lx) into IOMMU failed: %d\n",
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 75df3aa8dd..5c2a341112 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -310,11 +310,11 @@ static unsigned int mapping_order(const struct domain_iommu *hd,
 
 int iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
               unsigned long page_count, unsigned int flags,
-              unsigned int *flush_flags)
+              unsigned int *flush_flags, unsigned long *done)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
-    unsigned int order;
+    unsigned int order, j = 0;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
@@ -327,6 +327,12 @@ int iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
         dfn_t dfn = dfn_add(dfn0, i);
         mfn_t mfn = mfn_add(mfn0, i);
 
+        if ( done && !(++j & 0xfffff) && general_preempt_check() )
+        {
+            *done = i;
+            return -ERESTART;
+        }
+
         order = mapping_order(hd, dfn, mfn, page_count - i);
 
         rc = iommu_call(hd->platform_ops, map_page, d, dfn, mfn,
@@ -341,7 +347,7 @@ int iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
                    d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
 
         /* while statement to satisfy __must_check */
-        while ( iommu_unmap(d, dfn0, i, flush_flags) )
+        while ( iommu_unmap(d, dfn0, i, flush_flags, NULL) )
             break;
 
         if ( !is_hardware_domain(d) )
@@ -365,7 +371,7 @@ int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
                      unsigned long page_count, unsigned int flags)
 {
     unsigned int flush_flags = 0;
-    int rc = iommu_map(d, dfn, mfn, page_count, flags, &flush_flags);
+    int rc = iommu_map(d, dfn, mfn, page_count, flags, &flush_flags, NULL);
 
     if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
         rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
@@ -374,11 +380,11 @@ int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
 }
 
 int iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
-                unsigned int *flush_flags)
+                unsigned int *flush_flags, unsigned long *done)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
-    unsigned int order;
+    unsigned int order, j = 0;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
@@ -389,6 +395,12 @@ int iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
         dfn_t dfn = dfn_add(dfn0, i);
         int err;
 
+        if ( done && !(++j & 0xfffff) && general_preempt_check() )
+        {
+            *done = i;
+            return -ERESTART;
+        }
+
         order = mapping_order(hd, dfn, _mfn(0), page_count - i);
         err = iommu_call(hd->platform_ops, unmap_page, d, dfn,
                          order, flush_flags);
@@ -425,7 +437,7 @@ int iommu_unmap(struct domain *d, dfn_t dfn0, unsigned long page_count,
 int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned long page_count)
 {
     unsigned int flush_flags = 0;
-    int rc = iommu_unmap(d, dfn, page_count, &flush_flags);
+    int rc = iommu_unmap(d, dfn, page_count, &flush_flags, NULL);
 
     if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
         rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 11a4f244e4..546e6dbe2a 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -403,9 +403,18 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
         }
         else if ( pfn != start + count || perms != start_perms )
         {
+            unsigned long done;
+
         commit:
-            rc = iommu_map(d, _dfn(start), _mfn(start), count, start_perms,
-                           &flush_flags);
+            while ( (rc = iommu_map(d, _dfn(start), _mfn(start), count,
+                                    start_perms, &flush_flags,
+                                    &done)) == -ERESTART )
+            {
+                start += done;
+                count -= done;
+                process_pending_softirqs();
+            }
+
             if ( rc )
                 printk(XENLOG_WARNING
                        "%pd: IOMMU identity mapping of [%lx,%lx) failed: %d\n",
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 79529adf1f..e6643bcc1c 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -155,10 +155,10 @@ enum
 
 int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
                            unsigned long page_count, unsigned int flags,
-                           unsigned int *flush_flags);
+                           unsigned int *flush_flags, unsigned long *done);
 int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
                              unsigned long page_count,
-                             unsigned int *flush_flags);
+                             unsigned int *flush_flags, unsigned long *done);
 
 int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
                                   unsigned long page_count,
-- 
2.36.1


