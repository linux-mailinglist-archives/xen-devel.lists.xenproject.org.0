Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3766B75A3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 12:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509224.784579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbg81-0007aX-DY; Mon, 13 Mar 2023 11:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509224.784579; Mon, 13 Mar 2023 11:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbg81-0007YM-An; Mon, 13 Mar 2023 11:14:09 +0000
Received: by outflank-mailman (input) for mailman id 509224;
 Mon, 13 Mar 2023 11:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=koCJ=7F=citrix.com=prvs=42903c55b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pbg80-0007YG-3k
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 11:14:08 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd393ca2-c18e-11ed-b438-930f4c7d94ae;
 Mon, 13 Mar 2023 12:05:00 +0100 (CET)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 07:12:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6874.namprd03.prod.outlook.com (2603:10b6:a03:439::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:12:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 11:12:37 +0000
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
X-Inumbo-ID: cd393ca2-c18e-11ed-b438-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678706011;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OA75Um56nx+YdVjvaQPGbUUWlRBmYMCoy+xyiZGn3BI=;
  b=QMkTMYoXvrB+iAQxTntj/UDMjg5kwKz1RWkCkfyjRu9OXcW9Olq6Ip0e
   QGvGS8hYxeslsBTH1sHNZB0uiVYrJA4WemQuMWC8C2PHvowi0gNBTMBjn
   /+LmtfSCjssS9mooTUcfJLAzaob6D/+Bbk0nythatss7aWhxAmDAWKcny
   Q=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 103007108
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LGfP0662KTHHGT+saRNzygxRtBXGchMFZxGqfqrLsTDasY5as4F+v
 mpNXDqAaPvfajOkco90OdiypkNS68PQnIBnHVNpqH83Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 M4RCw8XSEq6ivuW/KmZE89mh9UhBZy+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOKF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKT+Xgqacy0DV/wEQcBkAPTQaYhcO5tWuZcu50J
 0BN8BQx+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZQ4M4t2mpZ5piBvKF45nCPTs1oezHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa0owFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:HM2IdazejXH1lk5ab9HmKrPxMegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67SdC9qADnhPlICO4qTMqftWjdyRGVxeRZgbcKrAeQeBEWmtQtsJ
 uINpIOc+EYbmIK8/oSgjPZLz9I+rDunsGVbKXlvg9QpGlRGt5dBmxCe2Km+yNNNW977NYCZf
 ihDp0tnUvdRZ1bVLXyOpFDNNKz1eHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lMzQi5C2rAr9E
 nCikjc6r+4u/+25xfA3yuLhq4m1OfJ+59mPoihm8IVIjLjhkKBY5lgYaSLuHQYsfyi81Ejlf
 jLulMFM95o433cU2mpqV/G2hXm0hwp93j+oGXozEfLkIjcfnYXGsBBjYVWfl/w7Fchhsh11O
 Zu03iCv5RaIBvclGCljuK4HS1Cpw6Rmz4PgOQTh3tQXc83b6JQl5UW+AdwHI0bFCz3xYg7GK
 1FDd3a5txRbVSGBkqp9VVH8ZiJZDAeDx2GSk8Ntoi81CVXpmlwyw8iyMkWjh47heUAYqgBw9
 6BHrVjlblIQMNTR7l6Hv09Tcy+DXGIaQ7QMUqJSG6XVJ0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uM8uTx5dGmyq9AVlVZQ6diP222qIJ/4EVHNHQQGm+oREV4oWdSswkc47ms6
 3ZAuMQPxfhRVGebbqhkTeOHaW6EkNuI/H9iuxLKm5mnfi7WrECltarBso7d4CdWAoMayfYPk
 YpegTVCYFp0n2LM0WI9SQ5HUmdNXDCwQ==
X-IronPort-AV: E=Sophos;i="5.98,256,1673931600"; 
   d="scan'208";a="103007108"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kP4AE7QHC0gUaC/G7FMuMtlzvNxiJOe/NG96T+Ku2++OsMGA/tINZTh9+aSvTNx4od4E7+tfEYHXpud/AjDBgGBdsfcorLnnsksq2et6ll1U3C/Ta7o4WNg5/0ZBChyrD0A5DloBttBb9mJR9RM/YLxfbTfUSzg1TOF3jLb1ARBp3v98Nk1BzAi3iKikcIv+uFTW/lficeJpsuyIciTUePgwpWQ6DQdBpgzM9kBt95X86rUtvc3T8q15ryxMzfQovCtQE2y7oyMM06+e37o70ytliX9nC6qyT6PtRMTltrOxyO95mQaVRMP/H3iiXW9Q+SRWGAjXj9iqyXssD8grWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsDL/+1Ci/4hot0VSNWmlW5T3ihkrCF77IzfkGB1Ayk=;
 b=Q5bvX0f0eqL6FxfUyGO6CMIB7fcge3JQIzY3BYw/oE0uN1DnHZu/+g2lZlUaVHjNSg1kbeFmhv0unv901EXXyNax/dC1TjtsrgxEn8hIlYvVzcaBd04JKarNGDrsNH8/H8iGFxau5TVkqspXu8Mu0ynScyXl+DIefXRlL+8x/0Mg4Pk2txbZjEKM/nA4VTNdwEH+Y/ajExf2N6aj26/Gh/8PxlYaKXhq2vwhwBzZS6jW//QtJVHUeBNbMCbYc0R/30Ju+lvIlS6AOPjwBhIuE4SPHG+fJttM3RlYqW9+I1wn2nQnPVuiTmSgBIXXK6pcZ3ijhE+NI7PhTeALIm16NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsDL/+1Ci/4hot0VSNWmlW5T3ihkrCF77IzfkGB1Ayk=;
 b=a+A3oDXo3XFtFVRtH5QgmdTAV9Ycr4ajlRt3VU5e4N6fRkFiYgurz4Fh8gwQjEyaF4g/KqQNgEy6CmvUzsW4buqc+dYpU/wcXPO9ItMvGt5yG2+cMwCHYBdwi1adXptQ4p6hC89iFyeGUlOI/VIW7Yt+KvZ81kjs7FEG/z1O55c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <27282d10-7c35-e7eb-5598-ead0e28c8fb7@citrix.com>
Date: Mon, 13 Mar 2023 11:12:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/spec-ctrl: Enumerations for DDP controls
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230310160238.1321765-1-andrew.cooper3@citrix.com>
 <20230310160238.1321765-3-andrew.cooper3@citrix.com>
 <e0463968-22ff-b2de-c878-63526b981de8@suse.com>
 <e1dc583f-8fdc-48d3-3c13-05be261db62e@suse.com>
In-Reply-To: <e1dc583f-8fdc-48d3-3c13-05be261db62e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0209.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ab6890-195a-4db2-481b-08db23b3da20
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qXot/hh68z1wA16JclT7aJQqdBK1sqbL7Xw+e83FpST6UXmp9qpyZ30EDhTcI0l5Ca9GLUBvRAb9fT3oRVcOimBTfXkFwgo9F8Qs/hK4SRgrJxmYKA9aPBMe4b2amRtUbQY2PnZ8Cfl6CmflfOBQD6P0sg8pjHHmpsDebdkgGHilkD2JPJvX4PsDVkyRRjs8bwS3ZXiHEdPHCt+h/baYwaNLgPya3LX/DD+YxtouXfb3awQUndz2B84+kgY6B158XHim0Okyb4+zEeAJDn2QKfdlkDxAuC/UQ3jtsyEqvvpsrrxpsT+hVAzVq5pDoKQ86VjWW/tLwWrf4b10xYBnH7nnzfs4wt1OLpJUlaAvUk2WvcQrGy3Ncf3PYcBQNUXoNyHt5WxhVKPTjvLfABzl+49OwzDfbjPHUPozWGN9MgZ+UnWSkIGNP+IJKWB7awtEhp57RQfHjoh9XB9OBbUzn2+gJwkcaOXHLgo75zB9HTe5ouTYjT+eH3jXd7FVJ54lveePVgGMqvexiHCWXMmVgeL0+ABEquQNg9CU22giZid4+LMAnziTSooqKTRNe3WVo9o7cTxgf5P0U/0Y3oCgKGFDlkEr6P5P70SQ+TFl4/ZNq0MJ/D3C1FeUbY9w8kUYbpAIlV8VCg8pi0QPKi2fyFtBDtiH9fpo22ulw+dGC1jXaoHsQuUoRf3cy014YpadvrH6ZsXZlacxg0SY1+XYzna2+S1b8i9958h/awRv5zk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199018)(2906002)(31686004)(82960400001)(83380400001)(5660300002)(36756003)(66946007)(66556008)(8936002)(41300700001)(8676002)(54906003)(4326008)(6916009)(38100700002)(316002)(86362001)(31696002)(66476007)(478600001)(2616005)(53546011)(186003)(6666004)(6512007)(26005)(6506007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnlCd2hBVk84UHk3clgyQWU2ZzJVUFUxUUR1bERmTnRJYms4V2NyamF3TXhh?=
 =?utf-8?B?YUdYUy8wb2xqYi95Q2d4NFpocFoyRkg0cStOSnVJRGllZld3UTJscm5qL1pk?=
 =?utf-8?B?b2F5ckFaWE1tNlBGQVlEUU8zeFJ5cDlqRHBxVStSRkJuQ3A4NzBBV2dvMDRo?=
 =?utf-8?B?YldQemdiYW1wRUZxTTRKTWNOU01KTzdsZU5uTjVUNXNvTDZndEpaWVlzQVlx?=
 =?utf-8?B?bGE1ODRRMmp5YWEyQm55T0JJT2RkWGcvSTZGdmVSc01kVUJ6L3Uwc29TcnVh?=
 =?utf-8?B?am8wbW51NVFsY3RBdGM4Y3NNK01WTWI2dTB6RE9CYTM2ZVZFNWxLRWdFZmVN?=
 =?utf-8?B?SHNDcXU4MTl0U1lNd0xJY3hDMlJiR09JY3ZYcTNsLzFFRkh6UTlMUXZmYjY2?=
 =?utf-8?B?Y2FNUmZzL2MwZk9XYnFCQ1R0RTRjazVQb0hYdGJ1ejk2VDFtYUxtb0c2QWN6?=
 =?utf-8?B?QnZuVGNmL0Vtdyt6aUhMTjNoajIvYmFyTCtpY3hXVDBIQmlWc3BIWTQ4WkEr?=
 =?utf-8?B?Qmx1VXBiS0dzaXZpck5LUXJzR2RpeEdIS0xySzhycndrbkgvcTRmTXBaci9Q?=
 =?utf-8?B?cEhvWjl4TVZHNldZMHJDc1drWFJ4Rm1DWUY0M0FsS00vdkNQQittSzJJMFBP?=
 =?utf-8?B?emZzUUpCOXpVMm9zTEtnS2FneCtBa3pYYi9UdmdtbU5GMmhLcjBHZDVYRGww?=
 =?utf-8?B?T3lDMWxnQ1p5c3NvUXRrOUNlWHBtKzdWcEhLY0pkaXRpVlJPSUIzc0twT1JS?=
 =?utf-8?B?U3hXeGtiSWlSdnNyU1l3aDlCdC8vaWVLWmpTT2xHeGw3QXJzRUZIckNlUkZa?=
 =?utf-8?B?NkxOd3ZnT3I2VU9OZjlGVXYwSno4Ny96cktSNVhEYm12VFRtTVJ1dUlJc2hR?=
 =?utf-8?B?TDMrRUNrQzRCWUxpSkI1THNqQ2NkNGJvcysrQUc1VHozVjEzeVE0MUIycXBu?=
 =?utf-8?B?bWc5K2VXNnJ6SGVQbTR3WnBNc2xCSHNRc09CQUJTbnhObjI4eng2UHlqZU9L?=
 =?utf-8?B?UWV6aWFwOEJhQmtobkV2dzFKVWJuZ0x0d3Vpa1c2d1NPS21TM05tRFhFc21O?=
 =?utf-8?B?S29zc2FERjU0VU9DbHFOazh4V2pWWnpXM0xlbGFNaTNPR0tJV1FaUnBOWG1U?=
 =?utf-8?B?MlZUSWdFQVpYV1RPajI4N3BVeTFSdTBET0pmTC9xWXVSeXdwTk1BN0d3TGNF?=
 =?utf-8?B?bWd3VDliTVE3SDBWZFpQNG15QkxnVXpKcWhnNEh0NENwT1JMT0QyVXFERXJD?=
 =?utf-8?B?TUw4TE5MZ01nWjA0SVBuczdXNGZyVXRKWGZDMkFPaFk1TEhTRkVoMzZ2WTFU?=
 =?utf-8?B?RHk3TkJNS2hUM3ArMGRVV0c5UDF1eUN3SFhnbzBXSTZ2MUtNUmJUN3FoTlBt?=
 =?utf-8?B?NHBLWWYwbEtFS3NSQVNPY2ZnblZac1NtK0szUitWd1FhTThMRitLT01pMjFQ?=
 =?utf-8?B?YjgySEFKYWtCbW82M1lreXpDMWwxL0NYUTlLRzdGSVBsb2RuSEdtVjBmRUpO?=
 =?utf-8?B?KzhFUWt2UElWeHpIUEhSTVJnTVZpMXUwelVxVkFzZUc2ZisvQ1loOW0yL1RC?=
 =?utf-8?B?RVF4UzNMVXBkdFMxa3BvVlMwdFNkSnp4TU5tdWRLNmtYdmZYNW1jRWdRYTZV?=
 =?utf-8?B?U2EvUWxQUjZraDhrdlRWSkVwNnRJMC9ZWkFoZGVLZ1ArOGVhcG4yWTg0Y29B?=
 =?utf-8?B?ajlYNUhvV21tU1ZvSXRWV01LTEFvZGl4aVJKSHdRN0FmbnFFbTlaWVVsaW9P?=
 =?utf-8?B?T2ViNGZ4b1NFMHRaRTZrN1daUjkvWkduV0ZpdEZ1aU8wa1U5dWlyVUUxWWpw?=
 =?utf-8?B?cEpjMmoxL3p5NTFSeEVBWjQwTk5xdDFGZjVxaENqaGlyamlqTkkxSWt2YjNo?=
 =?utf-8?B?cWhhSDRRU0dlalVsRHBxMFA2TW9OdVFNZ3hRV2tUYU1FYk1maER3TkI2Smd3?=
 =?utf-8?B?NC9vakNRbXVsTk4vYWFZMWRzSTYvNGRUVml4Snh6QlRQamJ2U2ZpT3hVOFl3?=
 =?utf-8?B?U0JNbGxidGZaR2wzdzJXVXRyUzJKb0pMWHl1dW5vMlFYS0lNOE9PTFZKSXhi?=
 =?utf-8?B?TXFHQlA5NHcrR3dBOG84ZUYrQ1IzeWtwU09tOWRoeVI0N1JXSXdCaVVzZC9O?=
 =?utf-8?B?ZkhobHAyWkpwZmNScjlUU05neEhVeG5yQ2d5cXcyNi9UbXpYNWIxZk5MZTY5?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TZRS5L8KYBY0/AxOc+wgdgesusGskgubFX1fhyLzrAzjyN46nGYWinPJftBo1uWE9BKEKSX80GURFjocUNZ+j0YvLy2/LVdzFMih0jhbcJc8tpSweyQLfteYvRVD8z8jAodcnvPAYbbNJdilF6ANIUXHMPydjcVoA61aRU7sjTBb7/JBG6p2eo3CGSyCkT521t8JO8DE0rDmAiJY2wKCQr9mUqKWio5X6jEGNWW9sXAXkzzx8bqoq2hHiNQbpbxBTzEQGT3Y+CqLrfRS9EYKHA7Xd+hA62+OrgeM0VeyfPOGr4CyjHrGfpQQtWySKZc/t9wHnfKETyPXkkcZM3+62gA7owv7xbB1b2BzeQKbv+panjPnjvLDinSbgARpu4GF5Ja+iedv+o2VprzkyMKswZ45j1Cc7FAcA+zq3n3e37qyTimsjDhTIYcaGdpj0NgsJVWIDie6nB74jJyOTX3N6SZphVous2r8hDK5DlVOSRihBX1v9kXvtkpHpBJEjDt4duZLSVulxyWbAJj9vwDf1o7Q+lf+sQPmJRZZU3jytChGCjXO2V345vSrOGbunINBjTde09um46FS+4hvBWKCsinmF04gXaLAomoK+COzCPGanTByRIlkteSDls/yaefjuSmJFDshoMZDcrlH3cYGyu20Uq2N0ZErKpooMo8+YfeWqN6wrSA7ZuSDF2MEUTMu5FX3oNs1Ol2qQD/Sm9uJ6OdivvnPonI7iRSRlkRZq3i1fVbF7fRKmP2ggHImetsfduizgu0RkCbW2p/laWeWlDVx9tkHEKvdvWyRwatyqyEwdMUz2TmvbwZPSradMhReCAiHTY4DGesTN93gM6WLDA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ab6890-195a-4db2-481b-08db23b3da20
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 11:12:37.1692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFgLcsHD5OuEDsLPmPE7JriGBJW3YpAJJNN4rn/7M6yTXCshPopg6Kpik6QqM5KLbEgvsajuyESPoOuHOQ9Pi05cZ00FpNYn4eQIzvQX3dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6874

On 13/03/2023 9:24 am, Jan Beulich wrote:
> On 13.03.2023 10:21, Jan Beulich wrote:
>> On 10.03.2023 17:02, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/msr-index.h
>>> +++ b/xen/arch/x86/include/asm/msr-index.h
>>> @@ -41,6 +41,7 @@
>>>  #define  SPEC_CTRL_RRSBA_DIS_U              (_AC(1, ULL) <<  5)
>>>  #define  SPEC_CTRL_RRSBA_DIS_S              (_AC(1, ULL) <<  6)
>>>  #define  SPEC_CTRL_PSFD                     (_AC(1, ULL) <<  7)
>>> +#define  SPEC_CTRL_DDPU_D                   (_AC(1, ULL) <<  8)
>> The doc calls this DDPD_U - typo, or do you happen to know that the doc has
>> it the wrong way round (and is going to be fixed)?
> Actually ...
>
>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>>> @@ -295,6 +295,7 @@ XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
>>>  XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*   MSR_SPEC_CTRL.IPRED_DIS_* */
>>>  XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*   MSR_SPEC_CTRL.RRSBA_DIS_* */
>>>  XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*   MSR_SPEC_CTRL.BHI_DIS_S */
>>> +XEN_CPUFEATURE(DDP_CTRL,           13*32+ 3) /*   MSR_SPEC_CTRL.DDPU_U */
> ... here you have even two 'U' in the comment, when one of them wants to
> be 'D'.

Yeah, I've messed this up.  It's supposed to be consistent with the
public document (which I ought to have checked was consistent with the
non-public reference that I was using...)

I'll fix up and repost.

~Andrew

