Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 657CF6D43CD
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 13:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517400.802655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjIev-0004Eh-UG; Mon, 03 Apr 2023 11:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517400.802655; Mon, 03 Apr 2023 11:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjIev-0004Cq-RV; Mon, 03 Apr 2023 11:47:37 +0000
Received: by outflank-mailman (input) for mailman id 517400;
 Mon, 03 Apr 2023 11:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W/KQ=72=citrix.com=prvs=450b71a79=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjIeu-0004Ck-JJ
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 11:47:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51eaa262-d215-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 13:47:34 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Apr 2023 07:47:31 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BLAPR03MB5587.namprd03.prod.outlook.com (2603:10b6:208:286::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Mon, 3 Apr
 2023 11:47:26 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Mon, 3 Apr 2023
 11:47:26 +0000
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
X-Inumbo-ID: 51eaa262-d215-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680522454;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jbn2uUVXb8yvO1/Rrdgb6/z7tAWkyGsVebJ70PfjtWA=;
  b=LbZAAEIwKDWIzIAbawhY+/5Q7lzk0f2t7H6Yh+bu9FRj31sg8ybhZ30f
   0CSotnS5HPnZJH2oTrPiNDhK7dD5yogyAoTw8DoGm+bY2WIzdoxJsZO90
   tBXH6wYAhC2MhsYeUIN/K8l1UbHkvYO9Z5I4SGSfjuNtscO6/ULRH2gL+
   Q=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 104026075
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hV6T8qhaHmr857Mrpjx9ZPY2X161RhEKZh0ujC45NGQN5FlHY01je
 htvUT3XaayCNmD8LY0kPIiy9BkE7MfUy4RkTQI5pCtkHiwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT4AeFzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQoLXcDcjvbtdiN0ZzqRMZ8nNoMAZn0adZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGzYbI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjBNpISuXnq5aGhnWol0hQNxwvZGKliqOYi3SQRtdUL
 mEtr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOluU7WDgr3
 V+hhM7yCHpkt7j9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A79y9pog210vLVow6Tv/zicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:qixBYqxIaI8E33WQOZ3kKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; 
   d="scan'208";a="104026075"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cv+SdaD0efSUllFyIm1fqrH2hJkDwPLoWdURfEf2rUwSlRl1jAYRBD+NoZd72egVwk9oG2loiUgyt8v0f5QQGFXob8CwcHcMqIciTEASE+eFr3TIWAbigVRIJjFcinL6WDhNCtvt7CHjUR1Kb/FOPPUmwMJvzdM6lC0TWTExOtqq9yXAuZ8A8DVJnO4ES/kczs7qEiiepREJczJOOE43Ag5Tm0XUufoqFPDCFfu1KsPmhdr1Rkch1TCSxgnX3L8VTB9Y27+MSP3wNJchg2wGXBUnQQrADYztkDzvtjNGyk3TvVBxmroJRyvCsDSIaotopoLtT2POxCz057ajBcUfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUTWRX+psj99xXOjpkf0l7H7LRbJFTWqro20JXGXwh0=;
 b=RxBA+KjG10ql6TbFMFA543YsOjZ0ETl2czMIf0S32O4TknCOZzwIvuLUXEwYvUBlVpJ1oPKafwMQgZTSiw3uuDraV+Kctpnt++svQY1gDlV+xB4onPiQ+2/W26WJtLC1FqptSBh9cQx8TC4W3n5UKZWJiHndyypLmzkfVsKvZEiNbGPKq5GH7R53uwdNY/Emtar9zVry6UzVIt8V6+TNsJANhjRdNpm/g07rwAeD4SqFGLTSuccz4NjtAPsVr7UF/jyNLQPB873hsDXXhaTb9THQGtU0+wL0orZ4UzCRi5ZyGoQ1xY/r2+1+53DpU/B1+JFwVv54yfCXqJi2TtKoCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUTWRX+psj99xXOjpkf0l7H7LRbJFTWqro20JXGXwh0=;
 b=gfnsaE1fxGZdlDQDE4EUrlGr71Tp2+QcOaKoSv3ElfVgC9fTE/juca3RcvXkfxF4OryEVkSc7VSDqxjji0qhK4mJHBLUhDbyvpGGEMp7WJGVDWSjldVJCyD38GM8plGz3XNj0Scq0TSV9kCzm+dZqO/NfCLzrdlFqe7V0O5ipbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 3 Apr 2023 13:47:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RFC 0/9] x86: Merge cpuid and msr policy
Message-ID: <ZCq8yDv/FaOvtTPo@Air-de-Roger>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <ZCVtcR5u/14/WmCU@Air-de-Roger>
 <9108a58f-da8f-14e4-de88-a7c8c8abb0f7@citrix.com>
 <ZCWgHxCL4yXD6CxC@Air-de-Roger>
 <14d8128d-6f50-99e5-ec98-366318e7be1b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14d8128d-6f50-99e5-ec98-366318e7be1b@citrix.com>
X-ClientProxiedBy: LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BLAPR03MB5587:EE_
X-MS-Office365-Filtering-Correlation-Id: 82571b92-0ff0-4bcd-f62f-08db343931dc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5EbbQb06vQw00GUu2B1CHxsmpSmHH9kpO4nxjb+9obaYlVoBna14vTDbM0bI0vl60XZlME+SKjqygRqIHu4stscaIRZ8WHO0mrzWjx0ebKnD5nJspF2om26CG47pt7RqqmtXo/hbB3GnB+WPW1BO295XvA7xDNaMq+R/t9Mcsr5yEz2tTzgAV31Z8G27qd0YUcZAYJc2spo9g+b4PsKfwBLjtCFq+jlG5wFzXRMCdxR70Z7DWSEgb8NYFMmY3JjrraL+ouEEIdKdavwczNl0IVPfajqCW0UUlbUF6L4UjnEh+Nm6eOe1gOc2D+uMSAPcJBoR2Psf0zXHC7mK9Zf+J+uhxj4/4pOabYUHonXo9OqYHoAWR50KiHWYPMRQu+P2i5lf77PBXMnzr/rqUQGN/Und49hMHrfiiewFJaAJu8rw3As+rdAKTMI6KOgRcy2T57fC8dGGk8wtCuAg0OfqpJC8jX9IoxVG5H4CqfQjQhYora3Q3+eqgfzGOl8LzPiXHnihc5p86fogJ8jqN+Ds3bylFGagJTXEEX0TnaiRrWXJax57CaaK2c2UkI50LO+N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(66946007)(66476007)(41300700001)(66556008)(82960400001)(4326008)(316002)(6636002)(54906003)(186003)(6666004)(26005)(6486002)(6512007)(53546011)(9686003)(6506007)(86362001)(478600001)(33716001)(85182001)(2906002)(8676002)(6862004)(8936002)(38100700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFRMSXRHL2xLYWQ5dUFWYTN1OGtyWGdTVDBxYmZCUTA2OVFOSFlsZUY5dDRx?=
 =?utf-8?B?cHd1c3AwMXlwck9YS3hET01qS3YwTU9DMGRwMml1UW05YklGdDdyVWZZbVV6?=
 =?utf-8?B?c2xHa0NQbkZLRFl0Tk9TUExkaEYrZEZRRjA2ZGtKVXlFVnJEYlk1V0NWbVpS?=
 =?utf-8?B?MFVjcjBlV1BaZHppei9PNUZXWjdocjE4YnBFTmVPRmlrclV0SEFQWTRiRFRq?=
 =?utf-8?B?SGNiR0ZUNUZMUVdYdzJkTGpibmJtSC83Yk9UMi9TcVhFUndpbWhNUlNCd0hQ?=
 =?utf-8?B?ejhVZnJnTEdJOTl6Rk1xRjNFVUU0akliL1RkR3ZIMFg3R0tkVGVaaWtFMUpL?=
 =?utf-8?B?eVlYeUJJM2FHNDNzcFJ3cDRVQXp6blV1Wk4vTEd6czR3NCtHWWFIVzNhelEx?=
 =?utf-8?B?UGlaU1AyK3VwQk55V01ZME5GQU1JL1JqNHkyVXRHU0U0K242LzBkbW1IVHRN?=
 =?utf-8?B?Mk50M2dtNE5tU1ppajY4c3llUU14RVZZUFlpTEhWd2R3c0FubGVOWi84d2hL?=
 =?utf-8?B?ck4vNGtFbkJDZlc4VWZMUlN3b2JMZ01pS1JkQkdxOXRVOUhxbDhQQWFNam04?=
 =?utf-8?B?T0h2cUdyRjdJTjhSRnd2WlQ2RTdjYWpKN1pmRDloVzdiN2c3c2w0bzFRcDd2?=
 =?utf-8?B?SG8xd2xNeVMwTGo1elNVOHlMaVZHQUZwUmVLYVU3TVNaOFpzT3ZPbHZnMGZD?=
 =?utf-8?B?R3FaR1dwa3J0dnBqbE9uNDVLY2tRTk9FSGlpNEpCUjVSazZTTVViTXVWM1h6?=
 =?utf-8?B?UjJtR1lWWEVqL0s1VW1wOFpaMmpob0hPVGhEZTBTanoxMEJVMlBFTUxTU2FN?=
 =?utf-8?B?V0xTK1FpME9tOG92TGlmQ3BvMmdHOWlwcUZKSjBiQXJGQURic3NVZWhMbXVR?=
 =?utf-8?B?Q2JhNWdFVUNMcExBOFBSY29aTzhtSHJOMTJoM014amljd25ZNFJxdHJ1OTdQ?=
 =?utf-8?B?eFlwc3VnRUQ2WlhYZmFWTWdYazdVWGw4Qlh2TG85ZUF3eUoyYTgxak1aQUsv?=
 =?utf-8?B?ekZVcDFvVjRwNzZuamNoc3VURUpGbDlFbzR4OEd1TzdReDR0VndTcnR6OUVW?=
 =?utf-8?B?QnlVRkM2Z1JjVUlybXgvREtUN1krbkpNbmUwckZQQmpQMENjRFV0MENmZFVn?=
 =?utf-8?B?RkJ1a0ZNYlp0ZnlmRXhFUnM5UzhONUxEeDEwUWxiek9rcFprakhGei9tTGRh?=
 =?utf-8?B?cXFUZTIxZThxWE1IdkdxWXBPdWpTdmFJOHRlVnYrVHlHN1dMcE10K0pYMkpn?=
 =?utf-8?B?SE1oS3FmNm00ZW1YSUxSYkFSWnUxOE5GZFo5d1pEdFQ3b1BabUY4Y294QlhR?=
 =?utf-8?B?SlgvV2dZSnI0RTg2dG1HRitkT2R2YzYyMUlzOEM5ZnVPcTBmVlhkVWZ1Uzhw?=
 =?utf-8?B?c0FKTE82dWhJVC9DZzBvTkNIODJ2Q3cyWjU4V1lRMXVXc0Q4Lzh5ODFMNGkx?=
 =?utf-8?B?U0lycHB2S21CQnp5T2tHcm5rWTNTVExydlU1OUVwTWVNamZYZGN0L0VaM1RP?=
 =?utf-8?B?MnUvNDhDbWZhWGc1bm1CdHpjYVJQWHduOEtuWjBZY3Q4Mm5zM1RnajNpK3Br?=
 =?utf-8?B?L2oyTkhYRm1rNFFVTGF6U2w0ZFZQcStZcW12WWxVTmhST0RpSTVZdVJzZDRj?=
 =?utf-8?B?Q2F1M0d6SU1vVkVGRzhhNHAvd3NmeFoyaDZHNW8rNUtTZko4T1RyQ3huTTVx?=
 =?utf-8?B?T21rR1JFMFhUSExRaUlOazhod2tCNXBUMDZ2N3F5SkNwVTYva0dEZG5rem80?=
 =?utf-8?B?ajNKTHZETERaRm9IR0k0cXlzbFArbzVtSXNOVXdwVU0xUGxOR0VyMVB0MGNK?=
 =?utf-8?B?MTQ1MG1RblVFY3dxWUV0di9yZ0lLcmVsZ3dGaFg4bFZybWw1cWRPaVM0akFa?=
 =?utf-8?B?TVlOZlJqdGNHNkYrL3FtWHpmMkhhYThRSDhhTTBNd25kaCtqRHBaUnhudmNS?=
 =?utf-8?B?c0Jsc2V4d0xRNUtjZ05zcVp1Y240bENZbWgzY21iaWhsTUhBT0R3UmIvUS9V?=
 =?utf-8?B?WDU4WUpQR3RUL0dHaFZHdjVUOE1mNWJKbE96ZWhNaTZWb095anB6bE8rWERV?=
 =?utf-8?B?c0lYclg5eGtPTVpQTi9hWFhyVWk2UGZKb3kvSFRZT3M3MnZCejdDWk9qRTlj?=
 =?utf-8?B?L2NtWXlhOUFuNmFvR2dsZGoyanoxUWs5cXhqa09hV1lad1R0aUEvaWZTMDJp?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w5ZhF3gYtShqKTEj89NEXp+6n0ULAI0TGv4iN3hpD9Xzs+0cQ62v2nVYLYPLAj6O5zg+UZ9dNGgRI3wU9g0NTBBnMTkVVGnmPw80nDRblgk9b79bGzRJTSFcqF5rOy5ybgJGy4jLJfpBm8XFI/cmpuG79K/wY757stydIzKGNomhaiOiejQwS3Bf1yj3cnwgB79SoDAqH8SkxkcHCpzkMOneQ4n9uha+13Np4Oq0icBcbh5L09kFGAniyWNMJ/QstH7aXFjbHOa+oVzT5c7AVb+W+uy5h1NZFdpdfwkUsoBW2K3ewOYErHmSUN10EbNa+GEhCh1l4x4TlB9DHyddPnqqPSpE8sFsXI5UDms3bAxnyeb756BxV10n1urKY/Rb4p3ahMqBeMjVX6ETgLP9UE85uO9KzFSj0HRhxvS+c6f2PXjlt+d8gKPFbwcNgCwNLhONjqcNh0tp93r7z7TBGPpfIqPdx3isxK6LM3cFtn2Ky8S9F56HT68FCIhsrKlineRKnA/jBMhBSPHY07JZnWcoou5UT9bGK1mLrcBPCd1Bet+zhc1VlqHUSLFt3McDxux3eJpAHr6+++WOynojknALTvY40wBc6oeOqddfdgpI+0miF4g4/tM/yXUuCTMzuc7YM6IXFdazbulr4ayIFZsWY1BavBfH5eJZQavnVvuz3kQXNIr1vNhkN82tzGg/IhMcvYYk6+UrsG6IxyZi363+M+iGpovdKOhjQiVgPCfuS9Nm7aEA9p9nxBWL6Wp4D59otzlk+wB8F1Ue67LRfEtVadhTMmjTevwg3UW5epwuFslctVYnu2P6dqXpZebr
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82571b92-0ff0-4bcd-f62f-08db343931dc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 11:47:26.0546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: th2TLhkwqR91cywvzWVgvPAlw3Q7+xRJm5YOVWJv33g19BYNPExzm9fhxPVqJRzH89fIEufOMj9q69cLqNbGVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5587

On Mon, Apr 03, 2023 at 11:55:57AM +0100, Andrew Cooper wrote:
> On 30/03/2023 3:43 pm, Roger Pau Monné wrote:
> > On Thu, Mar 30, 2023 at 01:59:37PM +0100, Andrew Cooper wrote:
> >> On 30/03/2023 12:07 pm, Roger Pau Monné wrote:
> >>> On Wed, Mar 29, 2023 at 09:51:28PM +0100, Andrew Cooper wrote:
> >>>> But this does mean that we now have
> >>>>
> >>>>   cpu_policy->basic.$X
> >>>>   cpu_policy->feat.$Y
> >>>>   cpu_policy->arch_caps.$Z
> >>> I'm not sure I like the fact that we now can't differentiate between
> >>> policy fields related to MSRs or CPUID leafs.
> >>>
> >>> Isn't there a chance we might in the future get some name space
> >>> collision by us having decided to unify both?
> >> The names are chosen by me so far, and the compiler will tell us if
> >> things actually collide.
> >>
> >> And renaming the existing field is a perfectly acceptable way of
> >> resolving a conflict which arises in the future.
> >>
> >> But yes - this was the whole point of asking the question.
> > I think I would prefer to keep the cpu_policy->{cpuid,msr}.
> > distinction if it doesn't interfere with further work.
> 
> Unfortunately that's the opposite of what Jan asked for.  What I have
> done, based on the prior conversation is:
> 
> struct arch_domain {
>     ...
> 
>     /*
>      * The domain's CPU Policy.  "cpu_policy" is considered the canonical
>      * pointer, but the "cpuid" and "msr" aliases exist so the most
>      * appropriate one can be used for local code clarity.
>      */
>     union {
>         struct cpu_policy *cpu_policy;
>         struct cpu_policy *cpuid;
>         struct cpu_policy *msr;
>     };
> 
> So all the cases where you do have d->arch.cpuid.feat.$X, this continues
> to work.
> 
> The cases where you pull a cpu_policy out into a local variable, there
> will be no cpuid or msr infix, but these cases already have no cpuid/msr
> part to their naming.

I see.  I'm fine with this.  There's still the remote possibility of
field name clash between cpuid and msr names, but we can likely sort
this out if we ever get into this position.

Thanks, Roger.

