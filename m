Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EF0729520
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545734.852257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YR5-0002ng-E4; Fri, 09 Jun 2023 09:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545734.852257; Fri, 09 Jun 2023 09:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YR5-0002lP-AU; Fri, 09 Jun 2023 09:29:35 +0000
Received: by outflank-mailman (input) for mailman id 545734;
 Fri, 09 Jun 2023 09:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7YR3-0002lJ-Oe
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:29:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2252ba60-06a8-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 11:29:31 +0200 (CEST)
Received: from mail-sn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2023 05:29:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6071.namprd03.prod.outlook.com (2603:10b6:208:31b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 09:29:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 09:29:24 +0000
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
X-Inumbo-ID: 2252ba60-06a8-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686302971;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LVrOtWmIrdQRh9+NRF3AzWdRjq0ZCo4oveKfWj/nTCE=;
  b=XRmSM8kiLMUEN3A5uayGkqk6MRixoasqKARAztIb8IFiqiQknjAGta5B
   PhEhYF6zfx1haXhOL/bFvhys1Mul46N8vg4vm8H2tFUfb/ilyQ+w0O4Hl
   J+duJbhOsQQKccixcSwZFq+Zv3MF7YH5wzFsIVbckptu0tCUMKPu6YmbV
   w=;
X-IronPort-RemoteIP: 104.47.57.40
X-IronPort-MID: 114704520
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dw8OLKpy+/XIpW1tKB40mBi6ODNeBmK6ZBIvgKrLsJaIsI4StFCzt
 garIBmBOvyJM2D9Ld9wYYyzp0IAscKByd8wQQdo+30zFXsSpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weAzylNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAHMCU0i/mdnt+fHhGsl9lsIjDe7nHqpK7xmMzRmBZRonabbqZv2QoOR+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeerbIK9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThqqEy3ADJngT/DjUueUnh/tWYjneSWoscI
 QtJ9g4Pn64boRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAfTjdebvQvssYtWTUxk
 F6O9/v1HTFmqqaST1qH/6+Iqim/PycUK2IPfy4CQk0O5NyLiIMuihPCSP5zHajzicf6cRnr2
 CyDpiU6g7QVjOYI2r+98FSBhCijzrDWSiYl6wORWXiqhitiZIe6YYWu4EPH5O1BK66DR0Gdu
 2IJncef6u0DF5CLm2qGR+BlNKGk4bOJPSPRhXZrHoI97HK99ni7Z4dS7TpiYkBzPa45lSTBZ
 UbSvUZK4sZVNX7yN6tvOdrtU4It0LTqEsnjWrbMdN1Sb5NtdQiBuiZzeUqX2GOrm08p+U0iB
 aqmnQ+XJS5yIcxaIPCeHY/xDZdDKvgC+F7u
IronPort-HdrOrdr: A9a23:olwkJa9pj+fTucMQE+Juk+D+I+orL9Y04lQ7vn2ZHyYlCPBws/
 re5cjzsiWE7gr5OUtQ/uxoXZPrfZqyz+8X3WB8B9eftWrdyQ+VxeNZnOnfKmbbalXDH4dmvM
 8KT0EUMqyUMbEVt6fHyTj9O8o8xsKK6aW57N2utEuFjjsHV0ij1WpE48qgfXGejTMpOaYE
X-Talos-CUID: 9a23:mp2y3G2PTT9EdZhkPDevb7xfWc8YKkHD9yzpYBXoKXd5Tr20blOy0fYx
X-Talos-MUID: 9a23:vCJnagRNdNcV3cegRXTUqCM4a+tJ552CCRlOm9Jbt+2lBypZbmI=
X-IronPort-AV: E=Sophos;i="6.00,228,1681185600"; 
   d="scan'208";a="114704520"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPGRBSJfUTKmCSe7PHGpw2RQscVe1eq+wA1rC6SVuX81PrPnIGeHptqvAiwUn9lVjsuXB3LqWbXiSYebPN7LPWbEzcnmFBTndIZQHW8yrxvPTGeVqUMeyBtKN3V4zg/T9WUplU5pIdj+rDXJ8hKMwPOnfRwGmMXo37SOLF9CqrsQGotkWALRseW5W9pDIrTzHS9XDqmWpgEbpb9Gp3fusuJbjyxXeRAjHzLLslGDwVKQ8eICvmRHtaG6GaWnYWEoUGyEVYnvGNLTihGXx5VDModt8p9jM/KEw9nBH+/Anqlpy9Z+geMazi9kJO96vGQoeTMYaiUczW+jB9phMaPjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVrOtWmIrdQRh9+NRF3AzWdRjq0ZCo4oveKfWj/nTCE=;
 b=KalBKwtNU1Pf/RQnwFi7UEdsM2PiX1C8qTOnmhiE7J4wxHggN65dbpTt4q1k8xSOMV0DQX7SrMpTXy4TeswEYMqh88V+pqdF/0tLMmjKErgjgkF1ZtgzbJXbfExwepxX93noRoaHY1jWXq3cLIganPD+t0Y+yGmXuKsQBO4r5/mSEEnTIZoUvOIoTektS1Vsfw9AHCde1moK9cSV8C0Q+FipSoBW+V0O9/PUC9xrtjiFSH/rqBViZw+U6RXaHpOF7wOMN6SnNYOxfNFZSCqjruw+xCQ2TRENe4xZDjsyiFqc+mGUYaG+pa9uB18FykCWHenbX7yO4D0YEMxrAOnsLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVrOtWmIrdQRh9+NRF3AzWdRjq0ZCo4oveKfWj/nTCE=;
 b=euXmfmeoak5GpVCJ7TjA1XdEnlL05UlHuT5UA8mMJji+JoBOaYKPQ85M4cfOFHPJAwOgM5XZTxuQjGHoD322A/Y2pF7WOLMfDwW/pkQ4VsoitmtBK5M+oe6ziJxGZGMVeQwN7yu41Qyp7iLGFdoDjBD6dzhd9KbE6fyHWdZd0PQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
Date: Fri, 9 Jun 2023 10:29:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Shawn Anastasio <shawn@anastas.io>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Shawn Anastasio
 <shawnanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
In-Reply-To: <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0329.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d2881e-1b89-4671-ba4b-08db68cc0365
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lSNxbAEFHwwEPWHdSR/9nkjRr7JyZOqnaRrXsZee0yGz03JIa4bRRqRdnCTREK2xQhsEN3+70ApVN2PTB6RkYIvJ9ioURCrG3NJ8LxlNsZFj6lPscFzXi+HynK4Zz93rFgJzbDY/n9rmMFiHS8WWLsMGCkX5R8o28Izr7R3udASYFoCXLm+C7Zvz13zsTwcNGE5MA7smWBFrH3eg0eBoR5J4guaAa0DTfkI2e20d45Ja5JR5JztGE+3bvGKT9G3wGFE1ge2sSe6bfdTN3NUSxMBSLRwWp2LV3osrQj0KeGj/uz8B3tcnr1llcZypFAkDyN6sBOzUEYavFiNFZ4EZ6jPSjpRE+4Wd5nH+Ao1nfI35MOyS48BnSKmSiSrO1LbRIEy1H+xe8/c7GFlR9F5bDXsMQM0lgihABY7ijcda6mZYgVXdd9oCDJ7gwXC3dDZOPmRZSii2PSH6IRtWScH1ClGff2aW9+F0WAWgUKtUSFOxXqMU7NyJLTKiR+GcI1MXzRLbCbE57wngF3rCct7tZbtqhqmKrAGGIcTGmFVSrwzMtDMzuU+doAqayk88ZgoTZGLHbvJAMLwOfHMkvWwGEqTOEvraQxsfoaM711tDtK009kQYYp8RhJjCK/ty/fpz8jdz7QlUGZe/WBwD4OIl0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199021)(86362001)(110136005)(82960400001)(8676002)(8936002)(478600001)(38100700002)(66556008)(316002)(5660300002)(31696002)(66476007)(4326008)(66946007)(41300700001)(6666004)(2906002)(4744005)(6486002)(36756003)(54906003)(6512007)(53546011)(186003)(26005)(6506007)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1p6azdLbWZDa2d0VTNxVDZxbTRPZjdwUDJHSlpEdHJzMG83Q0ZmK2wyUFM5?=
 =?utf-8?B?U3gvdWcrdGpVSU9QdWtvVlVEa09pLzhrSFh1Zk8vSEh4MjB0ZkxQdG9yaWhL?=
 =?utf-8?B?ZzM1L2RQSmQ4a3JyWVEzK2FCaGNhNTFiUThST0lEbGhUVmNXV1FxWG4zZkRF?=
 =?utf-8?B?ZmczOURIbFRKUVQxYURQcFNVSkNMOGVETWFzYWpJRklIbitqaEhxQ0pzWG5P?=
 =?utf-8?B?RXFRVUNsSktkQnZKOC91dGM4NlF2R3A5K28zQit4K0VMZ2dVdkdmY3Z3dmg5?=
 =?utf-8?B?eXhkTTF1eGE1ZFQxNWF4Q09vL2xGaFdQYkZ2TGhQckI4UVUzVmdUYjhBNUwv?=
 =?utf-8?B?WEhOQ0lWVDIzOVR0WXNVQWZZL21Ec0dvQXEzUzZNam5zLzJRb1FCYWxCOUFp?=
 =?utf-8?B?c0duaGQ5VWpIZlRWOERrZnhhWlJqWkZIc0hUUlRXdUQ4MGFlQTdERDJtUnBl?=
 =?utf-8?B?T1JkRW5zbzRSNHcyY1F1T3RkamtSdVA3ZjlKSEdMVTFtZktjZTVIcC9YbXVn?=
 =?utf-8?B?djNTQ0V2SS9tUE5iUjRkOVl5emNNc0xFYWxFc0ZQNXQrWTFNVUhPTE50SVZL?=
 =?utf-8?B?NjB2QzFPaDdCNy93dHdidzA2dENFTFJsTkEycHVwKzdTYjZJZ1IrR0VYQnlG?=
 =?utf-8?B?dlNpWEo0dzRabnpIaldsK3cxeWVCRkNlZEdkOHd0YTNOMjM4ZVp2WG1MQ25q?=
 =?utf-8?B?NGdWc1QvNEpMQjRMNm40eVNyTWRCUjNSNGxqUGt6VThpNHJGeW9pRjArN1E4?=
 =?utf-8?B?b21jWUpyQks0VU4vZDF3U0xEVEdIbVdMUnRFdzhDKzJlVFBrVS9rQVdxVWZk?=
 =?utf-8?B?WXlUa3JEQ3kxZi9KTFBEUHhSVCtxSlRlNVhPQ0pDUk01c0hYOHRWN3VnVU1M?=
 =?utf-8?B?TkllbHRYSzNmaDd4bFUydHA0TXFDWExTVEwwSE5xT0VmbVE0OEpZcXYraXp2?=
 =?utf-8?B?SGx4QXpmVXB2cFdNVTB0Z0hMRm81RkFPT3NNQ284RHBJaStQZkVnOE1MUmNV?=
 =?utf-8?B?UGJOTTdXTXNhMTVlbWhYT1hGRHNjNjdQNVFTRllCaldJNnIydVpneFNDbmRr?=
 =?utf-8?B?UVR5SWlFZ2tqZkVQUUJTUW9FQVV0cy8ybEswekx2dTlNUXp4eWZPY2g4amZK?=
 =?utf-8?B?cThMdVZxTTVXK1FMZ2Z5RmM3dVBuN0xYUi9EeVFUeTcxa0gzTlBWekdVa0d5?=
 =?utf-8?B?TVZYVVpPTzlwQ08ySWllcXpCY1FKMGxWWVJSc0N1OE1PR3oyVi9OTnZ3ZGtE?=
 =?utf-8?B?c1ZYWDJETnJFaVU3S1EyRDNjQnZ0eTFMTG1CYWN0SUNtQmJzdlhFc1kyL2NY?=
 =?utf-8?B?QVhMNkRyTHpSak1MN2xKRjdyNEhIdTcxY3ZNNW1QWDBJODNSUUc2TFRQRzFv?=
 =?utf-8?B?VE9QTEY3TmFrVFh2VkRWck5VZXRTSUZEMlhFSmtuY3c2cjVFcFg2cXdzUHdQ?=
 =?utf-8?B?VHBEcjdrbnZvWTRvYjlCcWg3YXBOTjltc1AwR2xIdm1lSzBOYkM1YlRZMkFz?=
 =?utf-8?B?eU1VaXRrTlN5VjltdmZxbXpnQU1sRklxVnN1QWJuSXk5cUxxckU5TDBnZmRN?=
 =?utf-8?B?WDRaT1paWEM0ZE1Lck12Z2pOQ1lYcVJsS0ltS1Zid1ZVRUFFb0RiM3Zld29E?=
 =?utf-8?B?Yk4wR1RQK3JpVVBEUzUwOW5vYVQzd1dmRUVSQk91ZkRkQkRoaEkvdUNWVDZq?=
 =?utf-8?B?NGNJV0xDKytGUFJtZkRSRGFwekxCd3N2anJISGI5V2JDL00yNkNqb01GNkdr?=
 =?utf-8?B?WW9ZNjhPTkVjWXdoNGo0ZSsxUC9YamNQTlU5bzRsbmxvajFTK0xpYVEyT2Ry?=
 =?utf-8?B?dUM5Qmp6a2JTcHRlVlNsZnBGK2UyMmdObGJ3M1ljQVZHMDcxSXpPK25HaTdy?=
 =?utf-8?B?enlZYkRFZnBsSStBbjFESXBTSUZqeHpSckpjY2lRZlNGK2xVeHlCS0NDdjh3?=
 =?utf-8?B?TlRMc1QxenBGQTBKOGJldS9lbzZ3amF6WnNJWUtkajZ0RUpZdUw2UnRXMHpT?=
 =?utf-8?B?alUyRk84UHpjWXFuYUtMaVoxaXhnT1N6Rk5GS0R5Nm9RZGI1QXhoT1I3dWN0?=
 =?utf-8?B?bUVkOXNJQjF3bGZ0eXJObXE1YVVOaTgvK094NUZzczhPYysza3ZNVHZQTnhD?=
 =?utf-8?B?dG40UjZBUW9IVnFyT3c2dXdRaE5DRkswVml5Z3pHRll6QlRWa0lWMXIwc2k2?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?TmlTbVc5eWtpSElEc3BqV2FpZ0dTL0tGWWVxR2lUZGJha0d0U0JsSEFzYko5?=
 =?utf-8?B?eEtZbnFsU2tGQXpjb2dQbnhtM0t3SERXU2hHVE16QkZNZU9rZzBLY0srdUd4?=
 =?utf-8?B?MUwzSldUb3g2MzEzZCswU2xQbFNLQWxiUTJXb2VKSmpMVzRLUkNlb2Jtam03?=
 =?utf-8?B?dWpKdVh2dE1CeTRXemo3c3RMbnZlNGdDdll5aDlhVUlSanJJU3F3eExSaEsr?=
 =?utf-8?B?enJCZ254WnJzbzJWRit4dDFiVEpCNjlqTzFoRlBDTTJWOVI4UzgzaVpSczFz?=
 =?utf-8?B?QzUrbkhnQ0R0ODNyUTV6ekxtQkErL0czdnd2TXB4djhGR0xXRStKUWtqZ2o4?=
 =?utf-8?B?YzJHck9wby83Rm1JSFpBaXQ0b0RLRS9IUHlWVFltRlNRMmpIdVd2VWZDQjJH?=
 =?utf-8?B?Z2liSm1PeklURjVRM0tnVzQ3RlJxNzdhaS9RR1VvZlR4NUJ2cGY4bm9mN21M?=
 =?utf-8?B?QnNiTjc3VHFLd2pTaWtWbjk2VncwZ3VzMWVndDRxS2p6LytleUpCYi9yUlJL?=
 =?utf-8?B?NmkzTGpRbklxNm1LMWdpdWdscURDYlBYREZwMjNVSHQ5MUsrWkhIQjE4ejRK?=
 =?utf-8?B?bGZ5aDRrSHdLSjlxdTlGZGdPZlFZeElaL0ZQTFhtTUMyVHZHNU9VbGV2clYr?=
 =?utf-8?B?VFVwZGlXMGRVM3ZWSXJhUTNSQ2NobFc2VGQxQjRkRWZhTWZSV01xcVVnQkhk?=
 =?utf-8?B?UWVlUmtXVDFQVmJDZjFHaE1SNHRGdkhCT3ArbVNxUDM4L3lYUjJJQ0F0am5S?=
 =?utf-8?B?QUYyaFlCRTRMVUJsT3N6cUNwMTV1aWNpRm9Fdlp5dFlxcjdCazdiOFNYeDNE?=
 =?utf-8?B?VjFIRGUyUlhxRkJmK2RTK2UzTGhoZlphdGFHS2pZRXkvS1ppTlVBN3Y2SE9m?=
 =?utf-8?B?bGRkc2lveWcxWDNvZlIyR25HVzNnelBKQjJDWTRRL2NiczFSZlk3NjdJMGNT?=
 =?utf-8?B?UTVQMUY4MDVqb2JqaUZPTkFiT2NUU09jby9pOGpGdXJRKzVrM05rUVF0Rm5m?=
 =?utf-8?B?aFhZZS9lZnRCckwzang3ZUFoNlJzNEZNQWd6N1FkSWhNcTQ3ZTRBYnRNdUNa?=
 =?utf-8?B?Mk8vM2NyMWRTVEZBbHFibzlrVWU2R3JQeXp2NDB0anlySU8wcGxSL050bDR4?=
 =?utf-8?B?RUwyMSthYll4VEZvMHplUldpTjFoeCtnaDJMZ0Q4dXUyeklwU3F0Zmo4N0xP?=
 =?utf-8?B?bUwrWE9TUmdSQW9PTU9FYU1YanU0NDlBbXZubTV2c0xKWWNaT0FDTzQ4UTB1?=
 =?utf-8?Q?Q3Tl2VcsXgtsgt/?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d2881e-1b89-4671-ba4b-08db68cc0365
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:29:24.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqr5QLXTxg1dPLcltsiOGELrn7evPUPkEt1R5QhYhYNxxSR//TswpJ8oBt3HSCSA1jauj6SmKWrLF4CBfZwauQ/VTkuNqoAiR59kU3H9O/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6071

On 09/06/2023 10:22 am, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/arch/ppc/boot_of.c
>> @@ -0,0 +1,122 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> By default we mean to use ...
>
>> --- /dev/null
>> +++ b/xen/arch/ppc/early_printk.c
>> @@ -0,0 +1,36 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
> ... the more modern form of this (GPL-2.0-only). Anything deviating from
> that may want justifying in the description.

GPL-2.0-or-later is fine.

It's only the un-qualified GPL-2.0 form which is deprecated, and should
be replaced with an -or-later or -only suffix, as chosen by the
copyright holder.

~Andrew

