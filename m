Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5F56F05E5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 14:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526992.819104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0qV-0005xT-5I; Thu, 27 Apr 2023 12:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526992.819104; Thu, 27 Apr 2023 12:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0qV-0005vh-2M; Thu, 27 Apr 2023 12:35:35 +0000
Received: by outflank-mailman (input) for mailman id 526992;
 Thu, 27 Apr 2023 12:35:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81si=AS=citrix.com=prvs=47455b11e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ps0qS-0005vb-MI
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 12:35:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdcdcf69-e4f7-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 14:35:30 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 08:35:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5242.namprd03.prod.outlook.com (2603:10b6:5:22a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 12:35:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 12:35:24 +0000
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
X-Inumbo-ID: fdcdcf69-e4f7-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682598930;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QuOt3UBLtwCO3EbJMvyvX7eSt9bdu+ciYPzQQLgFNbc=;
  b=Z6snwhVtm7YmrsD1Vk/Hm9ArlsiKCatWIUbC1mDAo/7rZ6fKIKhq/c0U
   c3XWbOtDXBBZ/QO2elv89qiNCjWxrf4JWZDTUVMZkSIlDPDiMzyb9J6MK
   EzeLHbYh6xwZHdtf8EVqoSRd8lnnO1egeqdBa1h9PqwcDk5LPsN64gQEK
   M=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 107479148
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YQWWWqKMD/r9DRfAFE+RBJQlxSXFcZb7ZxGr2PjKsXjdYENS0WAGm
 jEcDWzVb/bbMWT0c9ByYYnj80wBuZCAy9VhGQVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gZhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5TXzx25
 flJMAoObzfbmbKHwrS9EfdF05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGNnWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHukBN1DTeHonhJsqAWY4WVPNDc8bgT4jqKEpGvkANwYD
 nVBr0LCqoB3riRHVOLVVhm1oneCsgQbHcRZF+k36galwa7T/grfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaETcRBX8PY2kDVwRty8XipakjgxSJScxseIa3gcfyAirY2
 C2RoW41gLB7sCIQ/6Cy/FSCjzfyoJHMF1cx/l+OADPj6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQcH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:1lVBrqHnvT+x638tpLqF9ZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6Km90dq7MBThHPlOkPQs1NaZLXPbUQ6TQL2KgrGSoAEIdxeOk9K1kJ
 0QCJSWa+eAc2SS7/yb3ODQKb9Jrri6GeKT9J/jJh9WPH5XgspbnmNE42igYytLrUV9dPgE/M
 323Ls6m9PsQwVeUiz9bUN1LdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y1zwoTSDRGxJYl6C
 zgnxbi7quunvmnwluEvlWjo6h+qZ/E8J9uFcaMgs8aJnHFjRupXp1oX/mvrS04u+am7XctiZ
 3prw07N8p+xnvNdiWeoAfr2SPnzDEygkWShGOwsD/Gm4jUVTg6A81OicZwdQbY0VMpuJVZ3L
 hQ12yUmpJLBVeY9R6NreTgZlVPrA6ZsHAimekcgzh2VpYfUqZYqcg68FlOGJkNMSrm4MQMEf
 VoDuvb+PFKGGnqJEzxjy1K+piBT34zFhCJTgwrvdGU6SFfmDRDw04R1KUk7wA93aN4b6MBy/
 XPM6xumr0LZNQRd7hBCOAIRtbyInDRQDrXWVjiYWjPJeUiATbgupT36LI66KWBY5oT1qY/n5
 zHTRdxqXMyQUTzEseDtac7sywleF/NHwgF9/suoqSQ4tbHNf7W2Gy4OR4TevKb0rYi6paxYY
 f1BHpUa8WTWVcGV7w5mTEWYKMiWkX2YPdly+rTZGj+0v4jCreawNAzI8yjbYbFIHIDZl7VJE
 clcXzaGPhgh3rbL0MQxiKhFE/QRg==
X-Talos-CUID: 9a23:JJKPiGGXFbL4OfQNqmJDqhMsCsV0akfezVCIPR+JC2BvE6O8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3As9rQ/wzAJBBthLcFQscoX7VXLAOaqPylL0lRrb8?=
 =?us-ascii?q?sgJbHGndNFRLH1zrwZ7Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,230,1677560400"; 
   d="scan'208";a="107479148"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0iwS9Y4qvTCOq2Nw4Im/9tPNcZyBcYU/h8c/aBYTgnJpdZML5E0D82up77RDhoigJAzM8PktDh4PVQePnJ3wtuR9hYIHYRL+OyylOJUZbIclhE5Cb8lsZL+JFxdBK8K+WftnNIzII4Q38yQJpZqAjZkDHOEFyNWTwf9diIUHRydIJzqXFy2OsXq4/cCO//uySBHBfhiXZ/8gksbwJ18yyt4kTaFTu6xC6C2TtJOl0lGC28WsLNn5P1q7znbyewKXp/rkXgIu/6ETm8bemAFnvk86xUudb8Ye46JseNbpfrGj+AwG8lK4oGgUi4PQ0PIyC0iooS/JU5nLmjlYli7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex0XMmkcCyK+JshzwV+UnrRjt8dIFduuMrFGElq2B9g=;
 b=mOi9X0wt4XDNEgIkv6EuK6E8JFDGTnmpjLarWqZNe9eHVKcBEdEDoPuFPzwjk/LLcb2VPoAOguMk9CvylJn5ntneIrbUzcvjUAtt3UPiJrGpqzsqd5ynaLS/gSlDlqOMrGxktrsq9Zl0bt9WZCOyMkZ65Zk3u+rQDiup3kWiMcswiz9+feo8SHuAYwX7OzhyiIIfIIRtXkbPhD3I/VuW4qh9ie7lC5y+GkvN1ZpUVJQ4sQX5rHykN3MdHOR3tGwKkKNoeOQ/NEHbDMHMrVrbEyGbQgb0TjZQfb6LISAPX7wW52AizMJFiRM+4bflI1wbfXxtcjtG/JXtWLdN6e46Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ex0XMmkcCyK+JshzwV+UnrRjt8dIFduuMrFGElq2B9g=;
 b=QKqgewQUXt6hescbqYDFPWwxIY+Mjy6yegwdzF3f59rOQyX8dqGfqO85VMuZoq7DzNh2nlkSWvqD/xMK6QY1rqkHyS/gFA4c4+gTQORqcGCBGzriHPjR0+j4Hg3dGtCKAmkZTpcUXkL/o1NBnYWpIAUWDTsbb9kqCs5I4WwzOEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <91d37778-ec77-6716-61e9-d47b0517508a@citrix.com>
Date: Thu, 27 Apr 2023 13:35:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/7] tools: Use new xc function for some xc_domain_getinfo
 calls
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
 <20230426145932.3340-7-alejandro.vallejo@cloud.com>
In-Reply-To: <20230426145932.3340-7-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0048.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5242:EE_
X-MS-Office365-Filtering-Correlation-Id: 51703748-5511-4446-8332-08db471bdf5c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BqchtaWJZMkcm5D81HEfshhVq+O2N5SNCXmiuEa9jmIBBgiNUvLtTVtUYZe5WlU1aOB8jQQClyzEyk+KcdAmjBQo7uFwseR2P5fJRkgWLjLUwt3/bokKl9/Fico0PMzKHyy+pBm9GTeZeXLskGHSRILObxQFMDnOytwZJZnLt4vk5VGwhigPP7faiXYuBEWPVrqboP1KMQV3vRGmxC1fhQRMo8sRTAODE9pzr3iimQ6pT6TiRflwQ6/KQ7xv4Ewt+QBCOYD6GO9Y8p/Drx4k6Zlztj9nUyRSRT7jvi0+g/nw3XnZmCQuWfjzye4VtySu3919WEt71rYQ0Aqo0BAbXKXvhMYFtddLpfvUQeIH3D9WoJ5JJRL5pf2QFtdryTqVIVG76xP8Tnw1RSvA4y57lZPfM+41GKYGJzYQYe9T6Bt5nEJXVSxCIH0naT5m1ri4W61uDn/wLeTpQmMX9lECMxkjIEoF4WxsJyhdRt+SW/2o7kxI0mfrGdnTklL4vEc+iwB9b8IeFvNLqeg0GF9aDC7BJbC5ftwYOY17JHUGmn/Tc4gGDXQjHWWF6/hCfgVBslVwsou7ZyVyOuXv9XHesfvUsZpXCnHEtT+dakW4j7npT90qJZEu4x79x42E0cqXGs1wc7j/vJujeReJiyT4Bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199021)(83380400001)(478600001)(6666004)(6486002)(110136005)(2616005)(6512007)(6506007)(54906003)(26005)(186003)(53546011)(2906002)(36756003)(38100700002)(316002)(66476007)(66556008)(66946007)(4326008)(82960400001)(8676002)(8936002)(41300700001)(5660300002)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGFIc0NoVGhWVUx6UVE0VUFaeU9NdlNFZkN2dnFHQjBuamJacGV6YVo4SU5H?=
 =?utf-8?B?Q1NBaC8vQjFsZlNEM2hITUtyMk9xcWs0ejFrcTd3TEwvaGZJaTJtUElLb01l?=
 =?utf-8?B?L2o2ODdJa0NLL0NBWldhNGw1SmV0Y1pZa0VobW9zWEVHQThLVmVlbHhwc2Ju?=
 =?utf-8?B?Y252MTR0U3NEQ1NsTkZKZGdHOHoxbVhYTHRwVEZrUUp5bytGZjRWRnlRZlFq?=
 =?utf-8?B?azZVWDVNbnZBTThjcWtYUS9hVHlpRTg3cEVpcDVwZ2pOaWVyeUVHVUx0RTRL?=
 =?utf-8?B?Q2duRkpTc1JYZzdIQmd0azhXckxJdGc4OTZmMnlQWDlUMkswM3UxYzZpSUtu?=
 =?utf-8?B?dStTbWU2d2dSMUgxN1RjRXNUOVlCSis3MXVaWXNrQk8xZ2pYUm9WMytkV2FR?=
 =?utf-8?B?S25BeExlbE1IS1dFY2h6N2VsdVR5NWt1S0VVQ2JTTTBGTm85OTk4bzdCOWlz?=
 =?utf-8?B?V3YvaGhuT3JBY21Kb0dZeTFGZjRPT1JGbElnWjhXeExBcGo1SEtEOSsrTVFm?=
 =?utf-8?B?d2hKdjFBbDhTQ3JlTWJNOHRxb05YeGgzQllYNWhtQk96eUYvMWVFaUVHRkRn?=
 =?utf-8?B?Y1dlcXU4UForSTIzaDNGbSs2enN4aWVZTTJPYXEyNEhBODFmcHErWnl2dnds?=
 =?utf-8?B?OVB5RlhlRk5kWnRXUlNtb1o5aXNVeGVoZ0JOakVKL0Z1RmZRbkU0SzFBeHFB?=
 =?utf-8?B?ejh6VWFVQXpOVGlHVmNrVnA2MjZDS3U4c0dlcVNtb2pCa05neGdFQmxrTVlU?=
 =?utf-8?B?Tit6Ri9va25LTG9ORXVTR3ZtV2NaeTlWd1JPa2RvVU92NHMrUzJPZEJtby9t?=
 =?utf-8?B?TVJDK0FINzcxSVMzZ1ZRbVMxYmFWL25yLy9GSmo1N3kreTUrblFWWUptelJF?=
 =?utf-8?B?MlM0Y3hJSmtMUTFZbWFkNlRxSUFocEY5M3FmdmZCZllxSUg4WVIzM1JiVFZv?=
 =?utf-8?B?NHVicll5OTVPT1VYQUc5c3g5SnJQR09meit2aThXZk1MWkZZWHNwdGVILzU1?=
 =?utf-8?B?cUdqNGluM1docFV6L01yc2Evcy9WeGUyc1NFWWJZaVZDZ0RTTFNmcFpKbUZY?=
 =?utf-8?B?Zi9iZGhnT3BFUWhCaTBlUjM2UjlIRzJNaWZiaGZ1WTM5UUROZm9XTndZUFJS?=
 =?utf-8?B?dlg5M3daRUtSd1BHczlUZ0NNRStRZFVYbEwrNEVWL1J5YW42UzA5ZEpIMkwv?=
 =?utf-8?B?Y01ORkRiSENFeXk0NmFDODd3R2Q1NW5oT3pWdGNQZHNPYllqSEhSZUs4eFg1?=
 =?utf-8?B?dVRsdWdrT3crZlhlZVY5K1hWR1RuRlpsd2dOKzFCVGFDL05YTUcyOTc1eHRK?=
 =?utf-8?B?V3lvVlpsdkVObFFnMEZUdmxsMUdXSUVyS2hleTBxcnN6RmVONmNXZ3FDNHl4?=
 =?utf-8?B?UDVxL3phc2g0dFVPcWZYQ256T3Jhc2lpSk9hZ09GQXU4b01ScTV2M09LTERH?=
 =?utf-8?B?UE5OcXpYLzdva0MzWSs0bG9hdVlWQWtYQ3FsR2ZqdUV1czBxdG1LNjQyaFJi?=
 =?utf-8?B?Q0RjeW92TjBVNklzbzJ3T1ViQ3NISUYweWNURWRULzNTYXFKNzU3Zm1JbTZj?=
 =?utf-8?B?WDFXVVovdGhsaUxmNjQ2dHpDSzk5WStDV29tSWg3Zks5RjlqTUNMVTNHSFpz?=
 =?utf-8?B?Uy84QXQ1cjJtYndtOGRyOUNRK1A0TkhBSkZNWG1PbzErSVRJc2QyeVB5RHBP?=
 =?utf-8?B?aCsyRUJSeFVrOWI3Nm96WWRsS1g1ZFMxOWJDV2hNU3VESGZubHpucEl4MWNO?=
 =?utf-8?B?QzdzTjlEZnVoU0lmUi85NEphNXVkRUd3Skpyc3hWakZxTm9Vb1FrOTArWmVy?=
 =?utf-8?B?QTFNRDdDQjRVb3JGcTYybEhzNCszTXJSQ0lKTkI1ckg1eVkvaGs4N2wxZG8v?=
 =?utf-8?B?cWJSSmJGVUpPQXcraEFUVW50SnF2RlIxWE5KVEJkbGh5dEpiTEppa2s1Mi9o?=
 =?utf-8?B?cVJFSHNIR3ZsYWxHWUsyNndGOVk0MDZqVFMwV0pMNUhibnRvVzRhQXlxckhi?=
 =?utf-8?B?QVZkTUFTWER6MWtSQUp2V1hMaW14QVlpNHFWVmF6dSszck1WcTBQMXpESVk2?=
 =?utf-8?B?WHBCZ2tsRmRiS1VWZnQ4ZmdpVTlvYnF6UmJPQ0NwdjdsWW1TU2o0d3dHQ3lX?=
 =?utf-8?B?R3hySFMyVFZNOGxuZU94ek5meTdvWC9Pa3ZnUzByYkJSY0loNHlJbEZERGtt?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4i2xuOZ0MX5hKjQCvOzZmC7mrPzimvjYbY2yWp3qVq+sBHc1UBfynZ3WTXIUHwVFm0aoNh7dJWzw6epO4K7k0ngaIJ6KU+j5x9lB6cyLQRwFDYL4VkPzZfZ03ICISFu3NpTbUhrzhcuATLXKfZVYMyNi30gxdn2BBFwskMA0qW6VgHnzGyQ4FZpsnHidhFzMsJ2DEEDRd8LpC2g7SJ0x9ztO0y0cKlbWC6lzV1zaXfKM+GODo6RriwW8FGNBBVvOziC7GoRSJ/XZZrHyi1InwLKNgo0WxbRsGRcBAveqwYtAIoM4kx/o9qZxvPGAI8DHLlNyLIFD/1alGMh2nM9sSt5QBICUPWnHPrmvMmiv+1aLmXgNpyVAhlBr1JU6+fwJ1tUQTmB5I92NEuHDUmuSmhs9a28pfOBnSuAbvXM8arm7KP5VtZ2i5W4nfcb6wNxuEhf/7hpQKoMUE8dcoPQ/3+Mk99/PtqczXB4OXbLtJrHTw/gIc5+aQFj8G0pt3jvN/imWcwD/f//T0lboguioUP/LferaXVCbptCMTGncJjc2UmsP46n6p4LHYeyOAwvO9XHTRnA/v02HiC2Iu1CBNiPABb1aX8rVs30zPFrTnilsbH1UpZXowcAswPyEvtgwrQF9uL5+bRZRQHmEYScE+mazm8HL2DzGtge9Zvlz/xp9QyVe0kc9lCUELnMvMh6M21Qut4xWI4oZ1p2HQ9C+q+hptuDhnnSrHuDMOezJhaKCUHdYcuzt9DajISFeCTn6llN1aB82Wzq3UWoNQhlUrmvLIfWYq0VbNdTS0Rm4urJR+jOVoDKPJ31QEEiXvLsYQn7uWdJ0IXibHEk6bPVJk0QsKhqL+CdGJUzTuss8+kc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51703748-5511-4446-8332-08db471bdf5c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:35:24.3619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drB7+7BAj5Tjpxeg7TUsVQ+V3e+RIBDzw16LiB9L8JvFOl6f+a3fcH2zsR4dUInb+Wr8GoaBGqjKaLxzqRJRBugPFQK8HzbH9HsoiPK3pME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5242

On 26/04/2023 3:59 pm, Alejandro Vallejo wrote:
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index bd16a87e48..6d260d2cff 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -281,7 +281,8 @@ static int xc_cpuid_xend_policy(
>      xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
>  {
>      int rc;
> -    xc_dominfo_t di;
> +    bool is_hvm;

I know it makes a slightly larger diff, but simply "bool hvm" is what we
use more commonly elsewhere.

> +    xc_domaininfo_t di;
>      unsigned int nr_leaves, nr_msrs;
>      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
>      /*
> @@ -291,13 +292,13 @@ static int xc_cpuid_xend_policy(
>      xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
>      unsigned int nr_host, nr_def, nr_cur;
>  
> -    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
> -         di.domid != domid )
> +    if ( xc_domain_getinfo_single(xch, domid, &di) < 0 )
>      {
>          ERROR("Failed to obtain d%d info", domid);
>          rc = -ESRCH;

Now that xc_domain_getinfo_single() has a sane return value, you want to
set it in the if(), and not override to ESRCH here.

These two comments repeat several other times.

> diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
> index 263a3f4c85..59b4d641c9 100644
> --- a/tools/libs/guest/xg_dom_boot.c
> +++ b/tools/libs/guest/xg_dom_boot.c
> @@ -164,7 +164,7 @@ void *xc_dom_boot_domU_map(struct xc_dom_image *dom, xen_pfn_t pfn,
>  
>  int xc_dom_boot_image(struct xc_dom_image *dom)
>  {
> -    xc_dominfo_t info;
> +    xc_domaininfo_t info;
>      int rc;
>  
>      DOMPRINTF_CALLED(dom->xch);
> @@ -174,21 +174,13 @@ int xc_dom_boot_image(struct xc_dom_image *dom)
>          return rc;
>  
>      /* collect some info */
> -    rc = xc_domain_getinfo(dom->xch, dom->guest_domid, 1, &info);
> +    rc = xc_domain_getinfo_single(dom->xch, dom->guest_domid, &info);
>      if ( rc < 0 )
>      {
>          xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
>                       "%s: getdomaininfo failed (rc=%d)", __FUNCTION__, rc);
>          return rc;

This need to change to -1, or you've broken the error convention of this
function.  (Yes, libxc is a giant mess of error handling...)

> diff --git a/tools/libs/guest/xg_resume.c b/tools/libs/guest/xg_resume.c
> index 77e2451a3c..60d682c746 100644
> --- a/tools/libs/guest/xg_resume.c
> +++ b/tools/libs/guest/xg_resume.c
> @@ -26,28 +26,27 @@
>  static int modify_returncode(xc_interface *xch, uint32_t domid)
>  {
>      vcpu_guest_context_any_t ctxt;
> -    xc_dominfo_t info;
> +    xc_domaininfo_t info;
>      xen_capabilities_info_t caps;
>      struct domain_info_context _dinfo = {};
>      struct domain_info_context *dinfo = &_dinfo;
>      int rc;
>  
> -    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 ||
> -         info.domid != domid )
> +    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
>      {
>          PERROR("Could not get domain info");
>          return -1;
>      }
>  
> -    if ( !info.shutdown || (info.shutdown_reason != SHUTDOWN_suspend) )
> +    if ( !dominfo_shutdown_with(&info, SHUTDOWN_suspend))

Needs a space at the end.

> diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
> index 7314a24cf9..a03183f4b9 100644
> --- a/tools/libs/guest/xg_sr_restore.c
> +++ b/tools/libs/guest/xg_sr_restore.c
> @@ -887,20 +888,15 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
>          break;
>      }
>  
> -    if ( xc_domain_getinfo(xch, dom, 1, &ctx.dominfo) != 1 )
> +    if ( xc_domain_getinfo_single(xch, dom, &ctx.dominfo) < 0 )
>      {
>          PERROR("Failed to get domain info");
>          return -1;
>      }
>  
> -    if ( ctx.dominfo.domid != dom )
> -    {
> -        ERROR("Domain %u does not exist", dom);
> -        return -1;
> -    }
> -
> +    is_hvm = !!(ctx.dominfo.flags & XEN_DOMINF_hvm_guest);

No need for !! now you switched this to bool.

> diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> index 9853d8d846..8fc8e9d3b2 100644
> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -996,17 +994,13 @@ int xc_domain_save(xc_interface *xch, int io_fd, uint32_t dom,
>      ctx.save.debug = !!(flags & XCFLAGS_DEBUG);
>      ctx.save.recv_fd = recv_fd;
>  
> -    if ( xc_domain_getinfo(xch, dom, 1, &ctx.dominfo) != 1 )
> +    if ( xc_domain_getinfo_single(xch, dom, &ctx.dominfo) < 0 )
>      {
>          PERROR("Failed to get domain info");
>          return -1;
>      }
>  
> -    if ( ctx.dominfo.domid != dom )
> -    {
> -        ERROR("Domain %u does not exist", dom);
> -        return -1;
> -    }
> +    is_hvm = !!(ctx.dominfo.flags & XEN_DOMINF_hvm_guest);

Same here.  Can drop the !!.

> diff --git a/tools/misc/xen-lowmemd.c b/tools/misc/xen-lowmemd.c
> index a3a2741242..b483f63fdc 100644
> --- a/tools/misc/xen-lowmemd.c
> +++ b/tools/misc/xen-lowmemd.c
> @@ -38,7 +38,7 @@ void cleanup(void)
>  #define BUFSZ 512
>  void handle_low_mem(void)
>  {
> -    xc_dominfo_t  dom0_info;
> +    xc_domaininfo_t  dom0_info;

Use this opportunity to remove the double space.

> diff --git a/tools/vchan/vchan-socket-proxy.c b/tools/vchan/vchan-socket-proxy.c
> index e1d959c6d1..9c4c336b03 100644
> --- a/tools/vchan/vchan-socket-proxy.c
> +++ b/tools/vchan/vchan-socket-proxy.c
> @@ -254,12 +254,12 @@ static struct libxenvchan *connect_vchan(int domid, const char *path) {
>          if (ctrl)
>              break;
>  
> -        ret = xc_domain_getinfo(xc, domid, 1, &dominfo);
> +        ret = xc_domain_getinfo_single(xc, domid, &dominfo);
>          /* break the loop if domain is definitely not there anymore, but
>           * continue if it is or the call failed (like EPERM) */
>          if (ret == -1 && errno == ESRCH)

Oh wow... so this bit of vchan was written expecting sane semantics out
of xc_domain_getinfo() in the first place...

This needs adjusting too because of the -1/errno -> -errno change.

~Andrew

