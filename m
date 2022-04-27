Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F5F511528
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314858.533123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfD4-0002Oe-U6; Wed, 27 Apr 2022 10:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314858.533123; Wed, 27 Apr 2022 10:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfD4-0002MV-Od; Wed, 27 Apr 2022 10:47:50 +0000
Received: by outflank-mailman (input) for mailman id 314858;
 Wed, 27 Apr 2022 10:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njfD2-0002LY-Ix
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:47:48 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 785cc2eb-c617-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 12:47:46 +0200 (CEST)
Received: from mail-mw2nam08lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 06:47:43 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB3403.namprd03.prod.outlook.com (2603:10b6:4:43::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 10:47:39 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 10:47:39 +0000
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
X-Inumbo-ID: 785cc2eb-c617-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651056466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zdmBQ2lSYlZPiHjFHT8xjLwtwTyxFKhXvcBkDbhK3Fw=;
  b=Ix8rGebHY7LPRtQf09+9OOmN3bDQIlm/4iwMQ6VA0kiUNRL40DCnXgNN
   R7ZabUNGOEi0ZG/zplimcWsfIL1jaB7PgpWJJxcWAmdrhdCGJixCj5wuK
   4YstAmjlO1hU4wQ6U5dtMY4DlpmFrBwULOzJ2APPczWM4eTXR72XF4nqN
   k=;
X-IronPort-RemoteIP: 104.47.73.168
X-IronPort-MID: 72483394
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:faaTva15ow74yeX14PbD5aRwkn2cJEfYwER7XKvMYLTBsI5bpzwFm
 zNNWDzUPv+OMWvyeIt/bt7nph5QsZHXndNjHFY9pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIy34Dia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1didvhZiA2BJHpws4PTD9eER4nY5N/reqvzXiX6aR/zmXgWl60n7BLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B8+YBfyUtbe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrialL20D8wPJzUYxy0L0xxJ+/YPUDMHqftiqQM5Yrn2Vp
 W2TqgwVBTlfbrRz0wGt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydG7gEOjX9NUK
 2QP5zEj66M18SSDUd3VTxC+5nmesXYht8F4FuQ77ESI1fDS6gPBVmwcFGcfOJohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnF4wL/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:MSOXUqhO6BaGSCLB3iemP5s3knBQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hqAV7CZnichILMFu1fBOTZslnd8kHFltK1kJ
 0QCpSWa+eAcmSS8/yKhzVQeuxIqLfnzEnrv5an854Ed3AXV0gK1XYdNu/0KDwUeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VfN1xJ/dfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="72483394"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bwa/TuB4iODCqcpCNT00EGZCFmvZu9cKpUpbnilU+gvq9UEb8tjD/ULq9SLZErsZj4kkwWb1i3wjjeb+UGR9UZDLbmW1KN0sTdZjDViAe/6oz6H3wu0c/2RVEexfPFXzv5BAXn+FMfRfy1Jf/ogHjLzoMFBs3yzp2aUdP86PnXjziJK3Sc54Mj3QJDvL5lPp9IENKYVHbOwbmFboqpekN3jX26UEQ6aylxtYIlcbPIhPoVLxlNUCrmoUlqUmqb5HM5XRcrSZhL9NKhOYkvudICWpdYraYzDFufV0NlVoCOQX7djtC3TDyk5/bJY1MmJCqsOXcb9B7PxpC2f88gboOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9awa4GHJOZs7bmYCimKBd6r5RU7QuG94g/4ySbfQYEk=;
 b=LWb4Nt1NoXDuxRp6ZM6jskzLfeklXvQWt2rzHrpZdHmbcP4kPT6UgHOBhDOHG5RPZfngq5xtuthYLjHuz4dMX26N2KzWOwHsCpPFocBwCSiE4IE5pK4Oq3nRJfiNAEa7TkZqHZjsbBwr4zImvHr/tdkYRhWM8PXB+CEOcxWq8IdGfVBLEnNDo22jmdwP1Zzspr2ZJ0qv8sN4/bjnFozcINOhD9a1tBcGtruh9ELx1TJSLNPk6Um/n1+qyeSYpgMhtFNGh5AhB644lk6VDoXDf+GdxYo6uO2000Gr/lRxW58fHSWbmaFGHMi+J5GHKmfTXOEgQo7ge0/sXlz7ixMeJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9awa4GHJOZs7bmYCimKBd6r5RU7QuG94g/4ySbfQYEk=;
 b=phHQhBv1fD0iB9Sz+emBSaW1sXPApp+vT9VqVyoeqPvaRUDe8gBfXck7BKzMSja/MjG2+Nuxz9LxbBzHDsHbpI3Doy6KrLMV35wTt5Eg+baQ+2CN6kcISlunIrgdV438VyPbVpaEnVXYrvy25j/f7o8yDX4M0hrOpBi9YIuW8yE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
Date: Wed, 27 Apr 2022 12:47:16 +0200
Message-Id: <20220427104718.81342-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427104718.81342-1-roger.pau@citrix.com>
References: <20220427104718.81342-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 192e296a-f008-49e7-2431-08da283b5960
X-MS-TrafficTypeDiagnostic: DM5PR03MB3403:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB3403F3953DDC3FB9A5369C288FFA9@DM5PR03MB3403.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZSpWIjMQ/bMEvwZtJPIUV9LWgQiqDe4Kro155ClmkOcTteTLldz1Rj92xEm4vREXqjDDMdTv6j3VjODOeb5nv4HI/RM0QbrZe4hbAUmFuSjrjFECS+gpJ/eqI9vznaS8K6WQ1surCcRUMgobM1GIoVcJ20oj9udBNYtYXhMECtDi+HvXEsOWj0XwhhE7JFMIc/XsfIB4zZUmkeH0QyiiJNa0NHPGfF8faOXoKwmBusAZLJPkszSQWC+56q+w9Y3YLwZ1Z/VB/lbwqrm0eYAQR92QZxtyISRnl7ecIBr+BdJm34xMSTCQAKpQwdRLYMp6YHIUMLxT7/uV1daKmP843buACyuTo8ed+xIOjX29TjL9iRfLtMouNMHScKBeZHYpoj3Xp+1XXC3REGspxVXj4EsXms5We6yUqPwgknbcR8t24J7yxQ5I92aj4j70zMlt963sXxi7U/mCnEptnZX0tSijO/LcmJ9a4FfmR+ZbuPR+e9Rj283SlYUd/of8tYJJH29/p7owTkuXGERdnJmv2kwXkGnOsXgh10G9MgOgy7fCGYuuAma/7uxyVkz2xL6cmdrmcqMaW02WjdHVFjWkZL07FoCLyVr8hQNUG8C3Ouse3nXu7OQ8zPMJXJldGpUP6sPvbvQj3EQ6x8KutERGo6KNPuy0TzZVJzcdYms0Eql0ZK6tAxaw5qQxBotd9+5l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6486002)(6666004)(8676002)(66476007)(66946007)(86362001)(4326008)(66556008)(6916009)(54906003)(38100700002)(36756003)(82960400001)(6506007)(1076003)(6512007)(316002)(83380400001)(2906002)(26005)(186003)(5660300002)(8936002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amE5OGZhblJiMTdKREZLemRRN1JFdERlODRubkhYUERqSjlFSWJmaEVxdmtx?=
 =?utf-8?B?S2NpZnZZNnNRbHlVS0UyTHdMSEhuZnpkUTlDKzNtTU1lZnp2czhNWkgwNUNQ?=
 =?utf-8?B?NW5FN3c5eEt4aUM5ZG5OSjUxYjdCazVSOUovT0FNWE9GQ214Q1l4dWVHVHRs?=
 =?utf-8?B?MktWdms2d0dldThadmpYSkJvTUxDL2N3SXhsUXVHTkg1MlN4OWtqOUJqNXVG?=
 =?utf-8?B?dXdabWVLUlBKUVNUck92QVFzbU9YajRmanN0ZEExazVtYjdFUTMrZ3l5d0xv?=
 =?utf-8?B?ZHZzMHBFQnpFQ3BhRzlTY1BLSXBrMWRrNWJOVkwxMFVxdnoxL2E5aGhJUm1D?=
 =?utf-8?B?V1VHVmJLQ2h1KzNVaEFxcDk1di9jaUZVMXVnQ2tFSFRCRGZYcllJTmVobVp5?=
 =?utf-8?B?TzhwYklBOG41SnFnWWw5RjJqNDloNFhzWG1Qb2J0ZXNXRVl3NHdDbGFOVUxx?=
 =?utf-8?B?Tkx3NG1Ib1NvSnhQbzRrQkxaelF2SExsSE15cFlUdDNPQWIzT1ljZnoycmUy?=
 =?utf-8?B?SjRoOVpIWVFtQmtDaFp3dkpBWHBjUmZyTWtnRDAzZytIUzVxck80TzRxUzBx?=
 =?utf-8?B?K2I3S2tHSlp1QnhGUG1oTndmVTQ4Q1cvL1NUYm1UV2RpNUdsWGJHc0tCMkVY?=
 =?utf-8?B?RE1ueGxxNmJpTlpXdWRSbkVDYStsRWZ5c1dWQ281S2dkTTFCSmp0empJWmha?=
 =?utf-8?B?OVRZaDN3bVRNSUt3d2tvVUJUdUxiVEVIa1k1ZmFDSDM4VEpSLzRrQ3FOdEx4?=
 =?utf-8?B?d1FqNGQ2Mkd0SXpSNitEWEI2WDdXZndUb2g5bkFHa0RtbFhWdFVDWHh6dG9n?=
 =?utf-8?B?OFZTUTdncE5JRGYrd2lGdkRNWnFId292VE5JWFBPRHRya0Q3TWxwMzFzeENv?=
 =?utf-8?B?ZWdtbDZ3SzdTZWx1SjN0amJtb3VKcHhqYjc0WEhFelFicUV5V1ZDOE5JRm52?=
 =?utf-8?B?RHhkbkhqMFVQTGNnbjVOc2UyVm9EUk5wN0RWU0p3R0doRGtUeDdCNUM4eTNs?=
 =?utf-8?B?dzRuY2VLWEZNWnBsQ2djK0hQM0swSllaMHV0Ulc3QzdEQ1pxOGdJR28vSFNT?=
 =?utf-8?B?cTVpZS9JYloxaFJQVVg1TlNTdytvWXJRUE03cDUwcHcrM28zOHgzN3VCTklz?=
 =?utf-8?B?My83LzdvSGJzQ09JWTl6c0xUL0ozZDZjRVYzQlZtNmt0VDF1S3BuREp3OWpu?=
 =?utf-8?B?eDRDKzlxZ210LzZVWDYvVm5pWXlnempYSHBTbUlUcEdmaHVvUElaMmswWEl0?=
 =?utf-8?B?V1kyV0RQQU1uVWNhUG4rQVRPeVhNTjJpNDgxYWJJbllXQnVDa1lpbjZ4RnZO?=
 =?utf-8?B?amJUOFpBay9uZGllVm1WbE5LSDh4djYrMVVvV2w2bEFhamplalF5TWNBcDR1?=
 =?utf-8?B?SzdiUHEwZHhzZCtod1ZPOU1WUm5SY3JBSm1TM0w0TVY4MUp0R2pVZ21QYlhQ?=
 =?utf-8?B?UWRsQ2RMQyt5RzMzeUhsM1pHMjYxSTRscXpIVVd6Z1I0UXpSZmErUXd1amxU?=
 =?utf-8?B?OFB2YVErQlJaZCtjdTRXcEZvMzEwc0p4ODdUcFBHN052WkRDTXNTUkptTk5S?=
 =?utf-8?B?QWJyTk1SVllkOWdrbVlReTdpcExTcDJGNXo5UWVqSWtIOGtrMC9pWG9scGFG?=
 =?utf-8?B?Z3cyUEEyeXhkZnY4a3JlaUV6U2dZdEhSOFZ5Nll6dVpWQ285RUJKb2Z4LytK?=
 =?utf-8?B?ckRUQ3JEbFI1eTNKTUNqc3hQU3BjbG5MdGxHc3ozT1lpZVN2cnY0TUlPa09q?=
 =?utf-8?B?OFlxd3Y2TXZqMW90ZEVQZGNYdW5GMnNvdERBSmFNNmVLRkVoYWJINlI3V3NT?=
 =?utf-8?B?V0g2TkRPTnBZZjRKallBRDFkY3U2OVV4QjdncW9nS2g1TFkrVW83OS8yUFdo?=
 =?utf-8?B?VDhwTkV0RTV3d3dYOTFMbk5oMFF2NkIrMXVYZitlSEM3L2dDYTRJSm96U2VE?=
 =?utf-8?B?N29zYzJudDUydmo5NnFrKzlLTHlla3F2TEpSUnd1eXM1V1lSd1lUYU56UllX?=
 =?utf-8?B?Z1ZyMjNPV1RiTWhZK0lnS0V2RFl3YzNKYmx0NlpEMHdNRUJ6T09SNmFMTGV5?=
 =?utf-8?B?UnBEUy9Vb0hhMit3UlltbnVUMFFHZndFMmtCeW9qNW9ENXhzQ1hTNVdrVlRS?=
 =?utf-8?B?M0FYZHd0QzBFU3ZsazlZRnRBVW9JMVA3bDBnVXNnc211N25Ubnc4WVN5dWdS?=
 =?utf-8?B?TDZLaGg1NHU5ME11OHJKTWNTUE1lTnFUdmlpeEpUb21KSldDenRSLzdMMzF4?=
 =?utf-8?B?SDdEU3RUVFFSQkZ5dFNMQzZvd1VsMnI2ZnhWMUZabWd1Z3N5dlRBcXNwUUVR?=
 =?utf-8?B?R1NncFJPQnVWUlY4emRHR3NSRVBINjI3c04xOElYQ1ZWaE5KVDNadnpKRk0z?=
 =?utf-8?Q?jzjTcf8BONchls8A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192e296a-f008-49e7-2431-08da283b5960
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 10:47:39.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3reVVk5mwrf2ZO43BL1KgjBCrk98wx1RlkHQHbBZm2N1mrljnrnbULsN05R4fQjvpvxDtY3UQBIECVFh8vGaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3403

Use the logic to set shadow SPEC_CTRL values in order to implement
support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
guests. This includes using the spec_ctrl vCPU MSR variable to store
the guest set value of VIRT_SPEC_CTRL.SSBD, which will be OR'ed with
any SPEC_CTRL values being set by the guest.

On hardware having SPEC_CTRL VIRT_SPEC_CTRL will not be offered by
default to guests. VIRT_SPEC_CTRL will only be part of the max CPUID
policy so it can be enabled for compatibility purposes.

Use '!' to annotate the feature in order to express that the presence
of the bit is not directly tied to its value in the host policy.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Use '!' to annotate the feature.

Changes since v2:
 - Reword reasoning for using '!s'.
 - Trim comment about only setting SSBD bit in spec_ctrl.raw.

Changes since v1:
 - Only expose VIRT_SSBD if AMD_SSBD is available on the host.
 - Revert change to msr-sc= command line option documentation.
 - Only set or clear the SSBD bit of spec_ctrl.
---
 xen/arch/x86/cpuid.c                        |  7 +++++++
 xen/arch/x86/hvm/hvm.c                      |  1 +
 xen/arch/x86/include/asm/msr.h              |  4 ++++
 xen/arch/x86/msr.c                          | 18 ++++++++++++++++++
 xen/arch/x86/spec_ctrl.c                    |  3 ++-
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 6 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 7e0b395698..979dcf8164 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -550,6 +550,13 @@ static void __init calculate_hvm_max_policy(void)
         __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
         __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
     }
+    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
+        /*
+         * If SPEC_CTRL.SSBD is available VIRT_SPEC_CTRL.SSBD can be exposed
+         * and implemented using the former. Expose in the max policy only as
+         * the preference is for guests to use SPEC_CTRL.SSBD if available.
+         */
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
      * With VT-x, some features are only supported by Xen if dedicated
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5b16fb4cd8..db8f95ef7c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1334,6 +1334,7 @@ static const uint32_t msrs_to_send[] = {
     MSR_INTEL_MISC_FEATURES_ENABLES,
     MSR_IA32_BNDCFGS,
     MSR_IA32_XSS,
+    MSR_VIRT_SPEC_CTRL,
     MSR_AMD64_DR0_ADDRESS_MASK,
     MSR_AMD64_DR1_ADDRESS_MASK,
     MSR_AMD64_DR2_ADDRESS_MASK,
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index ce4fe51afe..ab6fbb5051 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -291,6 +291,7 @@ struct vcpu_msrs
 {
     /*
      * 0x00000048 - MSR_SPEC_CTRL
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if X86_FEATURE_AMD_SSBD)
      *
      * For PV guests, this holds the guest kernel value.  It is accessed on
      * every entry/exit path.
@@ -306,6 +307,9 @@ struct vcpu_msrs
      * We must clear/restore Xen's value before/after VMRUN to avoid unduly
      * influencing the guest.  In order to support "behind the guest's back"
      * protections, we load this value (commonly 0) before VMRUN.
+     *
+     * Once of such "behind the guest's back" usages is setting SPEC_CTRL.SSBD
+     * if the guest sets VIRT_SPEC_CTRL.SSBD.
      */
     struct {
         uint32_t raw;
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 01a15857b7..72c175fd8b 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -381,6 +381,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
                ? K8_HWCR_TSC_FREQ_SEL : 0;
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        if ( !cp->extd.virt_ssbd )
+            goto gp_fault;
+
+        *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        break;
+
     case MSR_AMD64_DE_CFG:
         if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
@@ -666,6 +673,17 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             wrmsr_tsc_aux(val);
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        if ( !cp->extd.virt_ssbd )
+            goto gp_fault;
+
+        /* Only supports SSBD bit, the rest are ignored. */
+        if ( val & SPEC_CTRL_SSBD )
+            msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+        else
+            msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+        break;
+
     case MSR_AMD64_DE_CFG:
         /*
          * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 1408e4c7ab..f338bfe292 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -402,12 +402,13 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
      * mitigation support for guests.
      */
 #ifdef CONFIG_HVM
-    printk("  Support for HVM VMs:%s%s%s%s%s\n",
+    printk("  Support for HVM VMs:%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
             opt_eager_fpu)                           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
+           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 9cee4b439e..5aa3c82fc6 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -265,7 +265,7 @@ XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection
 XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
 XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
-XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
+XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!  MSR_VIRT_SPEC_CTRL.SSBD */
 XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
 XEN_CPUFEATURE(PSFD,          8*32+28) /*S  MSR_SPEC_CTRL.PSFD */
 
-- 
2.35.1


