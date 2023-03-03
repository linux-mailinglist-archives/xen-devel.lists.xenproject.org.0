Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F56A9AA2
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 16:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506086.779102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY7KZ-00024A-On; Fri, 03 Mar 2023 15:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506086.779102; Fri, 03 Mar 2023 15:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY7KZ-00021B-L0; Fri, 03 Mar 2023 15:28:23 +0000
Received: by outflank-mailman (input) for mailman id 506086;
 Fri, 03 Mar 2023 15:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP4M=63=citrix.com=prvs=419214df4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pY7KY-000215-Jv
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 15:28:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05fc6a7c-b9d8-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 16:28:20 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 10:28:05 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6606.namprd03.prod.outlook.com (2603:10b6:510:b4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 15:28:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 15:28:02 +0000
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
X-Inumbo-ID: 05fc6a7c-b9d8-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677857300;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P8MJjgEjF4acIyDSKOUuOeExBUIKlMf26s84ww942lc=;
  b=dWjtBhFTg7AR55GDyJGcRT8wshwH+mvrXWVwJlyM02jPAH5GDDdRm9Uy
   0zAAw4W74LaYQfPrL9cOlwFloKw4OVgcFSVRpOPn4HNclkCMsJ/sut39U
   9GPOpq1bSAdp/lVVrRvHioW89//79fQ9h1cv/vTLUu0eeAmwjxbNv/rfe
   Q=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 98731819
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TAFAsq7KS66SnYqwNZywrQxRtCbGchMFZxGqfqrLsTDasY5as4F+v
 mMfUWyBOqmJNmT8fdhwPt/i9UNSupLXn4RkQVBpqX8wHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasT5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 f8/cDQScB+6iuO8memjWuxlpZ0qI5y+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojumF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNCS+bhpqc76LGV7lA2Nxo0VHSfmNeSjBejWPVfM
 l4r2yV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBqgGqy8qDqzPW0fKz8EbCpdFA8duYC98cc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:SZQqeaCLIWOuRf3lHemo55DYdb4zR+YMi2TDgXoBLSC9E/b5qy
 nApp8mPHPP4gr5O0tApTnjAsa9qCjnhPtICOAqVN+ftW/d1VdAR7sN0WKN+VHd84KVzJ876U
 /NGZIOa+EZrDJB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.98,231,1673931600"; 
   d="scan'208";a="98731819"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2mfUUNxSHdfbBvWuli7YjohpFCcfDHr1DBqSRMtlUuG2yqUaiLUBWnqgGDZRQKZGAhuYA9GNmQCr+ciybif1nqpFHPejB0bDj6XteeK9uR/szlH913n0m0gaJWFt3XG4UyKBJ7tm11TicTdpaDcKDCdJEvnvgJDPJtrqQt4+KNtDnECrKBm+4N9eMXgEWpqNIi6XXWFhYwGTWm+8Rf6NcKbz8+AZkpB2zXf4VV1OlkvJW5gOiFNk3mexCpbd0LZYAwi1dTAU2x4/A032S1XsD5/gScSownSfSamyaiONyINRSPoSTd1gP6j+u0hA4sTBeXeMXdMNZqrPBZD8SOlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wi9FK1PD7eCidk9Ig71Sj5Wn3Jb8t3uNB0UsTz9k8sI=;
 b=mDyvI8h52BvESSVW+y4p/kUUd66Qv29dS26DOFX2nTIlaSs8eBPiD2+99rofdvpf13om8feoIqXtsLSqP2uABGDa5psbr1xspt7C0TIY61zrMpjJ6JdbX88mntCtJUJFrT/cdu0Yxx5dFRJqOLc+78Tkb222upi/cUGMohkt6VwELx9faTo3MIEEFxCQ07OcC1SNF2Gr5gHiorGnDJ0yu694o7PEre3JZ4cUyRHL1RHQAFJYeaa8nyNePRrIJ8UUtKSHJmd6mBHgoBaLq1anfuesmpbSnSh+iNw+ehN7YX9wCmcByC2/snm0axGN57xsjOUDXubqa+KhfMnmRVADSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi9FK1PD7eCidk9Ig71Sj5Wn3Jb8t3uNB0UsTz9k8sI=;
 b=cVC+rofIS+t7ijifPa9tt+7GVvm7193S682teZ8ZHD+cAjiNuWU2WLTXiB8Gq0+EKyY11EMd/UMLuYYVyO82BJeifWopSjkdF5/Tz6nXAYexIoUMO4342gvCZjpgHGbLDSP0QjLoESL+3T9PtiNbO03obGLZhJ+s4L05uIA3WQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b8670d3a-704b-110a-8400-fabb0b1d1879@citrix.com>
Date: Fri, 3 Mar 2023 15:27:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH backport for-4.15] tools: Drop gettext as a build
 dependency
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20230303145535.23412-1-anthony.perard@citrix.com>
In-Reply-To: <20230303145535.23412-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: e5fd31c8-3e77-4773-865a-08db1bfbe085
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XbmKLvFbAeeA44q4vOH3XTj/Nm/JZ9bCR4/biCl2k+bMrOt31dbutMc1YRPQaGy3ao/QCAGpu3vprwEp0U9DHBhws5OpcKVIpXZaqr7IGJRMSi1IQ2MGQfDfSPEAvwbJaAtOX1AbAj0rL803KLFWvk/1JaMFQQIWaIEppQgzprmlDzhQkuNQFwo/Z3kQWEiFk+e0Hhmy8eQeNmQQNdi93PvJQAipyklAc6+RHvcVxQKHgf3A2qrIDFbkaHqzYOE5D5hw51+KoqLmiJgYh6EXS26ktDVankN06zPFvvCQ0wlvt4cJCfsd8pF+8XgQP1PHyWvVe7JL8pPs4VZxUtAN8TzENLcFbyAgqc4VmhUL4om9aKklhX3mzIOLGsJuy1C2wlJA7+T3tOSqo6Fms37LJwnKg6xft5iQxEQX0mR/JXtsjozB/1Qm3RroRRNl3KXeWHof3qERfmU6hpde3LoJgWXDcvRj0GCFu3fac8Z+YnrPss49lXDSCnRjdTEJaXiJT8WmCLLH6m5uBr+YDZfvEAnL7j8nGmUFxHDnA/Z8i+bOZAf52v7qjBczQ4UHscDdvBEX8rdhwg3gHscY6qQ8SveV2nbv+ujtJiPGQ/IqerFJC1A4zK5FWqrBL9AurRfA8bN3l+LD6yy12n8vkHHrYn9CFOC3V+Y93wIAaneDqKX9e25Rm31foKXl/GNU8dY+H2pD9Ld84/PqB1nmZ5lqp786NX3Qnwu3JrLyYOI7TB2AkodKTq6S8I0MnIk8l/kEOKO6qpWIqGPdpBZREqmX1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199018)(66476007)(186003)(38100700002)(82960400001)(316002)(8936002)(4326008)(66946007)(41300700001)(8676002)(2906002)(5660300002)(478600001)(2616005)(53546011)(6666004)(66556008)(6512007)(6506007)(26005)(966005)(6486002)(36756003)(83380400001)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU43UzZBU1g1Yk1EREpKYll1djJjZ1lZWmtnQU1QOHlNZlFCQXFoZjVjWS9v?=
 =?utf-8?B?SlEvMDAwRVhudHN3VVpiTzAwcWtaV0t1Q1BZTktYTWJwV0RBVStmQUtUenQr?=
 =?utf-8?B?RExxdHgrRlBCalNOZm9lNmtTWnNLMWpnSGwzbWU4Qjk2dHNLcXhJZE5vUFpX?=
 =?utf-8?B?YnhKSDEvOFBFdnBDaEQvZnJxSGFpRXJPaC9DZHE4MC9WSFBVeklOY1BQeGxV?=
 =?utf-8?B?aW41MTdTWU5yL1lRUkV5eXVjUkg3OHRvenk3ZGVTZ3phOCtiRUdVTlZRUXVi?=
 =?utf-8?B?a2pOM01Fc3NGd1ZHcWdYTWt5NllVbXRQaEhUNEVacDZvVnFpUjFoaU9VMzRV?=
 =?utf-8?B?SnhYZThuV2RHZXp5NER5WXdPM2poZitzQXhuemVWZWZtRUFHWlA2RVNBYSth?=
 =?utf-8?B?R1VLMWRkQ0hJTTY0T0V5NVpFWkJKaDIxeUxrZkFQcTlaVTV4cXA0eEJIM2o4?=
 =?utf-8?B?bkt3bGlDWjVXdlh5NUlTaWdEWXNpbWgvaGE1RVFUZXprVTRHck5oNmtXVC9n?=
 =?utf-8?B?NnNLaFphU3VVb29LTnB4M0ZBZGFwTUUxZVY4amVpNW9uSTBCSjJlaWswQWNC?=
 =?utf-8?B?eDlQTzR0SDJXbGJaMUJ3VTd2cFl4M21WcTRGYWlBQ3o5SDdEeEwzcTZ1L0l1?=
 =?utf-8?B?Slk3VmR6UDJ4Q0swTzdsaXdHRVVHLzMwSWJ3d0taRDFmZk5aZTBUaWNzU3ZM?=
 =?utf-8?B?aWlNc21WdkV5ZzZJYmtEL28vQ0RFOWhiRUc5VkpnTXlEVGNzYVFGL1BZSEhC?=
 =?utf-8?B?SEZJLzM0ZWtPdWVldjJhbUt4OGVTN0NzWjFDRzY3TVNTMUtsVWRuaXBFN0ZO?=
 =?utf-8?B?ekFOeW9EcGZ3eXlLQmNSbUh5clNtTTVpWHhJZWxicmc3TUtaejRRa2E1dWJz?=
 =?utf-8?B?WGRpdmcwUkhLRGRHZEJ3TmlicVhITjJFZ0RIcVhSS1ExVXhERXFkeTJSaWU3?=
 =?utf-8?B?ZzFuK04wc3k3b0MyNTRFMHpKR2xYNmp2bVRIaXZVUDFjWW1BelVSRkdURGNE?=
 =?utf-8?B?UXF2cjNDam91Vzh0WjluZVp2alBlc1VhUk5vVlFuRUVLRzA4NEdFeXkxdzh3?=
 =?utf-8?B?V01WZ1RaOHFlZFE1N2xwdGNaak5vdUtuZWlFR1Y0bDFNcE5TaGcwN2EyZXhD?=
 =?utf-8?B?WnlUN3ZVbnVLOW04Y1FHeDg5d1VTdkhMa2JqTjRaUGw0YkNSM1hlSWtFamIv?=
 =?utf-8?B?YXJMVzVySEZneFBVdzJKT3NjQ1RjTHhCeXZXNVcrTVJBWTZrSWJQVEtsVXhl?=
 =?utf-8?B?dWl0aU8rc2U4VzRoTkk4cWcxcUkyMHY1MUFBb1hhRmducTBBaUxHSW5Cc1p3?=
 =?utf-8?B?UHFBa0JEaFUwNlVjNlZqYjc3Ujk0UFN6clNYc2tIU3psOHdTUmRQSXk5RWl2?=
 =?utf-8?B?Q2hRNG9WU3lEQzFaUlRyUHd3WXAyTHR6R2pRMnplcHJYcHpmZSs1VHo0VEU0?=
 =?utf-8?B?REhDOG9OdUZWMHYvRU1tQ3BvQTdYT2JSL0FNSXlMcUJSUlpwZzVCSGdjSmhK?=
 =?utf-8?B?dER1dzdHS3VSZW5SYmJVSjByYkMyR0p0WCtBdTFQbW9zM3d2ZUlDVmNtSVFS?=
 =?utf-8?B?SVZIOFpWZGFNdmJqUEV0dHZWbE1TM2pERWh4T3FCTWJ2VHl2STRKM28rUTZY?=
 =?utf-8?B?VTY5UktWbGlRQnZOcjVERTJBNnZaRHhlMm53MDcxY3pWb2pUVGxoSmVhZzB2?=
 =?utf-8?B?bDBEc0JyL2RsQkZ6UHJudmJiVzBwV1Z2dGZIWngxa1ZFUXlxSmtnL094NGxW?=
 =?utf-8?B?VmhOSi9ScFpudkZuZTNRUFp6dXVpNHQxV3VPeWVzZFJrMWZGOFVsMXNwOE5z?=
 =?utf-8?B?L3I1RHFCdExaWHE4Um83Wlc5ek5nRjhtRTZKWTFOdDBZZ28reDlQYUpkR1VV?=
 =?utf-8?B?VDZKZlhzaXZyakpFRmhpTzdoeEVMWTFQTEk0WEhtc1dPdU9xcm5oZUw5NjNM?=
 =?utf-8?B?MkpOZE9sZ2NTKy9Qd2JuOTZhVkE1d0xrb3dNSi9idWpKT3ZXK0Y4d1pMOHYr?=
 =?utf-8?B?NHcwUHhCUjB3clhMY3M1UFdub0lGakVrbVVicUh2cVR2azRtQ0RkdHFDWmJv?=
 =?utf-8?B?RDFSZDFHaHRRT3JpR3NsdDBjYW4zWU5YSmdxay9qenN2cGZodEpob0Q5R3Mw?=
 =?utf-8?B?N3o1b3NKSXhERkZEQTROMElBczd0MEJJQjMvN1VvQkJ3Rm9ERWhuMHAxTnVM?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tGX2oZHGdGiBUy82f+1+EaA9H27n+eoOaaMT3rmYpr9kQVZtH/eXeAW16pF5y/VrM5wAOxaDw7Ahu9aFn+5C+IlQOmCcl50GNUuU+KcOKaqKF71/oeZhoHfvaagmMxQ5AwbIFJKVGZtsu/6abFzQfPEe/c1dbdYBFdurj1IWefXCN1IjBu3AElkJIjfNgjKu109IJ5UA94YibRArt+m6DIsXtjyM+oRv8fQfj4EVQN0YvQVU1CQ3EBMxZKY8oBb9pMC14I4Y+qy3qL37UK0LXIHFvEOeUjzDmfUnX9AxqjMmwz/KeBbsnAbH6ip24/U6cCWoscop0xzqqJhC4xdme7/qBtMyvI42zwd+B9+fx43RnWewR7QuguGqRnvCE749PfDMB4DKC+ZRHA6AIvmG7m3Xh1uCuq6SPEXxHimuvtzbitihQRoB5P85NJ23BPwfcHExOhxHR5GRYCsPSMaOcHw1DEvECJguIR3ecyX7srqRLfu84VeupdVuxLRh7HTiUhg9e2KuCXkF1JNesaba3xOAUeYOpvZBJ6hRyAPTUnLUe3f5Cspe4ibbQeCPdJ4pTKO/9TreOp6Kksi9aRqXvfLl6OwZ/AFhwxyAYvTngwBuGlQNS7NqlfFiEGwh60RMcRZRftvSWWLEyXhT6cczZNDDIHvS9hXphomM8x9PrQ8kI34N45rhi8VequCkg7x8u/j69EvteW5oaB3XF/hvW1G/60ZyoPnjv0rFhsXCUjeM4003mnS3hJeO/cfty6N9xfuiKd32fttVBRjS0Q+d52F6Evx/9qfhhmoESavjLQ0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fd31c8-3e77-4773-865a-08db1bfbe085
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 15:28:02.4238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8As7RPq+98MDIuam7Eh2oVTE0YYl5VFjc66940rAPsyyqTfZX3TpkLymMoZcr5RV/iCDw0VrSc4j/8rd5HLGSGuhttNjSDf454PsR7U6Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6606

On 03/03/2023 2:55 pm, Anthony PERARD wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
>
> It has not been a dependency since at least 4.13.  Remove its mandatory check
> from ./configure.
>
> Annotate the dependency in the CI dockerfiles, and drop them from CirrusCI and
> TravisCI.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> (cherry picked from commit e21a6a4f966a7e91cb0bb014dbe15d15cc0502ad)
> ---
>
> Notes:
>     As we dropped "gettext" from many containers, build on staging-4.15
>     starts to fail due to unmet dependency. But that dependency isn't needed,
>     but configure hasn't been updated.
>     
>     pipeline with many fail due to missing gettext:
>         https://gitlab.com/xen-project/xen/-/pipelines/793302203
>     
>     pipeline with that patch backported:
>         https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/794335026
>     still several build failure, but less, and not due to configure step failing.
>     
>     Commit can be cherry-picked cleanly to staging-4.15.
>     
>     That commit would be needed as well on staging-4.14, but it doesn't
>     apply cleanly due to change in configure, and missing dockerfiles.

Urgh - I'm sorry about this.  I'd completely forgotten about this mess.

We do need to get CI working reliably, even on all old branches, so we
do need to backport this too.

But looking at the diffstat below, I think we also want to backport
other things too (the change removing Travis), and I'm not sure we want
to re-add the dockerfile comment seeing as we've already dropped it and
rebuilt them all, and this patch is the one that stops it being mandatory.

That would simplify this patch a lot, and make it applicable to 4.14
too, I think.

Jan - are you happy for Anthony and I to just go free reign on the older
branches until we've got testing into a working state?

~Andrew

