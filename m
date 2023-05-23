Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393D770DFAA
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 16:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538508.838478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1TLE-0007ka-CV; Tue, 23 May 2023 14:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538508.838478; Tue, 23 May 2023 14:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1TLE-0007iv-9i; Tue, 23 May 2023 14:50:24 +0000
Received: by outflank-mailman (input) for mailman id 538508;
 Tue, 23 May 2023 14:50:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YHTC=BM=citrix.com=prvs=500ef747c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q1TLD-0007ip-AN
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 14:50:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21a2f17e-f979-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 16:50:18 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2023 10:50:15 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6801.namprd03.prod.outlook.com (2603:10b6:510:118::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Tue, 23 May
 2023 14:50:12 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 14:50:12 +0000
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
X-Inumbo-ID: 21a2f17e-f979-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684853418;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=l8GXLPbeva7yVj4fNSVD32V8t3CEE94ZtnoDhUJ7Aj4=;
  b=YPcng1zPfunKVIqCqR/2oH7vHZzPxcxrJ5VO2qZ+s6eKrpEESsf9nQLv
   AvhUz7il2utyNMW1bmhtLcfDFVNQ5Iap/saQsM49a9/00o6ZAaez9F4DH
   sGM4CMQghPHCFYBkplZrm4CYXvGhrJX+ap8Bl184fMnyHzDVH1P0DY/ZY
   Y=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 109969725
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PKTpYKxt3EXqTfB8F8h6t+f/xyrEfRIJ4+MujC+fZmUNrF6WrkUBm
 2JLWDiEM6rfZ2GnfNx0Ptyx9xhQ7ZfSztAxS1RopCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRjP6sT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWJx8
 NgXOhE2Ui+83+Op8KiVWvk13Mt2eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIhuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eezH2qB9hPfFG+3uBmvk2c6l0qMQExVWSE/dDhs0WeSc0Kf
 iT4/QJr98De7neDVcXwURS+pzifohcWVt5UEus7wAiIxuzf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8rzm/JCwUJm8qfjIfQE0O5NyLiJE+iBPGCMxqH6+8gtT2HizYy
 jWG6iM5gt0uYdUj0qy6+RXNhWKqr52QFwotvFyJDiSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02zaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:gqxvpKp54EXVJOt2oHPgSqQaV5r5eYIsimQD101hICG9E/bo7f
 xG+c5x6faaslgssR0b9Oxoe5PhfZqkz+8S3WBJB8baYOCEggqVxeNZnPDfKlTbckWVygc378
 hdmsZFZOEYQmIK7vrS0U2UH9Mh39Wd4MmT9ILjJxAEd3ATV0jM1XYcNu/eKDwQeCBWQZ40Do
 CV6MZkqyrIQwV0UviG
X-Talos-CUID: 9a23:1041bm8qR6R2Zg1/iC6Vv00rH+QqYFzm8Ejve06nOXxHWK3ME1DFrQ==
X-Talos-MUID: 9a23:wAUPrAjLprDu2fpjmTUE8sMpKstW86uCOXk0jbIGhPbYHHRJMBePk2Hi
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="109969725"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiSGoMs2Kgd0TpOEU9nliTjs+TD5WAPz8tma5wH4q+gjDJYjeJkj/sq4AzpP8zqsDzph4RSWdiu0NSyjdvBhVBSp8rPKU6MU7AjThJZMt4wx+3dlBfUzXrAO9p1QjS7C1shEYzp79J0W6TsBObrKu8iC1edlI8tgyNp3j5qv3SoJSpRbiHpDLPdv1xYZFFq9keVSejoJrE36JFVTSWHMV+rGeMebP79BK4icQ/6ASqTqSi+fznYNDB7sBvaKFLoh1KCHTf1x9FVQd53zZuFxEVTiFBWPktLwF3wA829koJ2e9vFtc+WAcnQqYZD54G6hopI5DN4qjyT3igp/d0nBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iewsP3RDwBj7upNajhGPj9pL1aILmljqTlcpQ2xqdk0=;
 b=KX9OlMp8khVhj9zo7DfB22N1LdtzOyhx3hI1asm8dkiUXdc4IGmSXUSU1iNcqxPIZm3/BFuwXI6T7iO7BsCx2kbKv/DfHIkBiNbFaVyyY5Knbu2Wcmdxw8iylvAFR9h+uSvN0qEgrxN/XMng3wtZ6Ld1u6jF/Z0oGQOi+FGIK8SwH+P8DsTcQm0BJd+1S9/j8Gd6WAa0C3rBud6Emy/QnViX7fN+sooGWkFWv0yGY46QrrYaJxQ5oQ/6ztOlbSCJIraljFKJmx9Y7VAcQyERsLkOsr4xyJH8WW5Wf3G3enwxdYwWGUt2GIGHjGR8PjXvnNFOE7h+JVYIgwj1VjeKFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iewsP3RDwBj7upNajhGPj9pL1aILmljqTlcpQ2xqdk0=;
 b=tCDcjBWfwDD7IsqbG5cy6fnayaq0AJgJeqYE8Auwaz5XqDsqwBsVgKQqBnztY+QqNSqCoq+9tPgirMh+WqT2BAsesjK3n/BEWLrbAieOOF2OXq4qT32fkcn+jpIeatqU2xBDCr7hDyqKxHtqhvlvvmeLieRSLYJ09ANj3U+Nh4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 23 May 2023 16:50:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
	andrew.cooper3@citrix.com, xenia.ragiadakou@amd.com
Subject: Re: [RFC] Xen crashes on ASSERT on suspend/resume, suggested fix
Message-ID: <ZGzSnu8m/IqjmyHx@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305181638390.128889@ubuntu-linux-20-04-desktop>
 <ZGzFnE2w/YqYT35c@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGzFnE2w/YqYT35c@Air-de-Roger>
X-ClientProxiedBy: LO4P123CA0278.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: a25c4759-0979-4bf7-a030-08db5b9d0306
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OOTJIICAiMAlQY8mZ3O8m10DNgRADcWspaqiBh3NJZ6H4+4y1BUe/yyArVf/Qnod1WkDYI1Q4FtJe1m4ORri38yhTo9XDlIHFfN9FVeA5IEYS1uJKsUP8nHVZkSIfAkNFDlIn9Z/DzYEYd7/kKMi1YrRU1QxGj9b8w0QW+BnY0xoCloXPQDadQ087Jv081Q+sHRMS261BmBxOqb1sT22kjKkpss/fGmBTLoV+WL6o0GumAB95lOM8FppatmKK09MKoM8TUnx3S5R4DxtJ7VtcJvw3lkcyLKyyAaP4aGfI3ZpmRn+2pnbd0BIHh0DQ2j5kxDaEBGBmJoQYMVLdfAb63cxqu91XnDBXfUm0WKlxdia2zujDC8goE3lPXIOw8dkLMMVrA+lXPZyEBKtB8mEPBZL1z1KN0ojr4U3u9IEOMnvYIejYwaZS8jtcNZgytPArnP+a+wwXV8NB0l6VXiphPSaQ6XfXknUcd31XlxVqUIMFk/SjVDhSkeCI2n8rpJOOM8eRgust8G4Z8rT4ov9dQbVcZEn3ZxcvLyV41ohDn7ud/61khQOTZ2tTgIEKdVY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199021)(33716001)(6512007)(6506007)(85182001)(478600001)(82960400001)(86362001)(26005)(186003)(9686003)(15650500001)(66946007)(66556008)(66476007)(2906002)(6486002)(6666004)(4326008)(316002)(83380400001)(6916009)(41300700001)(8676002)(8936002)(38100700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3hoYkZENnBXbmxmMHBrS3oycUhUR1g0Z3JzZkdxNyt3Y2x2bytUTXBMek15?=
 =?utf-8?B?MlUwUk82VDh5bVRTNG04QisyOElmN2JKaURJOVpUNTRwTzJEcW5TUHE4VE83?=
 =?utf-8?B?ODV2RFNZVXhTUm1xZ0YwSzZmaWdkbGc1eGRQNDlIN1UxRDBBZSsvcGowQzlP?=
 =?utf-8?B?U2liWVlONW82QWlkU2l4WGdNc085Qk1kS1ZWTTdPTUhocmNlZmUvZ3FyVHZY?=
 =?utf-8?B?T0hRdUNBVXlkanl2ZTZPSS80dGRoWldtd3hhVGlmaktPQWNUdW12cnZaa2t0?=
 =?utf-8?B?NDJ3OW5uTEY4Z2QwRUZnVjR3dGRQSVJHRFlsSXZvZ1h5TmZXRXRNTWtza2tJ?=
 =?utf-8?B?Nm9DL004SnhpN3BqRmlmemlyU1IvUGcvaTVqQlYyeG5GdFZzMUptSHhKRmNw?=
 =?utf-8?B?NklyVEpRNDV3Kzh3OUVDWkxjQUxjNHBGajdIV3U0R3ByVVVIUWNnSVkyRWli?=
 =?utf-8?B?S0YvTWxpRHlIVnlrUEFNVDhWZUgrVWc4cUtMQ2ZXeVlQS3FrelBJVzBYbytE?=
 =?utf-8?B?aFZrU25kM0IwOUtwQnNPNm9mbis4RDBlT0llMnprd1hrRFZDcStuYVVLVjRX?=
 =?utf-8?B?akw4ZklxaHY2T24yNmlINjFUMnhzdHd1Sjd1VGtTdVpiS3hHM0dCOXF2QmRG?=
 =?utf-8?B?eHFpaHpEMWQ2Tk1ocG9VMXJXSDdzdjJTNmZjVXJzUm1kbGJhYlRwWkJreDNX?=
 =?utf-8?B?aUJseERWZ0JBVjdCbDhNNVJKTVJuWGVnajVOUlBtL2VqUUxGMTJMZ3RXYVYy?=
 =?utf-8?B?RVk1WW9VZEY1Z3ZrZmttWnAxN05DOXNCeGNCZERhUFcwODdYazEwQ214bWt2?=
 =?utf-8?B?VWJDUWdJYlRuSXcycHVOTEFKY2JKZ1ovQStlVCt5ZnZYVmMwbVhHOUM4dklj?=
 =?utf-8?B?amRzZks2TEhMcm9wbFovVDkvUGpVaTBJeXlRMCttQitpRitmUVhRMHp0YVhS?=
 =?utf-8?B?cXBRZjM0WXNPSmhQcGltcFQ5YXBpY2tUOTh4cFdaZlM3NGkwRDRRZ3BuZFhD?=
 =?utf-8?B?ckJ3cVd6N2N2Vm9kUXlmSTZRY0R1a0ZOVzNKc3ZlR1ZlVlNzQmRtZVlGdjE4?=
 =?utf-8?B?MU1HczJVb3N4V2FZTitCRFBmK2NaOXUxR3NnYmpyNG5BZDBVVERxRWJSVGtR?=
 =?utf-8?B?UURlRnB0dERaVkYwZEVIdU5FcjU2TkRIZGt3SVdwdGg4RGIxaFJvb2FCUUox?=
 =?utf-8?B?QWVHTEhuZHBXajdySnFlNWM4OXZzUmJacjFTdXBKN2t2ajU2SGNUalhmRDEw?=
 =?utf-8?B?Wlk5c0M3V3ZXcVdiNjl1aXg2TVFwKy9kSis5aFVaR3lTTHlMU09IMVZzYUVY?=
 =?utf-8?B?czM1Z05oRU9UTkVrTlJ6WkVOTjlXR01iN0ZmZ2I5aWJBWE1ZU2Z4Wi9aWFFW?=
 =?utf-8?B?YW5YdTF5eE45c1lURVBjTUlxeHVjMHpyODQydS9rU3FzZHlGTStkQm0xL1ZN?=
 =?utf-8?B?NEYvWk5iT3FubnBkMlVYMGJBMm1mQmx0aHhVU0QxWWpibmFTTmFvazNIeGlz?=
 =?utf-8?B?SUJnNDRWTko3ZWxhQmh5UldRazM3d0VLU204TGxiNm11VGZPanhZMTZZNUVh?=
 =?utf-8?B?b3VwVWtHWmgvTzFEVWdnMlhzVDh1c0hXVW0rVUE3L05JZDE3OUM3WmVEN3FM?=
 =?utf-8?B?d29Lc3JRTWk4bjBVODdmQWJENWplWllzd0N3UWRJNytvdmU4R29BRVlaYSsz?=
 =?utf-8?B?N2sxd2h0WGp5ZlNBbGJzaUZJekZYYy82S2lKV0pocnJKZWV1aHgyVDFnREIx?=
 =?utf-8?B?bDU5MkpCeGFhczFqVWtaOXdCQlhGditpNkpFSVpqYVgrTnN0NjdrMEcvamtv?=
 =?utf-8?B?YTZqdmtuN3JHWUdDWVlZQUFKOEg0UFIwUmVsLzZLOXhCRVJydTMwdEdsSzAx?=
 =?utf-8?B?TzFSc0hFc0ovQzNJcDJkeXh6cjlUb0Y5TS9GTy9uam9wQnZRRi93bFNVK0hP?=
 =?utf-8?B?N3oySU9sajV2OUx2Y3lTL0dYVWVpZDV6M0Vqd2d6enVhZVRlbVh2TG5Ua1p0?=
 =?utf-8?B?N3Y5REt5YmRENHNWakhMOGFxTkhWaEU1R1E2Zmg2bHVodzVUc1VaemwyeGpW?=
 =?utf-8?B?dW9GSmR6RlNwR21CSjhnZmJobE5kK2tjZk9OdjAxVDdEb2loR1ZhdHYxb3U3?=
 =?utf-8?Q?vlWgHRj7p/NQRQDbiFYbF3kfR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5Rv1IVrPqLAj+iZh9rHVPRTaGd1f1gnlvKoHrR7gF6JaOC7S5dCZ9e+xPYs8UX4IwyaL67d6zXMJq4n0WJpdAFGXRWkTp2aat427x+lDcN22ONMzkac6R5i7RYIaxiZRtTlcP+lpD183F9YkqCQz2iWeqmdRB6a5U1NVvOiIbjbN2CgKq/SHjzRHcpyOeIYugdkSQvuRhzhYuGOfh6FyU5J7FORVghSxTrXPml0lltEkbxjiuB7VDamdNQw4nXGjPrry8ATyC71BZ5PqlZsPfn1KcqkYI9Ap5IowMLhLN0iDCo8l2kEzmg2gCmLdY4m4hPQJRA3vWPjTwbKSeXsK/1jYbTGLdYpgHL8oXV+TFI9b6qNUUCmkyFY3ArSSupZcUBRv4aH/wAJ+pBFKE1ev2EOR+gFFjHQiFCJqOnIat1JQiAWsotGAjB5Sw8NO+zfZkmwe6ycRTKT7R30gEZFm4sviVW2Vo/ectkoWRjw5qX6KBCRh55lFpTcuaJYzrHsFacbpTsdtquHkTj47/QL1zLUFjGwJzABPhLFYlfbiY4AR2MPw1YL5DCqe8qCUiY2hTEtOXj/lycUoUXTpURboCya1jAuxwONHIZZ5Dy5kwAu51wkl/N2XRQT2pgtfas782JPZc6H2SjP3qKKhEAEkaFNXxn4OKb29ym0m7sQau1Z0qJiao6PhRBqUl2kaB6gMtfHnZizViL5mr8kod5a3Oa2y3mKZOnFJ56Kg5ZvHr70qEBmsBFqij1i4e0WimlffgYLdO+BoZFKwBav3RnMLuutxpUHAAfdQwX9oDCWsH44r8yk83bKmXgsf57WYokQZ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25c4759-0979-4bf7-a030-08db5b9d0306
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 14:50:12.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABs921PSVm+CfjqiVFm8EhF/JjfsQWqdc9thmKkd1AnFnTN1SUPPkIPr3ROG9ty2pDyEFuyJvYS+dWl+KzFpFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6801

On Tue, May 23, 2023 at 03:54:36PM +0200, Roger Pau Monné wrote:
> On Thu, May 18, 2023 at 04:44:53PM -0700, Stefano Stabellini wrote:
> > Hi all,
> > 
> > After many PVH Dom0 suspend/resume cycles we are seeing the following
> > Xen crash (it is random and doesn't reproduce reliably):
> > 
> > (XEN) [555.042981][<ffff82d04032a137>] R arch/x86/irq.c#_clear_irq_vector+0x214/0x2bd
> > (XEN) [555.042986][<ffff82d04032a74c>] F destroy_irq+0xe2/0x1b8
> > (XEN) [555.042991][<ffff82d0403276db>] F msi_free_irq+0x5e/0x1a7
> > (XEN) [555.042995][<ffff82d04032da2d>] F unmap_domain_pirq+0x441/0x4b4
> > (XEN) [555.043001][<ffff82d0402d29b9>] F arch/x86/hvm/vmsi.c#vpci_msi_disable+0xc0/0x155
> > (XEN) [555.043006][<ffff82d0402d39fc>] F vpci_msi_arch_disable+0x1e/0x2b
> > (XEN) [555.043013][<ffff82d04026561c>] F drivers/vpci/msi.c#control_write+0x109/0x10e
> > (XEN) [555.043018][<ffff82d0402640c3>] F vpci_write+0x11f/0x268
> > (XEN) [555.043024][<ffff82d0402c726a>] F arch/x86/hvm/io.c#vpci_portio_write+0xa0/0xa7
> > (XEN) [555.043029][<ffff82d0402c6682>] F hvm_process_io_intercept+0x203/0x26f
> > (XEN) [555.043034][<ffff82d0402c6718>] F hvm_io_intercept+0x2a/0x4c
> > (XEN) [555.043039][<ffff82d0402b6353>] F arch/x86/hvm/emulate.c#hvmemul_do_io+0x29b/0x5f6
> > (XEN) [555.043043][<ffff82d0402b66dd>] F arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x2f/0x6a
> > (XEN) [555.043048][<ffff82d0402b7bde>] F hvmemul_do_pio_buffer+0x33/0x35
> > (XEN) [555.043053][<ffff82d0402c7042>] F handle_pio+0x6d/0x1b4
> > (XEN) [555.043059][<ffff82d04029ec20>] F svm_vmexit_handler+0x10bf/0x18b0
> > (XEN) [555.043064][<ffff82d0402034e5>] F svm_stgi_label+0x8/0x18
> > (XEN) [555.043067]
> > (XEN) [555.469861]
> > (XEN) [555.471855] ****************************************
> > (XEN) [555.477315] Panic on CPU 9:
> > (XEN) [555.480608] Assertion 'per_cpu(vector_irq, cpu)[old_vector] == irq' failed at arch/x86/irq.c:233
> > (XEN) [555.489882] ****************************************
> > 
> > Looking at the code in question, the ASSERT looks wrong to me.
> > 
> > Specifically, if you see send_cleanup_vector and
> > irq_move_cleanup_interrupt, it is entirely possible to have old_vector
> > still valid and also move_in_progress still set, but only some of the
> > per_cpu(vector_irq, me)[vector] cleared. It seems to me that this could
> > happen especially when an MSI has a large old_cpu_mask.
> 
> i guess the only way to get into such situation would be if you happen
> to execute _clear_irq_vector() with a cpu_online_map smaller than the
> one in old_cpu_mask, at which point you will leave old_vector fields
> not updated.
> 
> Maybe somehow you get into this situation when doing suspend/resume?
> 
> Could you try to add a:
> 
> ASSERT(cpumask_equal(tmp_mask, desc->arch.old_cpu_mask));
> 
> Before the `for_each_cpu(cpu, tmp_mask)` loop?

I see that the old_cpu_mask is cleared in release_old_vec(), so that
suggestion is not very useful.

Does the crash happen at specific points, for example just after
resume or before suspend?

Roger.

