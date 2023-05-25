Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EEC710D3A
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 15:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539597.840651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2B04-0001iw-F4; Thu, 25 May 2023 13:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539597.840651; Thu, 25 May 2023 13:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2B04-0001gN-B2; Thu, 25 May 2023 13:27:28 +0000
Received: by outflank-mailman (input) for mailman id 539597;
 Thu, 25 May 2023 13:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/c8s=BO=citrix.com=prvs=5022a0095=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q2B02-0001gF-U0
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 13:27:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e11fece1-faff-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 15:27:24 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2023 09:27:20 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW5PR03MB6929.namprd03.prod.outlook.com (2603:10b6:303:1c6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Thu, 25 May
 2023 13:27:18 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 13:27:18 +0000
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
X-Inumbo-ID: e11fece1-faff-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685021243;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5OqJjT+X6aK6IRmfWysi6qFL6oVYjSEhF1cUGWuV52c=;
  b=c0rcDHvVZQ6WY63Vx2fgSlaMmsRolj83xAmsSlLP4fyzGZPHOKhQYcUN
   ffTnBINMKMs/kL0oTGYg/mCYzxvlTd8PRCaHY8q680HoiuG/+DT2WyqB1
   uvCdIEYPNx2N/B81SRjduLjOqPqIqMyROWqQJ1tovXid2DtquaQThem3T
   U=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 110802728
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RAw4R6Lcvj7R9IF2FE+Rw5QlxSXFcZb7ZxGr2PjKsXjdYENS0jRSm
 GBNDGrUaf2NZ2CnKNAjboixpENU6MSBmIMxSwBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4wZjPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4qP29W0
 sEaOQwoSRS7qO+dz+67DbFz05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLlWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv13r+Xx3yhCOr+EpW056dNnAGOw1cPDR06TXaxn6aDmheHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBONB0mLicSHbY+rLKqzq3YHARNTVbPXZCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlRdCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:TL7abaG7jXXHQa6ipLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: 9a23:rT4kV2Mrh2d95u5DBRdp7GkpGNEZV1rZ9FjdCEDkCSExV+jA
X-Talos-MUID: 9a23:gL54owULMF8IHz/q/DP93RZ+aNpt2LirCGwVvJ845POUbBUlbg==
X-IronPort-AV: E=Sophos;i="6.00,191,1681185600"; 
   d="scan'208";a="110802728"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgiRxCjW5xWxRDW4JeWZuEY0Z1uO8v5mw1kOM1PmHfKcpvETg8XACH5HNj1P1jeV/P4wOA+LMtPbWTVrhtXOOJEhqM0Lqv9S3a2NmuXJFf3czGQPMar4td20nIOl+2fxQjKtsLwDmAvygNW2dOXJkb2mbDY2G/IHFo/yOHI2Y/ZiwY1ASWM9k0tpuEOF/gjlos0BV/X5h7ipK5LqGJtbbPC1yE9t9cJYCgvebb2/xZrH2JL9kQwzdhTUlpGmrzz5dli+3/J1QxXAeJDw06NIa47GCxdwyZU8bDW3c/sZjzuuFEy/kNvDr2KYQyMK4kSEy1crcY7BNNxkQ+ymHBwdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgdESvyLJ7sYJsZcsTFjNWa6MQxCvm8r2d9D2ykKoFs=;
 b=KDxvSVeQjKHos+J79i0hb9go7jCyprHmzvgp/8bSSlpqonPqr/DLQrDNVKTN5DPVdBdLmWUpiXweb5fZML9IYds8Erm6FEtQaSP1FWsT98TV31Oo5+jR/mgUJfK/6LqnsbQP6vlI6FEQg9ui5mPi3vNU8KshpYX5HepXj4bV1lYww81qqlNnodvJQJAfYEdZNw9eFMQ+HPTYS3JAzhvia77gtS7clpFeGpA/cU8Zfved/5lirs4AaDpPumFMuwwg+yNz6gxJmntqpu/fgX7dgckuQfqytamQ5EwiHPiQTMdYaS0jzIeNTYkVK+xSw/8jIiPKuROc6qEo/VpuicQPQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgdESvyLJ7sYJsZcsTFjNWa6MQxCvm8r2d9D2ykKoFs=;
 b=GLplXEKy6hTT3s3696WXxZf/CORsheTQOZ72bss18jvQqt/bYcotKfAdSm6egVIQ68H4+Tz4v0BxXCVztwjnuSU0P1dehMKGYspc/UIZLEGSkZW1XGriLh423jZ2kctDQuormrOWsyyqR36ZGUs5bc0xXJbmsu1MHoYrsOWCT6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 25 May 2023 15:27:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] vpci/header: cope with devices not having vpci allocated
Message-ID: <ZG9iLwNWyK+I4HLf@Air-de-Roger>
References: <20230525083051.30366-1-roger.pau@citrix.com>
 <25a73290-7677-e202-5e91-fdf32ad5c01b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25a73290-7677-e202-5e91-fdf32ad5c01b@suse.com>
X-ClientProxiedBy: LO2P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW5PR03MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b05093-63fa-4072-7861-08db5d23c2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kgUL7CSzyT+cYeYsXpBvaWEZ1ANUMbhIbbFUopoCS27H6SvCY7EqIvvyJKqURMzwTeQSr2hWoOhGTZnlXHod1ILOxSvBVYEW1psukKWVmIpWoKfqb1EhyeKtxog+0pQo28r/84wEA4sbw94VI/AwAsL5f4wKqZJNuITVM4Z85d9SILWC/QuOBzON15q0sllOj9p5L1U8Q0X1vNgnZJ8Wr3K88e0dbKOuB4QyClbXr6cIW0eUX9ATNcgqUP2l22YvCnFExVu5G7MnK1sLqWCeeiIqUmnAZ0rqywE7MybGNNX9U6gE0/suqTiJVMmUbNpiVQMsqVSShB9FFzUL4nCI3KCmBwYZjzjCIY9RPzchs6zgcHCgp70Q4y5U1uaZtcioBo8d7EojGKK3J9AtVWGVyREFvftzy0RMZu+Fd5MP5ny48b0btuolFe/4jz6ymjYwOQIHKyBgg6qvZFn+pfgKebJzp+1XV8nv54mfgvKmluCzA30LHpx3ftoeJVsoJsBriAVIxISlfLlrvTQoH8BOA/0M27gQwGYQd5Gtukoodk+MrgP7fJwOWpbtd5+q667ETwxLrEbssTpoMNZTb4H319937DMkKJ0jIh9kVU4zm2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(26005)(186003)(6512007)(82960400001)(6506007)(9686003)(53546011)(2906002)(38100700002)(85182001)(83380400001)(6486002)(41300700001)(316002)(6666004)(508600001)(33716001)(66946007)(6916009)(66476007)(66556008)(4326008)(86362001)(8936002)(8676002)(5660300002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDJxWFBncFUyVzJVa2Yrb2s2bXF5NmthUUdWU1dFNHVwZWU2RFlZZ1pjN1Jj?=
 =?utf-8?B?VHRqRFBpeXRINS8wTGE0MitodzFGZTZqSng2UTY0NFYxbGdHVDJscVBmeU9T?=
 =?utf-8?B?VkpWZGo2VVZUQkRXRHRJeFRYQmVjTTMvVnlJV09IQXFEY3UvZUxnQUJTZHhn?=
 =?utf-8?B?TVg1UC9KWU5yT3cxclk4YmhnemJTM0ErcUhVbUE0TEM0WjcwR0FIa0dvMXN6?=
 =?utf-8?B?b1UrNEVjaWVtSTlRMmFnNmx4NkJJUzhlR1BGR0o3d04yRUxhaWExWkZMNFgy?=
 =?utf-8?B?cUxVYmNMTnNIYmU4SkpWOWZLZ2gyL0NQZlJqSDQvbk9NcHFMU3U1MFIrMjhX?=
 =?utf-8?B?RUpGdFNmdTNtb2VVN0lGVFBGdGNSM0I0Zms3Ky9sejFKdjlDOUN0ZG9aTjJV?=
 =?utf-8?B?aWxaREhxclhhbHg4NWxmNktjcnlXUCtxT0FDL01yZzU1c3o0RjQ5VmVjU1FG?=
 =?utf-8?B?bjQyTHFqN3piTm5UU0R2RHFFbmxEUFBXdFhueGFIRVpHZU15Zjc4TW5xb2JI?=
 =?utf-8?B?ZGtEVGlweU9OKzNORWdJQmp3Y0VSZm1BY1U5VzJWcEhReEFtWkdpaEkvT1Y4?=
 =?utf-8?B?dkRvR1NJejFZdG45OHRLcHlCTHJRTS9oRUk5aGxrZ3BteTc4NFVIeUV2Q0k3?=
 =?utf-8?B?QjdaMlhKV2U2cGh6WWxTNlg1Zzd6bWIxNk9kRTk2UWdVb2xzNFBnSXIrc2ow?=
 =?utf-8?B?cHNWTzdwbTVWbUFCQVJaSnBOMlJ5QVltanFyOURVUm5USnhDK0JLbjhZdHhX?=
 =?utf-8?B?ZW85TXhYTkNaV3dYMzNvV2tTQUVsMXR3dmF6bzNGZDFVNS94Um1KVnExUHY0?=
 =?utf-8?B?QUtObDI2dmFwbExrWm5XeEpuU09Oc0hxMTVaS3Q2ZU9xWDZWemhxK2U5ZkYz?=
 =?utf-8?B?dkhzdndMMWpZYjdlNFJNbUJ0NHpGQVpYOEY3WnFpdVMwVDJML1RYU2VFUDg0?=
 =?utf-8?B?VEZrWW1IOFlnZjhpQjBLa1Y3RUFKZ0FIWXlvY0YzT2piNldKeG5JaVZQRzU5?=
 =?utf-8?B?bzhMN3ZxUzFmVy80alpZSUhmN2hJK21kOTVMQ0xjSWRsUGpEYVpEVFQwQ09u?=
 =?utf-8?B?NEtvb3RnUnRlbVFubnBwRmlNT1NhUWRDV2h2VTJvYVZPUkQ1VDZEZ0pCaWRo?=
 =?utf-8?B?TVgrT1hBMWsvb3JsYkpFT0ZrR041WlB5Vis0dGpkVHo4V3J5ekJocEtoQ0s0?=
 =?utf-8?B?djNqZkJKcHorTDFtT0xVYm9FSmlNUDUyblpNU0hpK1ZBbU8rTFA1Zi92NW1l?=
 =?utf-8?B?aTloQWJqYlNCeDhqWHNqSTdNamhCcTh3T1p4UktnNlprcldHWDFxYndNNldC?=
 =?utf-8?B?L3A5QkFpcHdrR24xUGcrR3FLbWJOdGVJdVBxekEyV3h2cnNQcnZIcFJ1NHZv?=
 =?utf-8?B?eHliN1JjMDNiMG0za3doUXFrWVdqbVJzdTB3SGNjN3pzNUMzV2E5VzQzMDVP?=
 =?utf-8?B?YncrRXd1dlhiZ3VJQ0hlMG16S2hCR3pNSkd5QXc1MzBrSVRpb21MckFBcHlD?=
 =?utf-8?B?NElJVEZTcGVFSGhOK2hkcUZiaXVjS0hKTERMSzl4bEg4OWVWcDVGcjBCVDFM?=
 =?utf-8?B?a2xISUxWUnU4SGQzT05lWXh4VGJmMExtOVdsdkhxbVJ0elBCRXI4V0J5SFZo?=
 =?utf-8?B?d2txVlBFWXQzRFhzQUhkNlpZZEtEYjdaN2hTbENEWjFVbjlqb2x5Y1B1VlZE?=
 =?utf-8?B?VXY4STZjbjMwKzlCM0pNeVBseVN6OXJ4QzlyeElFL0pJemVNRUIrRUZZdkNZ?=
 =?utf-8?B?elRKN1pJeDUzSFRQOUczc0F2ZDUvMXR5SWRNTDdpb1lnTWRYRUp5T1NCRGFE?=
 =?utf-8?B?bnpFQk04dGtPUW94LzJwb0Z0RkZPQzJVcmxkUFdSS2VQeVFUOEUxZHg1S0lX?=
 =?utf-8?B?R3JKZCtOMnZXRFVYYkhrd3JhdmtBR1JuYzZDaSt5NVdHSWJCYmNFbU1odTI0?=
 =?utf-8?B?NGhlYVlsNC9jTmtUbWlja0FDb1g0S2o5ZTQ0a3phUGpnV2NyT0VDSEt4dUJr?=
 =?utf-8?B?U29CVFF0cDFyKzY4TWx5SGFWTzRqMnZYWmdMZGNaUmYzTi8zNmNLdUQ4aUVt?=
 =?utf-8?B?R3ppWG9aZkFQVS9UUERjR1dYK2hUMUtQQkpXWFVhT3BSUTdCZHlaRS91dHg1?=
 =?utf-8?B?KzlUcFYxM1BXeFhDcFZpUjNleGlyQUJOQ0MrekNDRFI4RlhycjdPTGZ1K1dB?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mUXsgU+HvcywJBHnBuby2sqvel3t6y2jvNxD9XUSwJV3FAg8v/OHz5KfrFInTXX6D7TMcon4FlCOAjsVvOxDfclavehIRC1YyZPgmmP5RmmEu1tUt60TAavYJ2St25ZM0oXSR2g4RXFqZszFn8KozHRNvQ3z8nHcJXQhh5Op/xYpb9JndcbVLxbl8SMG+s3d/yQvoZ1HAhCa/IPwEPeeWxUl5DZ5KWMicAatmlGsG5r9hjHM5mZvU0pOEwg9IJfKmu2ovdagDFU56NMPbSJX/Re99wU88HLiqMgU6br2sRYvDpT9Q19sAErm0w4EwyS2zEcwTPWxzGCZmqpIAFLF4TziyiKRcOQqvAqwbBwOzCUztbj4aA0eJ+MClXfrV5hga12Yz3DX2IBeQ4UUgoKe+nhO57h49WKrMyguG7j9AO9nfR92jMdxHk9cKp8anJVKysV3Mk7OVU/UPwzut2mzZLTNBKxVtYQ5sJVOvPZ1TIxbnpg/KSP+g0hV8bw5BNSGfyijewdAH26urYUtnGy5srBzmd3VdzRrNa9sJTr1Q/6Ddade8WPKPR7geTRjcSQPF2wUoFINHE6A4EjdCYDilItqRqCmlXlokI/SWAPz3c223lDWEPnyox4Nq/LVEYA09hZeCLA6ND3Ey0Uj1vNhmkNfHDRuhcsSGiLPPV9dNupQUbGKnINOUygTVp/WmL0+qYWjOvKQckPVu9hpNl3FDJGmhf9RrEYBqVDxtc/CWVneCj+TSiePFSH5mtKYCOOpTLPv9LwSVxTN7DPCVznBAfQP8bfX+SdE38b5J6yLwyg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b05093-63fa-4072-7861-08db5d23c2e1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 13:27:18.0425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIA15CZ8W0PbcChyEVQPfkeESa4cLWcJ1BZ+lr4rehibJOdv2+pj0cAvSbElNMznguTNPn40gy9/SLN626wZfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6929

On Thu, May 25, 2023 at 11:05:52AM +0200, Jan Beulich wrote:
> On 25.05.2023 10:30, Roger Pau Monne wrote:
> > When traversing the list of pci devices assigned to a domain cope with
> > some of them not having the vpci struct allocated. It's possible for
> > the hardware domain to have read-only devices assigned that are not
> > handled by vPCI, or for unprivileged domains to have some devices
> > handled by an emulator different than vPCI.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/drivers/vpci/header.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> > index ec2e978a4e6b..3c1fcfb208cf 100644
> > --- a/xen/drivers/vpci/header.c
> > +++ b/xen/drivers/vpci/header.c
> > @@ -289,6 +289,20 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >       */
> >      for_each_pdev ( pdev->domain, tmp )
> >      {
> > +        if ( !tmp->vpci )
> > +            /*
> > +             * For the hardware domain it's possible to have devices assigned
> > +             * to it that are not handled by vPCI, either because those are
> > +             * read-only devices, or because vPCI setup has failed.
> 
> So this really is a forward looking comment, becoming true only (aiui)
> when my patch also makes it in.

The r/o part yes, device setup failing is already possible.

I think it's fine to have the r/o part added already.

> > +             * For unprivileged domains we should aim for passthrough devices
> > +             * to be capable of being handled by different emulators, and hence
> > +             * a domain could have some devices handled by vPCI and others by
> > +             * QEMU for example, and the later won't have pdev->vpci
> > +             * allocated.
> 
> This, otoh, I don't understand: Do we really intend to have pass-through
> devices handled by qemu or alike, for PVH? Or are you thinking of hybrid
> HVM (some vPCI, some qemu)?

I was thinking about hybrid.

> Plus, when considering hybrid guests, won't
> we need to take into account BARs of externally handled devices as well,
> to avoid overlaps?

On that scenario we would request non-overlapping BARs for things to
work as expected, I think that's already the case for HVM if you mix
QEMU and demu for the same domain.

> In any event, until the DomU side picture is more clear, I'd suggest we
> avoid making statements pinning down expectations. That said, you're the
> maintainer, so if you really want it like this, so be it.

OK, I don't have a strong opinion, so I'm fine with dropping the "For
unprivileged domains ..." paragraph.

Would you like me to resend with that dropped?

I assume you also want the commit message adjusted to not mention
unprivileged domains?

Thanks, Roger.

