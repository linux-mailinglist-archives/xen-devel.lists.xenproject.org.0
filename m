Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D01375ECFC
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 10:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568452.887765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqU7-0003fC-C4; Mon, 24 Jul 2023 08:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568452.887765; Mon, 24 Jul 2023 08:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqU7-0003aE-8W; Mon, 24 Jul 2023 08:00:03 +0000
Received: by outflank-mailman (input) for mailman id 568452;
 Mon, 24 Jul 2023 08:00:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klik=DK=citrix.com=prvs=5629c81f5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qNqU5-00031X-4v
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 08:00:01 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14e8770a-29f8-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 09:59:59 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jul 2023 03:59:44 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH0PR03MB6067.namprd03.prod.outlook.com (2603:10b6:610:be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 07:59:39 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 07:59:39 +0000
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
X-Inumbo-ID: 14e8770a-29f8-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690185599;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ozb/LOciiRr0V2+pVXwsrrI/mbphhPjs/tnGTLg+YQ0=;
  b=OhgitMfpUVPqRbKH98RM8c0Ytv947OjkDa1iHFcir68QGDBx3e0RxkBI
   +aQB5gWha8i2L8CeA786Y5aSWttn0jqhmDGJN8KoHo/9sGHOzb0QcnlMS
   GFlbH5pqkpjvRX0i3Q6FqBNDqUtAHUl1tDsWyr/UuFBhVZruBqgdygRzu
   I=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 117065135
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:owGraKIKRtPX1mAVFE+RApQlxSXFcZb7ZxGr2PjKsXjdYENSg2YGx
 zMeXWDQPq3ba2v1eoxxao609kkD7J7Xnd9hSAJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QZlPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c56DEtV5
 +4kMAoHRQ3d2MCqw7CEeuVV05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMlGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv12beRwHqgBer+EpWqq9l3u3CSyFYVUjYfR0qFp7qllRSxDoc3x
 0s8v3BGQbIJ3HKsSt7xThipukmutxQXW8dTO+Ai4QTLwa3Riy6bDGUZSj9KaPQ9qdQ7Azct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/HEpIwwlRvJQsxUOai5lMDuGTrwz
 jaJqwAzn7wWy8UM0s2GEUvvhjutot3CSVcz7wCOB2a9tFomPMiiepCi7kXd4bBYNoGFQ1Kdv
 X8C3c+D8OQJCpLLnyuIKAkQIIyUCz++GGW0qTZS81MJrWrFF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:BLOz/K9SA4TSj52X/Yluk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-Talos-CUID: 9a23:FC6Mbm9WimyYJtEs7PmVv0MZMNs3YEHF9n37PhHnK3pqSoKlRWbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A03lqJA/lHOH6FnXkhpMt0myQf9U1xLmVJUEDq5N?=
 =?us-ascii?q?ckMCWJBJ2eCuC1jviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,228,1684814400"; 
   d="scan'208";a="117065135"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nl/jr+W21KIcHlgYxVU1jQNQX1aamXEUfU3GeD2w3d5sEGnz9gnUHuwEYpf+Zli9h3tC4S+fUGY+fyS7Gz+6zjF0K21t1D8CbDc8SMUU6Ec5Gd4EAtZnIUsYOEZAKAPew5lfqKWlYwdguvIDjQZv/Equ2UdH9qaywUvpTu+Wp8vqIH8c0XhuuqyLtIHfPHS+wAmI/r05BPn7F5tnla0VNSukVHZCMgEXMoworFvwup9mogKn8N25e0HLpcNhoPWxWRRKh8DjYuezW+La/qF1xsL9bMjG0+lH0GvTLC6/MQyNeryJaBuv/EAoz3zOIGsxqWdoU0mWMmDoBR5do90hsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmbhP3f0LfUbMTQ/Yf3rDA9ENI6qRthzEso0M42rmeE=;
 b=W5dACPnqxkty0jhXKPzpZsM5XklOjhr5ML7xG45k79n6xbzLDq9YYA1UjOT8xJARu4vvvIgUgTpiBRgm5puZot0GWqU93YYNUZqjQZ+yreN5eJuZBvlT/9bLHHDFxdnNhvRhNPt9GV2DxhsRlInYWzNqVWzVhAdQP1lzrJsRo/1DGbQM53NsO0V314u6IqKqbgK/3UaxaFXNRLYpqSU88FHmQgYmxDrT2i3911MsSThEtrhXS4y0I8RaektxL6SgkzxZDLRCLNyA5gDMJpwdoeVrf9hnAyKv1KOkV45zkUbfrKVYnKBCLsi0DATtPAw+lVVpTFmzlad9Zu0+et9+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmbhP3f0LfUbMTQ/Yf3rDA9ENI6qRthzEso0M42rmeE=;
 b=JFASYuqOUMf22I2Gu5SDxFzBo/LfNyBKV5dlhplhrd8nJ3GuhtKppmQQo563uRvxI1ZDxJzJedlFHZIBHQP60WviTzXTizkiECMxLUURYmMD/M8EqX9hQqi8dE+p4nrO3QcSRSY61oBuCftbEkXYXI9/IHvWhVj7qdvN/LtdkgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 24 Jul 2023 09:59:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZL4vZcZJoIpmM5-D@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local>
 <08ec7e54-1abf-5e1e-e1ee-7026a69e0279@suse.com>
 <ZLk7wh39Cc3GdIuB@MacBook-Air-de-Roger.local>
 <87fs5edve5.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fs5edve5.fsf@epam.com>
X-ClientProxiedBy: LO4P123CA0420.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH0PR03MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 00fd1069-e380-4989-d777-08db8c1bede6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pCuE690pw9ArbSbfyKxA1FKHjixO63EPLmLPBPz1YeWw/vektseDEycHD3slaMVWRxoTbIT68l9TjrRKtkRizYcgUlYdt660n7VcOp8zmGoQlPy8/hFYDF/GEzRtFJ7TTV0FeMxIrwmdPMdjdExppuPJE8UeELXDam5awdHI/hgK1yJxILnAnrLdj6Q9cMKysWomQ4Yn2zo9ISpMw/j6Z7y2854qRjQzewZKMXfhJNLGCokRbZCQ62veG+WcnaO3rfwfEdOZW/Yyf2An6CWRK04aGR29G8Me5fSQ3rrXIKNnbNTI34S9tSQ0FfVHRlLUbcEcc9O3cYRDrFD5eHKiZMMytl74SVH2J/VCo7czSeqoseZ6C84hzxsiytOW130ebvi6sR6z7UNWQsFCIvGOxFOUZ+6ItsHKnamv3K5H1AhWxIa5Yu9CXCfeGkgjvU2xXsa5JhTa4iJ4yGhIFNnYmWkGJ3ymp2amoMEUFqIWKwTQQdkJ2jjj4YNNFsOqKqp22Hu1N1zJboYibzE9fN/IEI2QVzzO9vUA5MACqCPDruSFJkOj6+lbjtI/yraRvRuO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199021)(2906002)(66946007)(66476007)(66556008)(6916009)(6666004)(478600001)(6486002)(6512007)(9686003)(54906003)(83380400001)(86362001)(85182001)(186003)(82960400001)(26005)(53546011)(6506007)(38100700002)(4326008)(41300700001)(8936002)(8676002)(5660300002)(66899021)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFcydUluZ21vSlVTTk9GblE1RFk0NCt6MnJLWllJUTRjYkpoWDA4VzZBaDA5?=
 =?utf-8?B?NFJsL3FLNCsxdnF1WmtwR282dG9QSU5DQXpQUlFRYm0xSXNYb1hBZFcxWEtX?=
 =?utf-8?B?Yk9zSmg4b0ZESXFESkJWejZxcFZEdnkrMVpZS2d5YVhvaUQ0MHpTQmJZSTdH?=
 =?utf-8?B?cFFFQWU3Mk83bjIyRmZFM2ZHZ1NVSGtZbEx1UWMwUlZrdnBySWJzSXJFaXEw?=
 =?utf-8?B?K0h3aFp6dVZOSSt6RzJaUEd0SGJMRnl3V1FmbE83cU5Fa3FPTnpxZFFsWWRO?=
 =?utf-8?B?SWZ6YVhTMmZ5dk81eVQxY3pBaDdGYkFYMGtreSs2TmJDN0tSNmUrOXY1ZEhS?=
 =?utf-8?B?Sm8xU3gydVhZWkFaMXp1M3JZODM1WHFUdFA5UDZYZHpoeUNYYUVoY1hjeFpz?=
 =?utf-8?B?Y2M5QXZEbmd5dmtkMHFyVmlxWjVXQ3Nta0xxMkFTODVwb0p4QjZUdko1eTdq?=
 =?utf-8?B?MnZuSktDVzN0VWpOMCtVMERxQXlWUndXdVA0RVdPTXZHd2xSdld2N3VlK1Uv?=
 =?utf-8?B?ZmF2eUs3Vk9EZ1pPY05QME9zeUhubmZrV3ViajBxcDNpNVNacW1IQVRxa2w3?=
 =?utf-8?B?NUdBM0pqQzJvcE5sbmg3OGhYQ1kyTkxjNFFDRTRyNFRYcVZtVW8wdTVZOFdq?=
 =?utf-8?B?WUZYQXlCdUJvQnZReVJrcmtZN2RNQVJObnFIaFh4bzdEaTBKS1E4WVNkNDFQ?=
 =?utf-8?B?dHBwTWE0NGJhc2tIZnFKMUJYc3N0S1lxblBRbjZrdDRSekVjbFE2TGo1MVJU?=
 =?utf-8?B?bnpQVEdqUFhGLzVqTnNzbVJqdWYrRm1Wd3FVdE1MaEp2cGRWNlRlOTBISUJi?=
 =?utf-8?B?aFN5SUpHVDZKeDJRZDRxeE1SMEkvK3hrWFljOS9DZHlZbENSYzIySG1UMXEx?=
 =?utf-8?B?OG1IL2UwaU9HVlgvMlp4MFJCRjF1bGpvc2RrOWVkaDM2NXEyT0hza0ozM0Y3?=
 =?utf-8?B?ejUxVEZUK0pxZGI5Yml1RVZwUEZGUVBJVkxOVFVCeTAyNWM3YkhwS0NHQ1Ax?=
 =?utf-8?B?cC84STJWUnpsR2hUdTZORkFJWUJFRjhPVlA4TEhXQXE5NnQwalpUemNCb01w?=
 =?utf-8?B?aTVxVDhUbTZiSHZMS3FiZm0rb3RjaUhFbEl4eXpobE5sNVpvSnhIRy9SSDVv?=
 =?utf-8?B?bEV3TmZ5R3pvRERSSU80ejZGMjBBNC9QWldKenozWlpjM2pYK0lNK2t3U1hi?=
 =?utf-8?B?OFczVkpnZ3cwY0JvTWUrYTFLUXBhU29rUTFXdkpyWWhmeFhlTit1TjI0bVlr?=
 =?utf-8?B?WFA1RUl2eUhuWU1Lc2xXbUtyQnYydTBzOEJZaFFiMHg5R2hwSHpraXAveUxx?=
 =?utf-8?B?dlorQnJzRVNCYythMUpqVEhzT2V4VE1udUJxTmttOG5FRlJwR3VLWE82M0hH?=
 =?utf-8?B?NU1rZWw0UG1ld0F5ZTFFazFRemFBUzhIbGl1dFB5WStyWmpmTG1jT0krR2Er?=
 =?utf-8?B?bDRCNnRnek9IZElnM2QyMTQ3YTY5TElRNkZwc0NJUWN1NWxWYytjd3k4NUlI?=
 =?utf-8?B?Q2ZBOUppMkxSeUpEcXNMR3ZQRXgyWFlIMi81dk5wUjk2NlJ2NWNLMExTNGth?=
 =?utf-8?B?TCtsZDg0ZXRORHgzTEkvZjg0aXpaY2NKK0pYeWpnTmxMcmREYWhKMFVTRzI0?=
 =?utf-8?B?cGE3cVZyQTJKL3ZNYUtsQUlGYlczVCtFcFVIMFVrRzRlMDVUcnBDVjV4RGVQ?=
 =?utf-8?B?NjVjdzBHTEdwaCt4K2JodndPUVdrQVFBNXVlMlBtTnYwKzAxc3dsTXl3NTR5?=
 =?utf-8?B?cFk5M2VaNlFYMWttbjF2UGc0WEdVaG9jeHNyd1Y5Mk1tYjQzb1VQeHpJaGRi?=
 =?utf-8?B?N0s3UXd0a3pXUGVWOURwbjFzQThLeDc2SEJIbDFEZHQ3YVFaZ0xSQ29jZEx4?=
 =?utf-8?B?V0xsK1BndG1FZnVRWlViYVQ1TUt1MDREblBKT2VHMjl1eTF5RU0weHVyQzRU?=
 =?utf-8?B?UXpIRitudjBjdTR3Yjg1Y3hyU2NtdEhRNEs0ZWczV3JxU0VubFJ1NzcydFpW?=
 =?utf-8?B?RXRGWkV5MUV4S3BIQktDUVY0dGg1UzdHT3dPNk0zeEgwM3YyOHg4M1hsN0tp?=
 =?utf-8?B?VjhLbmczWE5TNjlRQkF0SE5vVlpLaitTazd3TmxyOGhjSHhvUVJ2UytrcDhI?=
 =?utf-8?Q?2QC3ZLPI2VX29ysoPnx+RbVgi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3YAHKelQwyQ0LKGenTCAZSxPlN45rLp7xOaXyzM3vgqzNXpdCNAnaHztvJ6RZ2omekOQP7HXfpCVfIgLJjMH4MFeml7lHIVnjPoAG8XEkXGaZkxfsaSBpIu/5q87DRlqivVQzSV+APUYZjI5pafJLi0wEPqOw98zPYc2QM+XI6h4f5t4UbAOg+vDKho6EitD187NddCDjren34YirjCrM27FEwDP6Z25ObH4uuIZyD4mZIXHNuxaaM+oGa0fA4P9UG4dAlwMfgTn9+6QNEy3o49S9WwLaIoiijaJHYnBViz5t5dSO7uwGBuske/thfTqTY61rMRaSEsfldaCMJPmugMAxFvF0NhTqMTaSNjPan2V2heJu7Vv8E/he3vrIkIZqNZqQTc5+LVJ6HcTiKLRjwKzkGNsvohGZNX7LBVv6v2WUjJQTrbZkXc9eaYDXilYzrlNgIoF6dmYZnT95Tr2O6fj0H5DmdToiVP1/MeK3J3Z/UMI7ekyG8oCtAajg0LpOSMNMDR4R5RxD7cKk2Fhz6o1fqMYAR/0eVdNsY/oMNxK0MsC7c4UGZglovid7J3xF26SwNDHidYspjxEQaujmg5F1l1CvixoD2btMbtg8sDQLH7xVscSjsA0OMDcj/dsWwufm4CC3RoUXkNlgJQqwg+g5FAoOjBRcs6LN3pP9CRlx52oBxw81f9iRISHeEhEcFWWxVuJHluKWU3CqOTjn5hoc4JiEXHfDoJeeCd6u+UErnUprYjQVg2wNfdIlvBkdC4pWAQ+sgfBbK0MoFz8WYUXT/fL1qnljYNxy019ofXkWCyqVHuS2vwOsWcs5EBpLrEiVD0IhnPfrRA+5e0LlA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fd1069-e380-4989-d777-08db8c1bede6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 07:59:38.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4g+xSA58+MbQpgm/LfQVbOxYzRduCHsBC+WY+meWTBktWTXZLdrftJckT+qv7wkKp5a9ke8zaH/K2gTVVGSnGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6067

On Mon, Jul 24, 2023 at 12:07:48AM +0000, Volodymyr Babchuk wrote:
> 
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Thu, Jul 20, 2023 at 03:27:29PM +0200, Jan Beulich wrote:
> >> On 20.07.2023 13:20, Roger Pau Monné wrote:
> >> > On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
> >> >> @@ -447,8 +476,16 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >> >>  
> >> >>      /*
> >> >>       * Find the PCI dev matching the address, which for hwdom also requires
> >> >> -     * consulting DomXEN.  Passthrough everything that's not trapped.
> >> >> +     * consulting DomXEN. Passthrough everything that's not trapped.
> >> >> +     * If this is hwdom, we need to hold locks for both domain in case if
> >> >> +     * modify_bars is called()
> >> > 
> >> > Typo: the () wants to be at the end of modify_bars().
> >> > 
> >> >>       */
> >> >> +    read_lock(&d->pci_lock);
> >> >> +
> >> >> +    /* dom_xen->pci_lock always should be taken second to prevent deadlock */
> >> >> +    if ( is_hardware_domain(d) )
> >> >> +        read_lock(&dom_xen->pci_lock);
> >> > 
> >> > For modify_bars() we also want the locks to be in write mode (at least
> >> > the hw one), so that the position of the BARs can't be changed while
> >> > modify_bars() is iterating over them.
> >> 
> >> Isn't changing of the BARs happening under the vpci lock?
> >
> > It is.
> >
> >> Or else I guess
> >> I haven't understood the description correctly: My reading so far was
> >> that it is only the presence (allocation status / pointer validity) that
> >> is protected by this new lock.
> >
> > Hm, I see, yes.  I guess it was a previous patch version that also
> > took care of the modify_bars() issue by taking the lock in exclusive
> > mode here.
> >
> > We can always do that later, so forget about that comment (for now).
> 
> Are you sure? I'd rather rework the code to use write lock in the
> modify_bars(). This is why we began all this journey in the first place.

Well, I was just saying that it doesn't need to be done in this same
patch, it can be done as a followup if that's preferred, but one way
or another we need to deal with it.

I'm fine if you want to adjust the commit message and do the change in
this same patch.

Thanks, Roger.

