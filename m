Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298DD6A1FD5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 17:41:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501287.772969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVb8J-0007hN-BT; Fri, 24 Feb 2023 16:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501287.772969; Fri, 24 Feb 2023 16:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVb8J-0007fS-8R; Fri, 24 Feb 2023 16:41:19 +0000
Received: by outflank-mailman (input) for mailman id 501287;
 Fri, 24 Feb 2023 16:41:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVb8I-0007fM-02
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 16:41:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e15185d-b462-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 17:41:16 +0100 (CET)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 11:41:03 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6179.namprd03.prod.outlook.com (2603:10b6:610:d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 16:41:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 16:41:01 +0000
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
X-Inumbo-ID: 0e15185d-b462-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677256876;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7uTl8tMvLaSfDKTxdpBnAX0uS30zHEFtm5N9vI+5thQ=;
  b=F100pg+tt0Kma8DUDup5hfhY4J6cHK/Qzw7RRgcWaToADhXHjHNID64o
   20aYyYMVqj9hmu7AVPm/phn/G31pZ+8viunek0Q4kV5QVLYwpRr78bgHu
   mgHXla40h0Sb5KK3ZRuZfOTYbSh+B28katKIeToDFPpcMyZVU0xYWdRCN
   Y=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 100863818
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Oeg1C6KMa8bFrK+cFE+R4ZQlxSXFcZb7ZxGr2PjKsXjdYENS3jUGn
 GsWXjiPP6nZZ2ujKYtwa9+0oxgA6pfSm9A1GQtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AZiPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5lMFwfr
 MM5dgkcbyChmLqVze2idORF05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGNnGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHujCNxJROTonhJsqE/U4VJMLDgcaUqQp+jjrnKBV/diO
 2VBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkA9MW4HTT8JS00C+daLnW0ophfGT9ImHKvriNTwQGv02
 2rT8nh4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CJsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:tLQpRKr9VwE8DRBKSp/2/8AaV5rmeYIsimQD101hICG9Ffbo8f
 xG/c5rsiMc7Qx6ZJhOo7G90cW7IU80lqQFhbX5X43SPjUO0VHAROoOgeSN/9SKIVyaygcy79
 YCT0EHMqyIMXFKyf/g5g+2CtAhx8TC3pyJqI7lvg1QZDAvUrpn6QhhDAadDwlRfylpQbQENL
 f03Ls7m9KHEU5nFbXFOpDAZZm61qH2qK4=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="100863818"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4Wp2PThvPw5QHqo2Xc4zoYNW/Nkx6wV1DrhM2nP6dZjtvlXPB/5w971H75FTUMwHKgCYz1koQBPFPAezuSkNR1gYigd+Ti7CttJB9c1HKpqFNuNTwBjqGscJzr97oRC+Ixhn+WA53/KWcQ54H6jFKEh7TenOSL5z2mRQB6+/5Y3z99wmFunAxsi53iwFY+27HmR9RlfO1IkLeDzol5fAH759fvWggDFG6Th8Q3IycrfFqZLfhV7LvqEm+z/vdIqJjH8O5B0oayvr/0VZ153aSx2+pZqH8FNbCKQwQME7Lu5Zubnswm6jsee6ZkChhjE/iV1V3rw0lNrkKtN6+tHIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uTl8tMvLaSfDKTxdpBnAX0uS30zHEFtm5N9vI+5thQ=;
 b=n2opfTAMTXy8ooKS5XcNcVMQIuLyw8KOtSD50iM9scu+RX+v63p3oRF8im5f4ZB2o5/7AYzUxDTZe6SUgRds9tiul8vraoSPgHyIHwpqArdH9Vczc3ng/pzsFGUH2v2iPrB2Gecd2ZeoSKQXbGDnmqFp4oCt8C+tsEfDFOO2Wps46zhb6s15C5LHiOyv88lWXfDQcE1rLEwEQTUuyCMeBfDeRa1DE5ZidMQVnih98BoQw5VXdYaLic9cW6yBGkFgrxbQHVvg6L2PCW9Sg53NNj5yl7iIRaNQ1BeeWnaT4FhWvtEayEr4wEYJs85rOebO4ryoV1vJwNO61n5tMzo88w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uTl8tMvLaSfDKTxdpBnAX0uS30zHEFtm5N9vI+5thQ=;
 b=kUcDlO6xhXd7WAq9EjCDualijI99dEALzPRxAE71Bq/Gqnxv+Xh2gW0Yb7FA93YY/3VA+fIhQx+f1wBKi7+l9y8gqJctk/12DN/We9UiETwseXoE2FC4cxgiwqwz+dr9BCgeH0Mp5TQ1HUjUVsIXLf3Hy2JkwFWbUltoeGyXelE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8c1a3b60-9a14-43ed-15bf-8f9c87ef2c53@citrix.com>
Date: Fri, 24 Feb 2023 16:40:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/3] x86/shadow: drop dead code from HVM-only
 sh_page_fault() pieces
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <0e682cd4-3cc0-461d-ee53-13a894797f17@suse.com>
 <d8b5e168-2977-bd16-6345-7aecd778419b@suse.com>
In-Reply-To: <d8b5e168-2977-bd16-6345-7aecd778419b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0677.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a83a7e-5afe-47aa-97ee-08db1685e9c9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QoxhyEfdvNNPonaWFcDOgN05GuysoxcFFMI48xEAagNJWSeQy1v1tw3VzWr9vTTRJH5La42s2H01a1d2IHSvzOXQAa8KvYhVaMSQHSXCQH8y+8L3tVBYU2UgtkkJXskPmtjZpid0aP3i1lgoTUyFlHkx4NeFZje5++foG7ExARX5gOMSRJjjCCBJmoB1i5J4cTCRO2fuwmRaZzI3sja6j4Y/oSldET4ICehe2p/sLESjyTUx/HPQ+8o1Wxf0YiBhJ1G8GZ9F+xLgdgrzE1A9f7wq8a226N+XE98CxM5qZwWFnCtuNbx8ICwrMBhWhkDM4treK6/DCjDfEqitCswX0+Wdew1isKPfKRWS0V6iXzVUWYDGzv5A37ASqcdRj21U8dLUAjzLPekyeHtyRr+9DrN/TiXw8bw+YXWaCEjTVJRDIymhAIGhBeM5NpS2VB2uYGNSIzHEbnZAOBlqWPo4kXbMPcS1183WvcUwoHaGX8i91G8ebKhIaSrxUHEkdHQmFRuDP7kOj4zWbLINzxO4PbL745nVY46enJ9j7duMUVOeyZdn2YU+gPciJlIUoMo7+X+T3wbtcD9GFtq1ZXEy7mNVmuU1OssBzZAEto/8uUDWeUr1dbapILw+VshHmKcTK3tz9EQT5eqJioavSp7DA5dUv+MfJHNJMeJG1KNC+M/mW25EHpsJx7NdYor+D8+jjAFOvsHjHCxo+305dGtvd1h8fqVpF1dS6QHTt4dqXqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(31686004)(2906002)(5660300002)(66899018)(4744005)(41300700001)(8936002)(66946007)(83380400001)(66556008)(4326008)(8676002)(66476007)(316002)(107886003)(36756003)(186003)(6666004)(6486002)(26005)(478600001)(53546011)(6506007)(31696002)(38100700002)(86362001)(2616005)(82960400001)(6512007)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Szcxc1hhOWdIYnpCdG9UWTk0YlJ0NW5vTTMvOC84c012RFdkTk4vNmhUTVhL?=
 =?utf-8?B?R1VySmplK3FQQmxhQkNCcXNocnQrMDZvQWxJU1I0aXhUdUNRb3RDSGtVTHVk?=
 =?utf-8?B?V3FVWHQvTEcxaDNleE9WWi92MTU4Zmt0Mjl3VTZaYjFvSzM0Q2dNeEJ4Vkla?=
 =?utf-8?B?cnlpTW9uRXhFcDkzSmdVcDRkdWoxaG0zbDI1MGtDM3ZINncza3NYNWdGei81?=
 =?utf-8?B?elJZRFBCOFFQTFBkV1VPc0N6Sm9kRXBZZHJrWm52MVhKaXp3ZGVzT1pvM3pD?=
 =?utf-8?B?RmdvYWJGRFV3RUlialhkZG02Z2NVa3dJdkxQS0pvRHd0eW15VlJaNVA0WUhV?=
 =?utf-8?B?ZnpkdjVJQ3M5RFNJM3phT0ZNWDZFV3NOUU0zRDluUklSQXlCMnpOVkFiWG9l?=
 =?utf-8?B?NURkQ3pMZlBrOXlCNVlDQjFYRVloQkwrckpsYW82SXRreVpERm1YN2ZFTTNJ?=
 =?utf-8?B?byt6NGhpM1JBT0EyTGtXdk42VkRjL0dhL3gyOFljZUVtcERtMklRVTNDWm5M?=
 =?utf-8?B?ZHpBeWdIamorWndtNitIdmh4V2F2RWZndzJRbFd3M1FacStvMGlBZ1BCNUhK?=
 =?utf-8?B?ZGE2Z051NHp4WmNNOTduSFFpcktVNFkxaE5wNjJIQTZXN1J0OTRTTU5FNyto?=
 =?utf-8?B?V1ZIK0lybDFqMWZ3WDB2YWZoMHlFaW1WeTZtc2RRcC83TkIxcW5WbCthWUhv?=
 =?utf-8?B?OGtqRHViRnBxRE1Gd1JtRytMak05N0sxT2ErVDNKZlB0cUNSNGFtZ0pMNnFh?=
 =?utf-8?B?cnB2UFhKdXlxemFoeVkveGdVTzJaUnBEK3hRUnBNcjJmK0RCLzdrc25McTNq?=
 =?utf-8?B?dkI2RUl0SnhGSmgxQTRubHJsSVhSQ0ozSzgvL3NScHNlaGVWYU40VjRIT1F3?=
 =?utf-8?B?WmNHdjBQNERyQ2dRQ0lXc2FveVVpRG9SN1p0alovT1lObVdheU41N2VnNHRY?=
 =?utf-8?B?VW1jeVRQZ3RXTm5qUjlZUmFMUzhldXN1UFdGUnl4d01peHpIRS93NGVmL0lm?=
 =?utf-8?B?SVNlK3J2Qmd2cldURGFpc3NLVXBJYlppbDFmcmRkUThFZ21QQ3p6VStBNHN0?=
 =?utf-8?B?RzFocSttNEtuQUZHZGNzUzV1T2tFUkVtQzdHYlVlazRlR29GaHJkS1FhN3pn?=
 =?utf-8?B?MXhIR21nVkN6ZHRKWWExVGswTFp2TUFMZ0lWOEY2MXpMNGgrSEhPWmcrU2M1?=
 =?utf-8?B?OFFwTGVNbi9WNXY4emN0WVltR1pQR2JBS2ZCS0ZUVGJIUU0rZUF5QTFoTnhW?=
 =?utf-8?B?R3RUZ2c3OHZsTUdLRWo3OFMzcTM0Tlp4cDE0cjlGMnFHVG0vbTRWMlVHZ2lP?=
 =?utf-8?B?TzdUc1hWVGJvWnY3eUpUTDhHaU03bDd5VkpXZ051VURKMnhmSThqNVpBb1cr?=
 =?utf-8?B?REVPRUZGN0lTemlMKzBxSG1KOUIvTTZaZ0NmbjFoa0xQSVluZVZrK1hpRzVs?=
 =?utf-8?B?Z3lFL2pCaGN0QWR5QkxpNlh4Y2JUZDY5ZG14VXZza3N2cjB2NmFNd1MvVnhM?=
 =?utf-8?B?L2dxTVhTbWJDeG5rVm5mNEw0V2FRTVYxcTF5UkFjQWExMUZzTVY5aUxjR2hG?=
 =?utf-8?B?aSsvTGQ1OXpkS0hsclhGanNVT0JpVFBiWDJRQ2RCeXJzeE1RZmxRZ1ZYT0dU?=
 =?utf-8?B?VE11WndjeHM0UGxrTU1PeUo0ZzdZZTIrSDl6YS9ObWx3NWtKdzJ4UUltY29N?=
 =?utf-8?B?QnQxaHgrQkNLZzFSd2swdXhFdFBDbzNNdTRKVHZOelB5UFZ3Wmw1WVhVeW9z?=
 =?utf-8?B?a3d3Rml6Sm5SVWFnM2tyRTdSeHVDSUpwd2FNRm5wemxQaEZkVHc2MlZHZmd5?=
 =?utf-8?B?ZkUyczV5c05UUFI4K0FoM1hBZ3J4dDNNRWc4WWFaWjA5eWhpUGw3SnlqSXk2?=
 =?utf-8?B?b0diREh2Um9OUUZmRWxNVXdRSldQRVBJRG9wbFRjcjhQa09oU3BTdWcvTmY4?=
 =?utf-8?B?QS9ySXg0UmZHYUg1WnFJeE8zVnVCNlpMZkZPZTIxWGV5UVZEekUxVmFmdzVE?=
 =?utf-8?B?QXhveVFIRElNUzBNNWM2L203RTk1SW9oM1cwU2ptcXpxR1JGYXdQeFRZVFVD?=
 =?utf-8?B?QnorcUo3SDBxdW5HWnV5N1BjYXQ3ajEvTFFma1BQRUhUNENFbWcyMFRwU2ht?=
 =?utf-8?B?UUV1QlNybkl4cGZCbjJtT3ZadmdLYWQ1ay9yMGlmWU45c1pRa0x1NU5LRG5k?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ztDPWHfcZ31RCZWeFp7FiknlAfFX1ug+9GkkR9cyyirs4MabicPQnqU36tum1dqXLehSp4RWpQ0HxMf4pFkYrXnonlIcwe3obx5fpyf2pGbVVcG3saEtJVWvVqbH9hVcj7eDiDCi4/Fk8AEAJGnp/T7FN9/3oC8mvBIQ4WWlBZDBxMC8+FbwdLIB5T5L91DamsUL8EeFGztkxT/6eF+NbJpVCpiV2/PWrAdDPrr+1wn3JwBRByXc9cTBS5DvPDiloOw806TYq0jFlA48YBfZQTrfFefOy9ovhVKuOSR/oOLU8C/oZ+0R4yiD3ThLJ8VNpXZNRjAERxdy/xhz7PX/QFkpVfBlI7KwLzy0T8bNsDxSO/HXSaDPNBAOaZluaitGuByYFZzM7e8qo3aNuWJZXoWc7DFJM5qd7V89stj0p4y9DIUNkJ7ipFpE25sV5ncYE7u/tEJYR5WYiYDBd9BaZ8rPivhb3j5Mn2z7FVYPIAHwK9/RnrS8x1wY9Pi3sHDMJ+EgXhfoM532+OHpeJRPyqObwba9L8W1x9C+79kp2uUeGIB5N4MrLfxFGxFtlVwHV+BCsHRDKtJPk7AgHk93vfVyC9Fy6ZXdSZ0QITvQ4l4ElXDh4/azyVksnPpR4lYZExgD9Oum1Fm8MAkgTBiQu2JBS6PEOFlEiDx/AfrUDksOUGA2SVmtRL6l9bw1xUyAkvkLzwZMoY4pJS3ZM2HDl4Pri8ZnRBJB3umY52WZsnqYPX1H6+cGZOE/f0nhm1T3A70j98FyKLjftRoajoCn+nXTgnrVf/aT+BnIL1cU0EIkjk3t65KA+r280JawKwiS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a83a7e-5afe-47aa-97ee-08db1685e9c9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 16:41:01.5258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfRflR5RdtxacxBVcRCtpbMpYs2NyF/Pb07GtiCkMB09jSIXRhDXtTlSlkr1Jf/RCzIcBtZ4wjywVZ5wn9Ztx3A0nyxUP5pPHv/usoQQeK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6179

On 23/01/2023 2:27 pm, Jan Beulich wrote:
> The shadow_mode_refcounts() check immediately ahead of the "emulate"
> label renders redundant two subsequent is_hvm_domain() checks (the
> latter of which was already redundant with the former).
>
> Also guest_mode() checks are pointless when we already know we're
> dealing with a HVM domain.
>
> Finally style-adjust a comment which otherwise would be fully visible as
> patch context anyway.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks for splitting apart - it's much easier to follow like this.

