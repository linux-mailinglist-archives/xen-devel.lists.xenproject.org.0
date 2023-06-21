Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C36737EFF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 11:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552586.862739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBuB9-0002YR-P6; Wed, 21 Jun 2023 09:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552586.862739; Wed, 21 Jun 2023 09:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBuB9-0002VV-M8; Wed, 21 Jun 2023 09:31:07 +0000
Received: by outflank-mailman (input) for mailman id 552586;
 Wed, 21 Jun 2023 09:31:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1i8T=CJ=citrix.com=prvs=529409482=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBuB8-0002VN-9e
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 09:31:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56312351-1016-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 11:31:03 +0200 (CEST)
Received: from mail-bn8nam04lp2048.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jun 2023 05:30:58 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY1PR03MB7309.namprd03.prod.outlook.com (2603:10b6:a03:52e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 09:30:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 09:30:55 +0000
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
X-Inumbo-ID: 56312351-1016-11ee-b236-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687339863;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qs09iu0eZPY+kFyTYl+b1uB0Xh6kqRIp4Uth3Ircq0w=;
  b=GcjbSjhgy1WsBCcH0/7C2sU715kaDSt4iC9eQPUh7m9KAjtHe/3d1E0f
   saQcGd0ObjAOJrZ28U0YA+4wwF0U9n/D16BoSfbc7Pzinkksy5gGvy+XZ
   i/0fuzEUskETlagRe81n2ANY7dqBPt+imN67LCZAfSTsDcoUTF88UAyNL
   U=;
X-IronPort-RemoteIP: 104.47.74.48
X-IronPort-MID: 112922269
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1va+r6Ou8HatxMPvrR2HlsFynXyQoLVcMsEvi/4bfWQNrUorgTcGx
 2BLXmyBb/eJNGP8KN91a4+3/U9V6sWGz9M3TAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5AVmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uRZWllW/
 vMAEjIuYy2Zv+657K+jUNA506zPLOGzVG8ekldJ6GmFSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vZxvzi7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWx3KhAthMRdVU8NZVmXyIxWhICyQpSFuXmfWQsBaEXt9Qf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBRw1V5dDm+N03lkiXEoYlF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:PhqWyKx2M6nzb+rqXPHXKrPwl71zdoMgy1knxilNoNJuE/Bw8P
 re+sjztCWE7wr5PUtLpTnuAsS9qB/nmaKdpLNhXotLsmHdyReVxcJZnPbfKwSJIVyAygcl79
 YfT0EdMr3N5ClB/KLHCVKDYq8dKbC8mcjCuQ6d9QYOcegNUc5dBmxCe2Om+yNNKjWuLKBJZa
 a0145opyeAZX9SVciyHH8DNtKz3eHjpdbJYQMmGxVi0wWFjSqp5LnmeiLopSs2YndgwaoC7W
 OAqADy5ryiv/anjjfQ2nTe9Y4+oqqQ9vJzQOKNl+kIIXHXhgGkaJ8JYcz7gAwI
X-Talos-CUID: =?us-ascii?q?9a23=3ACxqkCmuP2x9myLlpEVkIxxDb6IsnXCbl1HzfO3W?=
 =?us-ascii?q?6KmtUUoWZRnON4Lldxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AbB32mw3h6kYu/2AgXK7tqUwjfTUj3L2PE0MJypY?=
 =?us-ascii?q?/hNSEGRR8Eg3FtjG6Tdpy?=
X-IronPort-AV: E=Sophos;i="6.00,260,1681185600"; 
   d="scan'208";a="112922269"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlgVZTQCwAznmXsSsuUS8kY5Nimt78g4lBTO6HI2lMxrad7mDG7bkkrtnEBpgS1p2s8TEEDzlA6BSt0qGw0t2pHdfRH0ZIqh79f0wq3lK+aySs3YgKrlaQdKuqyHQmtTTHIydrY5fiUdDDHwfpO7kpTCAyKDHz7qFToNOn1mjM2fRV1P3dWSO2GkyplcKz91R1+0x2qSdudJXw+aCTphZTEb2FJKjFslDEYU0gjj1vQN1Eq5+Y4yxYmMLuZ5jNzp+aDI3I0R4ILkLvbUwBNWN7pb6Rd8KTmwo1YPjUI5PXI83ZbhHfZL9VqMuqZLyIW/AerLWcYWhDOEfmddnxv9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tM61P+aXKVH9l6UMGrKDJb2ovIju9mC8czrBkVlSHIA=;
 b=gjN6mBWMVnWGh5zKahLPVDs+v7PcATG1FNxMh7s50wbDbNoqIYzxF1Pfp4+8ldNGn9gt4D7D4TCaeXA3CMkWhLZZRazRY40ATSmfo8g11wi33i6mRDnGWh1bvjsR0EG5aw+5usI633xCIJuvlWGaH/LEGCt3MIZyK4NXK4HdaberxL0ahLmeRryEcjFLm0C9Baz1Hjd7uheqVMELUizyDSdSGgEVbUTm48BfHnGLWaT76Km5C672gC5iwINCOVZlK5X3wLGPwDdjKkJW9dt9AyGuTGSs08hCnABotY/i6vOt+Gnlmrjb3DX+sRCYNFvy3RzYay1Y0yGakwcOdjJPgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tM61P+aXKVH9l6UMGrKDJb2ovIju9mC8czrBkVlSHIA=;
 b=Pucfx1FGt77+GP6wwWwfhDY9Ft5iPxKp3jjIU3mgiNzo/z5Ru04RpPF+lqTJNGShbsJfyeFh5nj8MoweTLp99ko6MwfwHXMvArfPZnSd2ezoXWCyR0Hjmnax2uCUFilY9wVBL/tuW2h7v3yqk55VbX0VOH8Dmv1yJzvlzsWIc6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dce1c004-e021-8fc7-8069-62e44c313a5f@citrix.com>
Date: Wed, 21 Jun 2023 10:30:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/vpmu: Simplify is_pmc_quirk
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230620174556.3898824-1-andrew.cooper3@citrix.com>
 <8c76c3c3-f839-ef03-4011-e223ff6fc938@suse.com>
In-Reply-To: <8c76c3c3-f839-ef03-4011-e223ff6fc938@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY1PR03MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: e499d838-0282-49d7-a787-08db723a3683
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	osIki7T66aNQ442Ofu5PgZwaRQXM1t9JYJlH3ei62wTfYfehBp7dVQhNGu+jQM0Ebq9afhY8/aXZ2S7aCK3Q56EXRgMfrOVrVG4zC18hWirsxzA1Q2U8KxOwdvcBvx+HRpJWYEhardvh2C9n0BXoozmHcJQRSmNJgrxH+XFMgW5XZMgdNOxGVKHReklapqwDVjRwOAbXq9PXKkU1Y3z2YJkRcX6xLqd41CMRkb2XeQEq24BWKxYb3sgI3mcJr9aXKnmGkpShV9adQbqYjf1RGjgISEJwImh6/jlWwJuJQqj09P58pQV+XYD+zdp+BJbmYHzQdlmMGZw9rj4CHMeYXVbsyUKtoGH6AzR3xUrr6tinFtCXqqtlOPfmRq4uGV9jCAIfii8PF/DibmOAv2Eh4DA623ZHb9IpJ4s1LyJFqfLN46lyvjWL5AOTd7Q2367DmPu+Jn90bA8DF6BJA3Opwe5LgxaoMyqLj9UXmbixUTnesnoeGWkUWIJDEMZiTMARbwbmdRLe1hN9T94oF2S7VThQ4i/WJsi1HWww4fnODG5xwvaBbzs1Nf44WbASJvzX6CjpymfrCwNSEA+Fkj8XANcU/8Pn/BJduOnFEuAPH0PFS/vglOjQ6i6hYKEzajuqwmB0EW6MzaGUaEy0LysXUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199021)(2906002)(6512007)(6486002)(2616005)(6666004)(478600001)(54906003)(83380400001)(53546011)(6506007)(186003)(26005)(5660300002)(36756003)(66476007)(38100700002)(31696002)(4326008)(316002)(66946007)(82960400001)(8676002)(86362001)(8936002)(6916009)(41300700001)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjlNbWF0aXBsWkVRSXg3V0tpb1hueU1JMnhFaTliUE5yZjdhSWRYay9RVnM5?=
 =?utf-8?B?aEc4RVVuMkhZbWV5NTU3SlhkSE05VnBHVnFhVVNjTXlsb0JoMG8xckt0QU9k?=
 =?utf-8?B?Z1Z3M2poNVR0WXdrSHRDckJaQmhJMXM0azJrd0F1b3B6WEE4UWdPZDV3SzBU?=
 =?utf-8?B?TnhyQWtRTnNlZVpQa0dqRy9nTTRPZ1c4MS82VDNGVXFkSjFqY3VHTG9GRVli?=
 =?utf-8?B?dGNUWkhJQlFLdGVHVWh4TXJoQkNqMmZqajhQcW9xNUlkWTJFQXhMN05mMUx1?=
 =?utf-8?B?RDBrbmw5U29DZjBMZUxDdjlOU1NxbUlab080WGdMc0dtYTRDQ2NZQTNHcjk2?=
 =?utf-8?B?V3RJeWtLZkNpdE5qL2MwVzNENmJ1ZkljNWJHakJqblEzemExRmNjV0ErOG40?=
 =?utf-8?B?RHZpZDNaWUdqczhoMlBxZVVFa2N0dDNqd1hOUTl2R3dCa1IvUjVuM1VBMHR0?=
 =?utf-8?B?dXV0NjNaekZlbEpFSUw3RngwVHZCaHdqVE9GdXhlVjNpZngxcHYxVmYwdjBX?=
 =?utf-8?B?Rk5ZczZoK3NPaStnMVd0aDNkamMvbU1Wc2Nwek9jUzlkaE5kNG5QNDlMVW9P?=
 =?utf-8?B?VUFlTHlIM3RNVnNGVnp4ZVUxMFhGRk9zeERRZXNoam9aMk1tNVFPWDlqbktG?=
 =?utf-8?B?NmltcGdjdTV0aXdQbG5pRVVLM1lZalFDZytZb3h6YlJSVnVvQXRUMVB1MTcz?=
 =?utf-8?B?VGRuTDVMYzZpdVh3UTM4V1B1WE1lSlIwb2dVcVY3ME50UW1USE0vdEtjajFN?=
 =?utf-8?B?WHZXeFJ0TnFrcnQ3RGpBQXRoSGVSM25MNWFKVk5NZlc2dTRVclh0djFYZXFH?=
 =?utf-8?B?VUZMaUljWnNkUTJTSFFEckkxbVQ5T0pjd0hvcFJRajlJdlJWejBpVTIwR1pz?=
 =?utf-8?B?RHlORkMvZnpYZXhlQy9yNVM1NmxiU1ZWRVRvTWRucDJUMDZxOG1iaWJkM0p3?=
 =?utf-8?B?cUU2Z1NmOCs1dklSRTJraGxMMlRxblowbHZLOTQ3RGxEdW5jcitIczF5NlJC?=
 =?utf-8?B?cDNLTkQ4OHV4Q2Z2YTNUNXo3Uk9jdk11TWlwT2J5V253V2JzbmNkeDZucHp5?=
 =?utf-8?B?SUduZGlFcFUzdTNlUVB5WEN5WTZQdDR4b0k5R0dvRm5hNmh0dDJMS0dBQnpI?=
 =?utf-8?B?S0FRMVRnbEFPM20vLzhDUWdna1IyNUlHWk1YRVhLMEoxL1RLMXRCbWdUdGFG?=
 =?utf-8?B?MTRQR3owdmdwNGQrUTFnQ1U1SFZ1VlpzZGdUM0MrTnZSOW94bkVpNCt3c2Jh?=
 =?utf-8?B?bVVodmMrS3I1MVZnWGtORkp3NS9heERCNlpqb0ttU2taRnZPbWt6NVdUa1Zn?=
 =?utf-8?B?T0p0VzNzUFRLRldLNitLd1VBd3crbytncWNtZURzU2J4MWp3ellLS1Nwa3Vv?=
 =?utf-8?B?eUJRODlnV2NsTnB4d2dPVTlHd3JLSkY4VEY0b3VsZ0pySUFuMkMvOWU3dk9l?=
 =?utf-8?B?Q0RrbGFaQWc0eG1pLysrK1ByWE1HZGtuM1B1OGQ0aGFLWUhDOHV1ak94YmVC?=
 =?utf-8?B?NTBsUmp4YVIvclJPVVdQQmF2Y21TaURqQkU0WDY5SndNM3JDNWxWRVVkaFlD?=
 =?utf-8?B?RlhhTUloU01pUjVwOUJiVlEzbmZySzI2eXZIYnprWW5ReEZPbUV2Qjg5Tmdj?=
 =?utf-8?B?K3gzRmc0ZEdDMXdZaHFRNFZ1aHZGQWxtVHBBZTI3TTlMUFhGUE1kSjZ6UWIx?=
 =?utf-8?B?WlUydjF6ZVBIWVl0ZzBHOXNXS3NCYnBKQWVJcExVRTJDeEUzWkhNMzl5aUVB?=
 =?utf-8?B?d0R4TzZNcHI3aEVzY2FlQTBMV3hBQUNxZnZiMm9MaDlDQUFZT3ZFR1dtMmJq?=
 =?utf-8?B?QklManFjWDZrR1IzWU5qWnlld3pFRVhqeUNrYkJwY0ErNEdxMzNmMkxJejl2?=
 =?utf-8?B?VzRiQnBZRk5NZzdBcXZKdXRtTlhlSWR2ZjRmbXZWZHJsWXNlcEdhK21WaHpW?=
 =?utf-8?B?NnpYYWlvZGlUMnBKSG9JV1VRZ213dm83dmVJNHh6TGx2eUdhQi93NHo4NERO?=
 =?utf-8?B?SVEwTjdLaDJvRTh4NDM5RU5WdFpkVW5rdHI0bDBMczc3Y2JJcXNsRURyZXNt?=
 =?utf-8?B?ZFY1aHZkZTdJNXpLdmZSMDBDZkZtNFdRcml5aTlDRzU2VERUUVZFSUw0cUtX?=
 =?utf-8?B?Vi9tMEo5bFlTaEg2Vm0vYm1zNEFzbk5hZFpxbUczQkVIRTAvZ0RNSk8xa0Iw?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3TbqvFWXUlttWlNXZE4k1DTaPbeOHa4eQdjORm5TrySWVRZ+/ZQrki7KEQ11yoXrzuSid9cqZ5s0P1SGNw9/5LyiYDdP7V6RBnk0xnHezdTAHwp3q4D4rgdtFmO7qgk10Orb/JyE0giITqRk9BSUy6eq3Jops3u0UoeI+zEt9XEiubgPigpwEjKW6/TWys9FPuiLwYzVLAtMnsVz6XPTx8nm2qeNyIenW/P7QSYWOsXLZTh+1cF1Jg1OVjCy7g+6ITVixjUJSlvG8a71toqbzr7+giaHxJ9oD5faRZPlyUrks9l5CW+jxKYx5WE30MbuMQIT6P4AChwqTC7vkhyQMNbMS/YooAaSDHPDYNqZ0v27PkmKVU2Ecsz1n/0/3qFGAAtxxGbYXgH9EntNQL2VmqqnRvrDb2O8qMrGZcoQUL/jxuP4kd9bh4mb9eHGAo9srEVTgjUHI/ku1yZMjvGh6qjVQCI9mtUPFCflw4EhtgA7eW4TLApW7U7P+GQdOwlhDRnl4aeQi8cYE8G30OJDH6HfYAv/tCQcdnblusOrtkiSdvHYDErg10kNB4Bqa1ljKYhRp+x9XlCdvKNCoNRCoQDjyy8XdQJCMhjRmUBKMFutSclnK/vFx6LhK3mLy93LmJveQttbolEzDHf/zKntLseVPS3weFJGAT0zopvEZKrty6nfkV9C9X8T7j0hWuNLFJfYD/GK2Yn/j+tMiF6TpUq6sEs+mzrPz8UUPW+z9IyYtyRDNTk0fO0dSrAPRtAgpu21AZ7qXzTOFf/JuzVMaNvs1kRY3UbJr1tx3AG2vQBl1BXYewxQRfVqQ4OSa5nL
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e499d838-0282-49d7-a787-08db723a3683
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 09:30:55.4662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DN5JiLsHidCgfHZtkz+K4CTIu7ycQHlqvIB1D45rGzecZR3KmeQCy0hNK0Y8mXbxZZNX8R1G5ErL0w2UJyoKUrnf2CnZ2JGyG3ddDQXpg+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7309

On 21/06/2023 9:16 am, Jan Beulich wrote:
> On 20.06.2023 19:45, Andrew Cooper wrote:
>> This should be static, and there's no need for a separate (non-init, even)
>> function to perform a simple equality test.  Drop the is_ prefix which is
>> gramatically questionable, and make it __ro_after_init.
>>
>> Leave a TODO, because the behaviour is definitely wrong to be applied to ~all
>> modern Intel CPUs, and has been raised on xen-devel previously without
>> conclusion.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with one request:
>
>> @@ -967,7 +960,8 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
>>                sizeof(uint64_t) * fixed_pmc_cnt +
>>                sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt;
>>  
>> -    check_pmc_quirk();
>> +    /* TODO: This is surely wrong. */
>> +    pmc_quirk = current_cpu_data.x86 == 6;
> In the description you say "~all modern Intel CPUs", which suggests it might
> be correct for old enough ones. Would you mind weakening the comment to
> "This surely isn't universally correct" or some such?

I'm happy to tweak the wording as appropriate, but Kyle (who is a
regular contributor to perf in Linux) questioned that there was an issue.

There's insufficient information to figure out why it was introduced in
the first place, and IIRC he wasn't aware of any errata that manifested
in this way.

It's possible it's entirely bogus, or it may be a misunderstood errata. 
It needs looking into by someone with some copious free time.

~Andrew

