Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2A6BF1E3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 20:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511221.790206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdG4A-0008WM-C3; Fri, 17 Mar 2023 19:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511221.790206; Fri, 17 Mar 2023 19:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdG4A-0008To-8L; Fri, 17 Mar 2023 19:48:42 +0000
Received: by outflank-mailman (input) for mailman id 511221;
 Fri, 17 Mar 2023 19:48:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=001K=7J=citrix.com=prvs=433d55c46=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pdG49-0008Ti-3u
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 19:48:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3163607-c4fc-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 20:48:36 +0100 (CET)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 15:48:31 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB5011.namprd03.prod.outlook.com (2603:10b6:408:7d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 19:48:28 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%9]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 19:48:28 +0000
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
X-Inumbo-ID: b3163607-c4fc-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679082516;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nKTzSAy6u3yysrhmsin5EvLYPnSIJlC7eaexZKC0ICQ=;
  b=YPIeGWqViPihlZ4+W7d+bABhZcZ9gW8ZrKZbfFVkpWRRYKlT5X4z4StK
   vzyAlgBqALP2e38PjdxUGooWShRVvikB6yk/2ve6w1PoeBCnRtRaW63g6
   rCH5XCd0S9NpDq5Ryr0RhOxJZUj87OOVr/V4uMT/Y/jziL4m8BApiBA7W
   A=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 101322425
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PaCjkqIVacgCzZjhFE+Rv5UlxSXFcZb7ZxGr2PjKsXjdYENS0jVSy
 zAcWj+DM6mKazGmfY0jbYSw9UgG65CBytJmGwRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QVhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5uA0px8
 KwDBgsvTR+z2uTm6bGcc9Bz05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr13bWVwXmmMG4UPJCo+tdA2GGI/y9NCC8vRWO/ovy3tlHrDrqzL
 GRRoELCt5Ma71e3R9PwWxm5pn+svRMGXddUVeog52mlyKDZ/gKYDWgsVSNaZZots8pebSYjx
 xmJgtrvChRmtbHTQnWYnp+EoDX3NSULIGsqYS4fURBD89TluJs0jB/EUpBkCqHdptTxFCH5x
 TyHtm4yiqgYjcMR/6y+8RbMhDfEjpPJVA8u+gTeWCSm6Q5/ZYGNbomkr1Pc6J5oF5qUUVCbo
 D4kmsyS4eoUBJeBvCWITKMGG7TBz/yYKi/VhVljGIYo3zuo8n+nO4tX5VlWJEBvPcIJeGavY
 FLavwx57ZpfenCtaMdfYZ+1Cs1s36jpE9vNX/XYKNFJZ/BZVg6e/ShoI2WQ0mbFmU0g16o4P
 P+mnd2ECH8bDeFi02CwTuJEi7sznHhilCXUWIzxyAmh3fyGfnmJRLwZMVyIKOck8KeDpwaT+
 NFaXyeX9yhivCTFSnG/2eYuwZoidBDX2bieRxRrS9O+
IronPort-HdrOrdr: A9a23:LW+DR6sfgb4bwNeGwQW6dVee7skCM4Mji2hC6mlwRA09TyX4rb
 HaoB1/73SbtN9/YhEdcK+7SdW9qB/nlKKdgrNhTotKIjOW2ldARbsKheHfKlbbak7DH4BmpM
 Jdm6MXMqyOMbAT5/yX3OHSeexO/DFJmprEuc7ui05ICSVWQ+VY6QF9YzzrYHGfhmN9dOQE/F
 733Ls2m9JkE05nH/hTfUN1O9TrlpnwjZf7ZhxDLwc/gTP+9A+A2frBCh2F2RVbeC9OxLpKyx
 m5ryXJop+7tu29yFv632vehq4m/+fJ+594HcmRjcpQDCvqhh3AXvUGZ5Sy+Aotpf2p6hIRsP
 SkmWZZA+1Dr0nJe32zo1/W1xL+3C0I43vvoGXo+kfLkIjCXTcnDMgEuo5DaBve7CMbzatB7J
 4=
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="101322425"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArcarMqxby/tEupg2DucTf0YoG8EuMdoXpyzri3phrIxQ7A9S3VgRzgYBIb4DU1Y5V1dUcUZO8f8TfMF/PeD+SCD4kxkpNvEoaiy9Q18Tm1Ab1lXg3YfFAcw+C+Rj9qjAVPIOGY4KvaNBI/hPSAwviow0ZBqk2Expit4UAC1NPJHiWRh8eZKJNTg0te5FuDMeqRZV+TDRo6UO37Z1WQOhtJNInucyksPg7qgBTZFsNAaSmMNpV1JR11VTf3wCAEwCysXl5kXXfpmmrWhVc+rYLeM2ZgN5DZnpy5SUqi0HS+DRg7DFMHi16kJLNbzIz6pvD7GXttwF0bZHPq8PKgMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPlQaQdgEhmcTsnefonnlQQCxWvhOnd28khFQf5PqZ0=;
 b=mIwtem3nxiK6yz1YMpMC5MFTAoz1P108xxKE1QFVCOGEN7gCyNk07NLuOFLYUnv8DYnmVgopW5E1hbeSg157svKoPaoUfcY6LPEeDy50jFqEiMOFQyKXzAZYdTfUR1yoddx4y0vD9uIxYqQLZl9d8wEVRZU+0wzmkVIgALc5QC/UOE5iDNr37opm4iXNxjw1S/lLM5IC61GHbIQQ4DH6d/tEzU+LuSIcy3KN5jIUVfFagnQxuFgpHD+wDhAhA1V09RdH1QUSD9Y0YH72cWVd4RekxBx/o/Xxs84+6G7cL/6653cYyMqpjE3033jqC4EDGoQzJRmHTVVV9vapr/gP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPlQaQdgEhmcTsnefonnlQQCxWvhOnd28khFQf5PqZ0=;
 b=gI01F//y9G6baR6HkB944GPkeej5JzjuUARREWOJT/hvAvGZwgOdvfi3+cpWXF6WIWM/gDEqPMFgQOYiYnF5nIOi/YSQw+Zj88GBvGRgvbY3XkuWhUBuwna/rHZe0uW0x54oSiTaXNxLGE5kLdBEJBheZl0IqPbr/L2mnJAG+5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Mar 2023 20:48:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Huang Rui <ray.huang@amd.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Honglei Huang <honglei1.huang@amd.com>,
	Julia Zhang <julia.zhang@amd.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Message-ID: <ZBTEBkaI8q/mrJmv@Air-de-Roger>
References: <20230312075455.450187-7-ray.huang@amd.com>
 <ZBHz7PpUbKM69Xxe@Air-de-Roger>
 <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop>
 <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com>
 <ZBLg8WB8HCoZvwz5@Air-de-Roger>
 <df607690-0bfb-94a3-fac6-5e20f183dc20@suse.com>
 <alpine.DEB.2.22.394.2303161611220.3359@ubuntu-linux-20-04-desktop>
 <4edb59db-d2b8-122a-fc10-59001857bee0@suse.com>
 <ZBQ4DKJ8ZAroyPIQ@Air-de-Roger>
 <alpine.DEB.2.22.394.2303171115320.3359@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2303171115320.3359@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO4P123CA0298.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 9884b605-88f4-43dc-6496-08db2720941b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9ahHsaL/+cT4NNyePx0QSJqXO2mDN6CvHruD0gI/ffWxX1u5rUHlBcYIh9XXYlWr4XBNvjws9Z/TsZPKDJ8WVrL01zet/nSKD2QQ7Jb3JpDNGSlDoN/BhFi7dwrujb02edu1aabGqhxvC+NNO10hOQ6FZy6Qrqcy3FBWvNQuNn3oAB3/yYkojhfscUWpfebt26btyS+DS06LYx57KbNTksnYDpVbphYTveJFNLbZPfyy73WMvvDJpziGyfzcYzULRWi41pxgXl+T0XQNKC/y84NExsTShLa9ysI6gB1fzewtMjKlJ7K6v/Q2kzkfTSPhT2gsJVPwEhyMkjL28mlkVLLutq728x0MRRvde3VIqMBFHygcq+SYv+Im/9/DHDc+2stNrP5FcxfQ+LPstFUceUmUDENwvEIlboHB1iNW9aHZeSDGvJIH+1Fia8Zw3JYzevJO7nbHWVJ0VFEUwVHtDNiAtjMPAN1M+/IIxo7GSwe3PE5fC1Iu+zRh3AgiDKdZ/oa5b15MztmnQjHWqfyQDPVTVnHFr5GGFBmU8efUiHMH4YrSLzQUg3PeJ0yUlegAXja6v323VH4OM7wh+0EU9oUU6cTjNfD8AySglrx/cbgc0ZXVbEMr2XI/nse7YCHVN+XxwlACKWHL7Zg0O6GvgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199018)(6486002)(316002)(33716001)(85182001)(38100700002)(4326008)(54906003)(2906002)(66556008)(6916009)(66476007)(8676002)(66946007)(186003)(53546011)(6506007)(83380400001)(26005)(82960400001)(9686003)(478600001)(6512007)(41300700001)(7416002)(8936002)(86362001)(6666004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnJ3OFV2SnpRNGtCSThubE1DTGNuQTNZc3hmWnZua3BFcHNLV0NpOWQvcHJV?=
 =?utf-8?B?NnR6d2gra3RSbE5IdUYrbGRQR3MraHVFR2c5dmM5Z2xlUWdGV0FCVVErRkpM?=
 =?utf-8?B?YzVOR3JTQUcvVEZzUStkL0RtNkRlZVpQTGpwZVBIblltN2tteEJtTlpLN1NK?=
 =?utf-8?B?Z1ZZVGdCc0hyZnA1Z1hpWHNwamtZbXNMY016TUlWU0NLSk9zWFpmU2VsdDJV?=
 =?utf-8?B?bnJJcjhnQnRqM0J3aFI3Y0hlVUR1VHY0OEt1OGpMZjFqWmdwNWZLNi9IUjJ3?=
 =?utf-8?B?T0VrWlVNZ0ExWjNjRlpoeTZTcW1BVDBkUW9uYVpwc0U2eitZWFAxSXQyTFB3?=
 =?utf-8?B?dFBuZXJaUTNJcC95aFM0VW9jUHFva01yWGM4aEFjSCtHRFM4eVlmRUdMa2Uz?=
 =?utf-8?B?cGJ4SUdwYUJXU2cyeEd0b0FNRnArRHNVd0g0VVMwTzhPTzY4Ym5sK2RsQVB0?=
 =?utf-8?B?S1Z1ODJZMUwvc1ZyK2xFbUUvcXcvTVdlYy83L1Z1U1REYlpiOG43Z3RGeWcr?=
 =?utf-8?B?a2lDQ1M0ZlRqdkYxNktkQitCaGNIa3FNY1JmWXlTN3NMZnBJUHF1MmlVRzVS?=
 =?utf-8?B?MWM4Y2NKcFZUbGdqNElKNnRLTlpubjNraGYyeVNvekFnUzNpdjI0Y0VtUzJY?=
 =?utf-8?B?K2RZS0JTN3lxNGdxWkNGSG8zYzhQcFF2b25uVndEdktGVFVyMTFPWDkyRnRw?=
 =?utf-8?B?SlhJKy9nbkFscHNQYlBHQmhHcWl3dWp3RENTRHFZNG1OSGRvSGlkN2dVcWkv?=
 =?utf-8?B?aEE0LzEwUFZ5SDFIZ0FidmV2UlZwZnI3RFBoWEszMDBiS3QyNUl1Nm9HZnZ1?=
 =?utf-8?B?bU9vazZRS0JOa3dsRDNNSlI3OVYzb0llemxNZ1JXUXpORFZna292S0xPL01E?=
 =?utf-8?B?aWI2WDlQaHN1aUJHRG9SMUd1RzM5dW51QlJWTjRJb052U0dkQjEycTlyWlpv?=
 =?utf-8?B?SVlubitqKzEyVnFvQ3ZXMkFLaEhWVXZFNmg0cmc1ZCtJVTA3UmUyMVd6VFI3?=
 =?utf-8?B?bkdKa0ZXWWN4QVE4S0FFNDE3ZkY2dVBuVWlTREZOSlBjSjhqN0EzRHI4NVB1?=
 =?utf-8?B?SWJhZ1hOMG5GU3lRQ3lGTzRoLy9ycnc1MWcvcVBrenc2Zm8yNlBucWlJWi9r?=
 =?utf-8?B?YzdCeHU2VjZEeXoxZXJCZlFNQjhLdjUzWUZFRnRVTDREQmlxcWUvSTIvN1ZT?=
 =?utf-8?B?aHdqTExmR2FMUWZ6elI0RHhreXFkcnhqeEEwalo5K0xDNmptWUZYcnJVSHNE?=
 =?utf-8?B?Qjc1Zi95azJUZ3FpT204UERzK2hCTWJ0dlk1KzNLeXRRQWc0R1l2czZJaWdr?=
 =?utf-8?B?QlMrNGVrQlNuaS91b2dYMWtIZUZaaWlWUWNqL08zSWdXZEcrZkNqVW95Mk83?=
 =?utf-8?B?ODFySnM1MzZQQzgyWm4wSCttNXVLNCt1QTNteDhUa3h6YXFXQnJNdXViK2hM?=
 =?utf-8?B?TVZpUzB2RTlPa0lrc0tRZVJGUjZoc0x6bFNwa0VjbGJiSEZTYVk0N2FRd3Nw?=
 =?utf-8?B?Rm13MGtvK3hISldROGM2eFhINktGbFhqclA2Y0hEaWZlTW1WZmNTRjA0UmJz?=
 =?utf-8?B?V0dKUUNDMWw3TStrc08rYnkwKytGbnZaYitZdHZiZDlnaFFpL0srdktkaWdG?=
 =?utf-8?B?YUxDc0ZTM3R5UG83a3hONlRycmFkVE5SNmRoaHB4SFR1M21BWU8rT0RRTEhY?=
 =?utf-8?B?bVBtSVc0UWRUMHNnMU5kZ1NtN0FiekFlaUgyZ01HY2J4WEZ1aGgyd3VnUU1p?=
 =?utf-8?B?aTkwQlBFQ0xxeDR4YXRrSTg2ajV2Y1JSbDZ0RTFGb24zREhDOTJLc1RjM2Y0?=
 =?utf-8?B?eS9YRUFBMGpkbEkwcFZJeHpSQktOS0wrQUlZTjMxRnkwQjd4MEt1aEU2d1JC?=
 =?utf-8?B?K3ZyeFBsSjlyQzR5KzVqc3N0SVJiamJrcmpqZ01sdXF5UmI0MldtUG1yMEZn?=
 =?utf-8?B?NkFxYzhDOEZjTUZpbTFDSTFsYVRGMlkxckVLTmZSK081UjVSaktnUVA3cm9p?=
 =?utf-8?B?TDhxZElUNkRlKzNSa1A0VzFwQ1pLWjdraHd4NUVpbmFXVDRiRnFnTC9YN3dX?=
 =?utf-8?B?YU5QSnlpTm43THdGZ1JWa2dhSnlkTDhXZFNmQStFVm93M2d5WGNDNEhrTk5u?=
 =?utf-8?B?elBFZWt4L2ZjS1FMTVdlWUlPeFlMOGE2K0pURkM1SDJYUUlzS2hiT1hMNXFm?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q1Gw19QpKY4AXVDyFGUrF5gZM4amjE3IxGFmWwm1ehLFuN5e/XarmGkuY7onWePg/jGsj0GhIpjIDY13w8NcOsLJjiIK5lbvRM+hFkY8u6/I12rJ4Uqptp/7l41Oca+IF/A34Rap9v9MB5aUqb7D34WP4Fo7QEpeJG035erHMtpUjHDlvXpDvhjQUnGgPl00CZUyI+fy7cWoDItOT6tjLEMwFmSkOd+kMxxRmzDySCryoSCELW9s3Qe4H7ATKMPzS0TblupBdEaY54Vk57CtbNukJHML2wx9DzArdFYH9AIM3FZanGyXyORBfV4fqWyITvpDbB8EWhr/E5SIPjIHcs3KQX8Sh6KW4ErVT2tfIpEjG6yEWTgeOOaBZ9EdBDpM1eN+prThL7lyVJeCpEjITCk+ogMMn1X7J1d+p5velCJThv37RGxZLzhIbIXUMMUqS2cwVjF9r6O2xppFHDKXZsgDQ9sQYHTGhFHxRWzklG5t9ohaGPYau/3317PGmPAXUtTQkkqkDtsyJ5zW+jn/4y9Je2eSB7z7VH6jEo7/SaGeVU3tl/+iiiiPuyDo5HTSRm5VPJvf9GEbiE2qNSPJZY6BVGc/1XYALoJx3XATywAZAfBBbZ0UwfFSWzhtQZxk/nSJwtopZSHVJchWNSaFP/iQ7uEcD8mjkxSrGRRujtPxBDxyAiZ/qTCpTxZ7j7QMH87alioRb6GMPStfs4/2S8gqQscNNmNHLDDMMYLyUDJnDmTZ+Oay+Fudx1USE9aWL0ahY2bU521/niV/oyQy0q1g4QKaJNtnLUFypQLLxo+HfbhgSkxlClXzeOs6dtscQMZpkBWfa6duecMQPmntGJfOBQk0AKEseMQUY6NLUBeYJJKWgBDGCFiHUoa3nOTs
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9884b605-88f4-43dc-6496-08db2720941b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 19:48:28.3481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYm8Z1wqViB75WxKbaLKWxGPGuCQgaumwiGfkCWHx1RVdNyX5gLt4fhKcJ40QMZveqkdi/KxCVgsaemo19MdYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5011

On Fri, Mar 17, 2023 at 11:15:37AM -0700, Stefano Stabellini wrote:
> On Fri, 17 Mar 2023, Roger Pau Monné wrote:
> > On Fri, Mar 17, 2023 at 09:39:52AM +0100, Jan Beulich wrote:
> > > On 17.03.2023 00:19, Stefano Stabellini wrote:
> > > > On Thu, 16 Mar 2023, Jan Beulich wrote:
> > > >> So yes, it then all boils down to that Linux-
> > > >> internal question.
> > > > 
> > > > Excellent question but we'll have to wait for Ray as he is the one with
> > > > access to the hardware. But I have this data I can share in the
> > > > meantime:
> > > > 
> > > > [    1.260378] IRQ to pin mappings:
> > > > [    1.260387] IRQ1 -> 0:1
> > > > [    1.260395] IRQ2 -> 0:2
> > > > [    1.260403] IRQ3 -> 0:3
> > > > [    1.260410] IRQ4 -> 0:4
> > > > [    1.260418] IRQ5 -> 0:5
> > > > [    1.260425] IRQ6 -> 0:6
> > > > [    1.260432] IRQ7 -> 0:7
> > > > [    1.260440] IRQ8 -> 0:8
> > > > [    1.260447] IRQ9 -> 0:9
> > > > [    1.260455] IRQ10 -> 0:10
> > > > [    1.260462] IRQ11 -> 0:11
> > > > [    1.260470] IRQ12 -> 0:12
> > > > [    1.260478] IRQ13 -> 0:13
> > > > [    1.260485] IRQ14 -> 0:14
> > > > [    1.260493] IRQ15 -> 0:15
> > > > [    1.260505] IRQ106 -> 1:8
> > > > [    1.260513] IRQ112 -> 1:4
> > > > [    1.260521] IRQ116 -> 1:13
> > > > [    1.260529] IRQ117 -> 1:14
> > > > [    1.260537] IRQ118 -> 1:15
> > > > [    1.260544] .................................... done.
> > > 
> > > And what does Linux think are IRQs 16 ... 105? Have you compared with
> > > Linux running baremetal on the same hardware?
> > 
> > So I have some emails from Ray from he time he was looking into this,
> > and on Linux dom0 PVH dmesg there is:
> > 
> > [    0.065063] IOAPIC[0]: apic_id 33, version 17, address 0xfec00000, GSI 0-23
> > [    0.065096] IOAPIC[1]: apic_id 34, version 17, address 0xfec01000, GSI 24-55
> > 
> > So it seems the vIO-APIC data provided by Xen to dom0 is at least
> > consistent.
> >  
> > > > And I think Ray traced the point in Linux where Linux gives us an IRQ ==
> > > > 112 (which is the one causing issues):
> > > > 
> > > > __acpi_register_gsi->
> > > >         acpi_register_gsi_ioapic->
> > > >                 mp_map_gsi_to_irq->
> > > >                         mp_map_pin_to_irq->
> > > >                                 __irq_resolve_mapping()
> > > > 
> > > >         if (likely(data)) {
> > > >                 desc = irq_data_to_desc(data);
> > > >                 if (irq)
> > > >                         *irq = data->irq;
> > > >                 /* this IRQ is 112, IO-APIC-34 domain */
> > > >         }
> > 
> > 
> > Could this all be a result of patch 4/5 in the Linux series ("[RFC
> > PATCH 4/5] x86/xen: acpi registers gsi for xen pvh"), where a different
> > __acpi_register_gsi hook is installed for PVH in order to setup GSIs
> > using PHYSDEV ops instead of doing it natively from the IO-APIC?
> > 
> > FWIW, the introduced function in that patch
> > (acpi_register_gsi_xen_pvh()) seems to unconditionally call
> > acpi_register_gsi_ioapic() without checking if the GSI is already
> > registered, which might lead to multiple IRQs being allocated for the
> > same underlying GSI?
> 
> I understand this point and I think it needs investigating.
> 
> 
> > As I commented there, I think that approach is wrong.  If the GSI has
> > not been mapped in Xen (because dom0 hasn't unmasked the respective
> > IO-APIC pin) we should add some logic in the toolstack to map it
> > before attempting to bind.
> 
> But this statement confuses me. The toolstack doesn't get involved in
> IRQ setup for PCI devices for HVM guests?

It does for GSI interrupts AFAICT, see pci_add_dm_done() and the call
to xc_physdev_map_pirq().  I'm not sure whether that's a remnant that
cold be removed (maybe for qemu-trad only?) or it's also required by
QEMU upstream, I would have to investigate more.  It's my
understanding it's in pci_add_dm_done() where Ray was getting the
mismatched IRQ vs GSI number.

Thanks, Roger.

