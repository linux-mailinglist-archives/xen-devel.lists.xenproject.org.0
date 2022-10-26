Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0C260DE8B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 12:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430413.682081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondFl-0001xn-5d; Wed, 26 Oct 2022 10:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430413.682081; Wed, 26 Oct 2022 10:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondFl-0001uW-2m; Wed, 26 Oct 2022 10:03:17 +0000
Received: by outflank-mailman (input) for mailman id 430413;
 Wed, 26 Oct 2022 10:03:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Ky=23=citrix.com=prvs=291e24488=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ondFj-0001uM-8p
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 10:03:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6635ab20-5515-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 12:03:13 +0200 (CEST)
Received: from mail-bn1nam07lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2022 06:03:04 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BLAPR03MB5601.namprd03.prod.outlook.com (2603:10b6:208:293::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Wed, 26 Oct
 2022 10:03:01 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 10:03:01 +0000
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
X-Inumbo-ID: 6635ab20-5515-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666778593;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/dj6E1IkQaulSHiJdixEbL20AVQX8WLqeXxmCXjZJ30=;
  b=ddP6rD7IaMCXKaK/RNxsxi+izl44y2J2Z7Xx9DZrgjHTyeltWfQHikGo
   qiH3/hTAtctwqlElGYCsHu+uEI8idzd4Q29CG4OwfJvCFWecfGpGoOG9w
   2oZs/FB1tjiUFJC7ebtBSUImtfCR9vvxZ/UgBzY1dxWdSjfe7cFRWJ4Vn
   A=;
X-IronPort-RemoteIP: 104.47.51.45
X-IronPort-MID: 86060185
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4hlfVa7atqKQ+d7jEhEmdwxRtK3GchMFZxGqfqrLsTDasY5as4F+v
 jNJCzvTOa2OMWHweo9/bYSwoRwFsZ+AzIdiTAM4qyBmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5gZgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4vX1oe7
 fETFApXRRaKnbzt24ixRvBV05FLwMnDZOvzu1lG5BSBV7MMZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dupTSOpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toiz02LeWzX6TtIQ6Lo285994rHSo5W03CgUOfn+Hu9KdlRvrMz5YA
 wlOksY0loAu/UmiVZ/+GRm1pnGVsxo0VN9ZEul84waIooLI6gOQHS4AQzhOedEinM4wWTEuk
 FSOmrvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKksijrfQ9AlF7S65vX3Fiv32
 CuitzUlivMYistj/6ex8E3DgjmsjoPUVQNz7QLSNkqn8wU/Yoembo6p7FHz7PBcIYLfRV6E1
 FAHltaf6qYSDJiLvC2LXOgJWrqu4p643Cb0hFduG9wr8W2r8nv7IoRIumkieQFuL9oOfiLvb
 AnLowRN6ZRPPXysK6hqf4a2DMdsxq/lfTj4as3pghN1SsAZXGe6EOtGPCZ8A0iFfJAQrJwC
IronPort-HdrOrdr: A9a23:6/REFqvffkqPwJ8qii//Nc8O7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.95,214,1661832000"; 
   d="scan'208";a="86060185"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EN4H5J9s84e+/aKihC1k7EB9DcRyk0T4OtQGQ9zOoVp5F1vJ5rbhaxMgbJ6DlTGykGN1NbIXkP7l4EokFKKSg2HSV8Sjpd0mXysjOLFLIw7tg7kr4kkKUzPdnAIoLY6JTzabo0YwNGLHKEtNJC2zBt1SeNmPI2CPvNIiI1C194f7Ia/3bOLbNltYKfJn1lkOU6TNVzNmOQ4xuh1Xr4Xg/azodXkDnF7k9KMxyHg7EW51WI/GOIAPbykvLaOOnCbjFjWNjOmkrFY2RcLAkBkbJs7rmDSS0zhBFLFl9v2el+sQxBTNQs/WDk3mc7bsoqoHRehuBcjbmmxj3sOBcswY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arextXejh538XjVgOLGFjhVzAL5duyki9VJ4w6Ki4wc=;
 b=KPYYJf4fr5tve2QxJ/p5Zk2DI2RBtqYMm/gDtAIH78v+YnJxD8X7sxXQxYvT1p0mpZ4QmmxOUUwLTOeH8YwFbDeq5GF1o2Jpqxf87qV/Cyy3wpW1bf8wGDYsweaDcu/FtZZPkaY7fdzT4wlXkaaEGuL937bkevCxODPy5QCDgifCWCTdR8hCNX5lojmQ1dR4gVfuRXJ0U0RzdWoXBuiviE307lbdKWLbCM5/ZCeCiqV5pk9kOO05ntNry6mFfzbvcSz16R3Nw5/SX1tWIE3pUSSTAwUS8krYdtk2HVWSdifxEapXr60HJUBzsPEelIaYa2hXBcSe11lCS3SBYazPvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arextXejh538XjVgOLGFjhVzAL5duyki9VJ4w6Ki4wc=;
 b=LaxxiPTh92neJSHAHl0mhiQmapN28pujILYW6oTCy9azgaJ6ntMEihXaq/YB6TOEdzSJvzgw4w/4N9i36cLcmREVdZVx10tNQWodAeBW1Og8g6ynMfCMajoC3LBiMMW4yuEoZT23ifDT/YLmXaQUr8b3cx6DBwGngLCPwwF5Mfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 26 Oct 2022 12:02:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH] xen/x86: Make XEN_DOMCTL_get_vcpu_msrs more configurable
Message-ID: <Y1kFzqJStb/oCKg0@Air-de-Roger>
References: <854cdedcdd2bfff08ea45a3c13367c610d710aaf.1666630317.git.tamas.lengyel@intel.com>
 <Y1eamiBY0d+julWk@Air-de-Roger>
 <CABfawhk=Awfxu6iBpBtpNF_qKsEW3tMMG4EJzH3okZzdyyESxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhk=Awfxu6iBpBtpNF_qKsEW3tMMG4EJzH3okZzdyyESxg@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BLAPR03MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b693ee7-0fa7-4137-95f3-08dab73943ac
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KsnpyipvpDAOinocGXoaIyUQeW7meQI4p8bILf3QIqCCVSBYtvvTpMBV+NZ3hxPR1eGg0BXR1s0xROyGGZZKKoK0vnDilB90H76ALgJ9WodPcn0kcmuzCgAFjYWycNAuNcbJhF+Xblab9M291ev7f6cpTmHwKDPutEhRduHZMBFGogHYTPkDWOWgkjckmXzpvkP7//sbxL84UpxYt9L/4EiNAzUxjxs3W2Gj2I1Hx6QIBpnbYoZZv69LndztWv+FQ4PAonwB4+INxtbWj19leDUa8pLK1nGVRrT+8lQfgsUL2NdKH3YYKznpTcuSuJ4rFVV91jpaasxY8p8gc4FuV+d82lPbtEHq2H1DrX/gkRXO3y/DUliaA5zp/iU8YMVtplNmffFB3mOFLD1A8i2aJc/XgZPVWLOK/3BpgPCJjedvsCzN5V2bLlmATpTN/mLKAi/Rb+OpD4SzWw9hd77MwQ4TWGxaqrtHnbaKcwcJAsGmNM5ajRlXo79Eyscaz646RAhDlu5nxQrJ1FFUitLPEwO+PzR6Vzb/QjO8uWP0t0QsRUXiGEA1Eq5uHXkUOf5p2xOI0x4xQ1czsNCqCoET9M8FBMyiH8J2BcJ3vdLIlNdOJcpfwhUlqzrTV5Z0VBZSRpz3xgA+aKucJ0et184i7YkVsImuHxVDpMN8nxRlTuV09TaaJ1RCNMJW9b3seqQdyRDIZ9S7bpZTMMCTY91VxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199015)(85182001)(6916009)(54906003)(8676002)(2906002)(5660300002)(186003)(8936002)(86362001)(4326008)(26005)(41300700001)(66476007)(66946007)(66556008)(6512007)(316002)(53546011)(9686003)(6506007)(82960400001)(33716001)(38100700002)(83380400001)(6666004)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGxCNmVpRVM2U1Q2Sm50dlZ2OG5MS1BIUHdhU2tGMk9zajFjcFFJamxSbTNT?=
 =?utf-8?B?cDJHcWRrOEFKNjd0MGlLQWhzZklVNlA5VTdjTVd6aFBKaXI3V0tjUzJ2N29Z?=
 =?utf-8?B?bGg5TDJOT0dLeC9VWm5CWjZJZVh3ZEoyL0txR0l4bFdJazlNU2NhNWszeXdI?=
 =?utf-8?B?aGtsbjlDNjh4R2hZTWtBR1ovUm1IbjFQV1hTaHZ2V3lod3I0WHNsMW1IN01N?=
 =?utf-8?B?cFMwcloxM0NZSEpPek9rRUNXb0pFWTNHTVJmUE9JV2k2L0d3SlpuMDV1Zmpq?=
 =?utf-8?B?bVVtZjJ3SWtOaElmOG0rb2tCZDVpNURyVGtOengwNG1KYnlJOUxqWThQRy85?=
 =?utf-8?B?SGVVSERxU0VKRnczR29QWUFYd1VMUm0zRGtxSTd1dU9PVTJPVXdiNE5WNElP?=
 =?utf-8?B?aEVUL2MrNnpGUkJldU9yNHJCSXpvYkZQNVNzOGJLb3E1Vll0WDNjdlhGSlpm?=
 =?utf-8?B?bEt6WEUzN0QwRmRGM2Q4WWhkOGJTczVpVDVWTm8yWTZrVWxMN2Z2ZGNHNDBr?=
 =?utf-8?B?MVg5bVhvcDVFT3NJd2grS3FEYVpaOU1DdDZrQUIzYk9rWWsxK1JzcTRJTWty?=
 =?utf-8?B?cGpXRTZqWlcyeFBmVEFhTWlmcHN2Z0c1SlRJZVEvUENYNTBEOFNya0dIbXNr?=
 =?utf-8?B?RFM3TVNEVGpvQ1I2NWpURHlDK0l4b000TVArTk9Hc1dFYnJSYVE0WXZuWHcx?=
 =?utf-8?B?MjVOb1BaMHRreFFDakh1bElCTjQrUmNFZlZEWnRTT1lybEFVbWxVaVRacUl5?=
 =?utf-8?B?YjFEOVg1NmtQMUtlZmpXYkNvWFY1TERpWW5ib3B4WWROS2lHL2VkTnBIVXc0?=
 =?utf-8?B?NjNtRmd0ZEdqa0pEWDJ4SWVHaEJIZkczL01rQWpqRUdOUmxCKzVTSlk0MkF3?=
 =?utf-8?B?dDcyanM5SzduYndoNlFTOHVRRHpwbGErbTVuZEJFalpuZWpCZHllWEx5WHJL?=
 =?utf-8?B?V280SnFEckdYUzFTbytScjFmRFYvLzhhK0lGN0FLMzRDOTdraXdoQ3FxTHJI?=
 =?utf-8?B?dDdEQklUSk52MWZIWlVVcHZoTHZZTVE3ZlBhaUk1bk1EY21TakNCSG9XSXFN?=
 =?utf-8?B?REpyTmhIVVZlenUvZHNYTUdWbDVlQUFHR3gxVC9SMCtEd3phZkp0T3VLQVNU?=
 =?utf-8?B?UjRkd0J6akM2c3h5RTFkMyt4bG9jRDRoOXVBR3BkTlhMc0VNUG90NHlVT1l3?=
 =?utf-8?B?ZHlYUGkzMyszSTJFZ084MHNqekhBTDZZMEhITUlkQUdQdExJNkpiME8yZUY4?=
 =?utf-8?B?dGRXSzVVU2srYVhKQi9rQWRWUkc0L3l2a28wT2NYc1l0V1pLQVRwZnZYYndP?=
 =?utf-8?B?MHlLaDQyaWJTblcyZDQ1cGJoaWwzU3FEMWxjQUNFdStQeCtXc1ZDaVp0YW94?=
 =?utf-8?B?ZzJLeWxlZ0c3c3pJUnl2NVVvQnAzNUFyMFFzZVFxNzNYenVRVWFYc1pWV0hp?=
 =?utf-8?B?R2dVVXJtY05MMGJKUFF0ZGFzMWVnRklkVkkxZFAxamNRNEZCQ1IvSDdTWnB3?=
 =?utf-8?B?eW9Xb1F2T0ZYSlJOS242NjFJaVdFRE5lOHRrK0NhMlhkZU5tS1pZbXZIejUz?=
 =?utf-8?B?RjJoY2hEbUxRU1prcDVBVFZJTTdsTzlZNVVMK1hSaCtGTHZocGxMdGJFWEFB?=
 =?utf-8?B?eU1nUTJZbFo2UFRMU0xuS21TdExrSGxJaFd2dTlXUDNXa2lpcCt1UUZzMTBv?=
 =?utf-8?B?aVJVMTJNekxZTnd6S3hmK1ZadVgvb21lM2VoVXRoNEdPZ1RVYlZDc3MrbGFl?=
 =?utf-8?B?N3hlL2N1UzFTS2w5TWtDRTBzcDkybk54RDVYZk5kcUFoUWRnTXhSMzhWR3Ev?=
 =?utf-8?B?TWlLelc1QUdOZGdJRUJyVDNrd3drM2Z5WTBGWkVFNTlrUisyTjNpcW9uWTR1?=
 =?utf-8?B?Tk1XQ3VTdTAxdmRQZFRQVGVjVmRVSVVNRFlPMEo3MTFMcXAzWFVrUFFKVXBm?=
 =?utf-8?B?cC9lODkvQ2ZYQ2c4NU1rbVducU9Ca0J2REFodlpkS1gyZVlVREZJN3ZGeGYw?=
 =?utf-8?B?RXE0MlZXUHJtd080b3NyVVR0ZUx1a3hpQU84aWdzVnVRcHo5VEt0S0p2RVpO?=
 =?utf-8?B?bDZHV01ZQjVNOG1RSnE4YzNCUG1qZjhBQkVHNkVzYTNaMHB5SnhORUJrSVdn?=
 =?utf-8?Q?TJmI/g0djoSbmcNhILTiIWfXS?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b693ee7-0fa7-4137-95f3-08dab73943ac
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 10:03:01.2903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +N87I10YQ3zHzDEAXMxkSTJwFwj5THbEtLzjqM68FCdy3WyONVHQPcRdL4ex0jVJ+GRpSDWZUuTsUS1K3vgjCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5601

On Tue, Oct 25, 2022 at 01:48:36PM -0400, Tamas K Lengyel wrote:
> On Tue, Oct 25, 2022 at 4:13 AM Roger Pau Monné <roger.pau@citrix.com>
> wrote:
> >
> > On Mon, Oct 24, 2022 at 12:58:54PM -0400, Tamas K Lengyel wrote:
> > > Currently the XEN_DOMCTL_get_vcpu_msrs is only capable of gathering a
> handful
> > > of predetermined vcpu MSRs. In our use-case gathering the vPMU MSRs by
> an
> > > external privileged tool is necessary, thus we extend the domctl to
> allow for
> > > querying for any guest MSRs. To remain compatible with the existing
> setup if
> > > no specific MSR is requested via the domctl the default list is
> returned.
> >
> > I'm afraid I would benefit from some extra description about why you
> > need to introduce a separate hook instead of using the existing
> > do_rdmsr hook in arch_vpmu_ops (which is already hooked into
> > guest_rdmsr()).
> >
> > Are the MSRs you are trying to fetch not accessible for the guest
> > itself to read?
> 
> No, the reason we need this different hook is because do_rdmsr assumes the
> guest is reading the MSRs that are currently loaded. For external tools
> where v != current the vpmu context needs to be saved by pausing the vcpu
> first and then the MSR content returned from the saved context.

Hm, I see.

We need to dump the CPU MSR contents into the structure so they can be
read from a different pCPU differently than the currently running one.

It would be nice if this could all be somehow wired into
guest_rdmsr(), but the function executing a vcpu_pause() as part of
it's operations would be quite weird, also it having a vcpu parameter
is kind of misleading, as under some circumstances it will perform a
rdmsr and that's likely only correct when v == current.

I guess I will ask for others opinion, but having that specific vPMU
function call in XEN_DOMCTL_get_vcpu_msrs on the side of guest_rdmsr()
seems like a layering violation, as it should all be contained in
guest_rdmsr().

Thanks, Roger.

