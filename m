Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C12736B2E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551706.861363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZjD-0007nB-G7; Tue, 20 Jun 2023 11:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551706.861363; Tue, 20 Jun 2023 11:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZjD-0007lG-Cw; Tue, 20 Jun 2023 11:40:55 +0000
Received: by outflank-mailman (input) for mailman id 551706;
 Tue, 20 Jun 2023 11:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnc8=CI=citrix.com=prvs=5286b1552=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBZjB-0007l5-5x
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 11:40:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ce1bcb4-0f5f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 13:40:49 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2023 07:40:41 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5709.namprd03.prod.outlook.com (2603:10b6:a03:2ae::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Tue, 20 Jun
 2023 11:40:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 11:40:35 +0000
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
X-Inumbo-ID: 4ce1bcb4-0f5f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687261249;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ay9VvS/RmRP9XTTwv0lLkTzvcNszJhSnLcZzF1ezSik=;
  b=Gc1Uokz0V2AI72DaagtRECBi+IEuD6EracJMSShhkEru0smKLR8vH4bM
   PpCImaQwfM5UpdytyVo1z2c3vaiwFGObDpUIKxUlsGLD+2pjRo9wl0tnf
   LXv6Uok3nsxLnq9KWNCgeRWFd7Hd3uZ0fFdELHCU2D7dRteUzbFbe0vdx
   Q=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 112195263
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jpBRNKKAyGPRIRBIFE+R8pQlxSXFcZb7ZxGr2PjKsXjdYENS1DRWz
 GAeWG/TO/vYMTTyL913Ody08hxXv5PTz4JiTlBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4AZmPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4wRn1gy
 OcpMgs1axel3bmaypGYFNNz05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqhAdNPTuPjnhJsqASs4EURJQExblThnNfpyR+MWe8DE
 GVBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ5sOcmSDps0
 UWG9/vrCiZoq6a9Um+G+/GfqjbaBMQOBWoLZCtBRgxc5dDm+dg3lkiWEYglF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:oKTiM69ZCqgTnFAA0xpuk+DwI+orL9Y04lQ7vn1ZYhZeG/bo7P
 xGUs5rrCMc6QxhIE3I/OrrBEDuewK4yXcY2/hyAV7mZniEhILKFuBfBOnZslnd8kTFn4Y36U
 4jSchD4bbLfD9HZKjBkW+F+hUbrOVvMprEuQ4T9RhQpMhRBZ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3ATOhS8WrYyTboU65B43nCGdnmUYdiblPg10bKGHe?=
 =?us-ascii?q?9DkAzE5GfanzOwrwxxg=3D=3D?=
X-Talos-MUID: 9a23:1FiLeAU9LYcet6fq/GbTohhgGdtP2Kv0NW5d0sQ0ufTYDgUlbg==
X-IronPort-AV: E=Sophos;i="6.00,256,1681185600"; 
   d="scan'208";a="112195263"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNPYUIrBLsMMxVTdAzewg07j62IbkGtj6dDVQnrzoS40esumA6B24qXVuHaBr5gzVJefDEAH34VIq4U2+FAP5O+CTYIudvrTIxvlZkqoy5kXXa1GWSR+Qviera4i0N6JsaNBlIcf1dCTQQkUXkkObrW8cRHA9mEFs1IBF87F5/OsGID6QXT8yl2fk+Z1gsabstjrEBolHicxIdkNNiNbnbQ+puSd2JFY1Wr1UjCZG6MnjRyOhMfNGfhJZS/aZhCV36thcAsSJOQAQ1IyKY06LabaGurTwugRptoXLLqytgPJ+oXYrseC+6f1wd0Q6oaKgIQfKLm0oyGs1IMfyb7GMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0AYFJHfbsWuBl8JGJk71EVGbbM5rg9eQnbUWVghgUk=;
 b=guoPV0C4hKQkA6krMNM3/jq3pB8SuyFBKaaOZQ7ZbWyj5faBOPBdebr5J/CEXg/oWHzUab5Q2BzRNaQd+9YRBE38i0rFp+CMZMJ+JMoFRQ33LtOH/cUT/JCtVqCfoh3Ly6Xn/RCdGAYmDFR0jiFQ60BWD09nxExhKiFW1+dqJYL93jusyth4g8nmWG+Ll4HT4XOXNoidvFz4UJRDZeD8AqK1IuQrM2fR8zAdNnQgC0PiGtlPIznlh1C16DWGbFMZIfZc3FB+4jKY0n4lRmOTJpejRs8uLT4CTr1/aX3lOx0BrpoXOVSvVT1WyMuVROloUaArD+bAkDhIap+L5QY2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0AYFJHfbsWuBl8JGJk71EVGbbM5rg9eQnbUWVghgUk=;
 b=kDT2jKMezwIZ3OvTHDd4cTgv40DqqdawRe9etM89NdC7AfrCH3/KMbTt2LQbr4tSlUCTtNWsi1jR8dKV9XfabU9nm2Mfhlx09A2viozu1dxvvI9FaAAS4tvXLjgWLcRKpIGm7DfrnVLXgKkkjKYd3y8eToySeI5ynyIc1z2ytJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5fc59b12-dddf-3d37-6ef1-d68d8cb81443@citrix.com>
Date: Tue, 20 Jun 2023 12:40:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/13] libs/guest: simplify xc_cpuid_apply_policy()
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
 <20230616131019.11476-2-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230616131019.11476-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0574.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5709:EE_
X-MS-Office365-Filtering-Correlation-Id: 08cf8b72-3c0d-4eb3-b204-08db71832900
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qDqjlCyc+pgPHUUspx/p9Dk/REklUYc09gfvSDOj9B+vYtQX2Jzra5EuJOKnidsS7N4PmWEViqbJX93a6DJetjAJ0JkU0fDAWW9cAm93NcQJzEU0ymSAgawNE1WxRwcG9hg/LgoQgmbcTyVi8cKDXTYmHpshkgkC+opDaq0xJ+TaLiWEkG7bgVmhWeluDBQkaGKGn7UNo+eA62s8Se0BdK7BV36hPqfdUgsrJt6aG7pb6CY604B2OeZjfqMn16vP2WaSJhDp3WmOjB6Zx6lGmZo7uhL9GIeUwugiYoJCcJm179XvfOLZLXTl9geE5sJN8uVtM9nq152rLpFeXFhWa21Cjf0cZVu2aUj50g8+aWIPrRUIOT/t1lIwaJPtK5ATFKsFtHH4yGPZIkJDOw1Z2+41rW12POHskTxOERZC3RD4z1tl65GBKXyrO8FdfgHaUHa6wU39EWdZda4UARFVwB9GX0kyU5gpelXwc+Vq50ndO8hc6Xrseov+xB8krSHvaIAklCMxbxjiN9y6frq6Oy8gZDQTfhDlXx+E9rgOcvQZ/3IMUz+4xtGHDHPLyG6aGOz3sJbUCStJnMPW6taBCb6FWXq6zwpqxf8nXOu/3iLHaSlXgiLL0MKTKO1i4dQDaBhDDUIalL0LhpYA7LTnWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199021)(31686004)(36756003)(5660300002)(66476007)(8936002)(8676002)(41300700001)(86362001)(66556008)(316002)(4326008)(38100700002)(31696002)(82960400001)(66946007)(6486002)(6512007)(26005)(2616005)(6506007)(53546011)(4744005)(2906002)(186003)(478600001)(54906003)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cERVM0FFTTNEZXdhYjVPa25CY3FBWGxkSy9jNU1VMzA5Z05GckRETU8wclcw?=
 =?utf-8?B?UWRKVm5qcXo0MWJjVlFIRDNJZjYwbnhrc3lkMUdpR0JSajd0a2xlR2huSzlI?=
 =?utf-8?B?RjdDTmNWbGhHMG1FTmY4ajhLZUdJU3h4R1ZFQzRzdnA2YnVKWjk1NGdDbHdq?=
 =?utf-8?B?Z2JBcXgvbWtZNWJMcWJieE9BT2tsbk0rMUxPVm5vM0dJbFlDMHhtOS80Sm04?=
 =?utf-8?B?TXFBWXE5SGltMEYzSUMzSkZXOUhWSlZYcDdmcjAxQ3ZDQy9PZzNrTWRKK2FG?=
 =?utf-8?B?VjhYVzJVWU1WdU5OMmpDUWxrMzI2eGMwQzNNcExHT21GVVF3RXFqeTd2aDBO?=
 =?utf-8?B?Rmk4SFZiNS9pVGtCTWpMekhrZ2ZrQVM5UVdRSlZzMWZtNUd4dS9KR3pxaTdF?=
 =?utf-8?B?M2lvSGlXMEhuNFpXclVLeXNYV0RSY28yOUhXeFhPRXZxc0RKdzZjYXE4eENT?=
 =?utf-8?B?ZUNBdStNRjlTS0NnY2FBYmhBT3o1SlNBY0E5eC9mNnlvOXMwM01ZazRqN1pm?=
 =?utf-8?B?WjlOYjJTbndyZWZObnlBcnE0dkV4S2srMnZhUjgxRW5YK29VaklDcElyRHgy?=
 =?utf-8?B?MHEwRlJJMGRqZC9RekhNVW4xQytDOFgvTitZUzAxbkVWK0kzb1AvWVpUS21r?=
 =?utf-8?B?VmJDem15K2RwQ0hBcDNzd1dQYmlUeW91c0k0MldOeWhJS1AyQ3I3LytEbmEx?=
 =?utf-8?B?MktRd2p0ZWlRenowUFJ0bVVTTThvY01oYmYzWFhGclZvRWRQUC9VQ1RjMmQv?=
 =?utf-8?B?Y2RiNDd3enhQTGhKemZYd1Zjc1VDLy8rQkw0L0RDZXdSRnVDZ2hxR3BSRGJ4?=
 =?utf-8?B?bHNoL1dqVGpoZnYrYzlVQ2x0Y0UzTEMrTVpseHI3ZGRDakNOS21VdnBsdTl0?=
 =?utf-8?B?RzZSYzBGWlZHMVFMY2prTkNwTHdibDBGUEhTem02QkRaT0tXSFZhZUtZUG91?=
 =?utf-8?B?YmYwcmRBdFZZRXJpbGdZSmtDRTVic01aNlhEQXZyaXZ0SWs4N2JmRkdrSVJp?=
 =?utf-8?B?TUFMS0JsTEp6QTllSHlLOENaMGxuRDBlL2pVUGtvKzFlQ0tqaVZlYmdhVzh2?=
 =?utf-8?B?Vzd3M3ljanpvNEdXaUFBdWRMRUQzQnJ5dU5md2dTMitsYkJZQmVoVE5VR2Y4?=
 =?utf-8?B?am9xQUhkVEpXV1BiTVpqQTBHdFhLR2F6NmZzRVRvTkFpSlFMcm0yVjVzblNU?=
 =?utf-8?B?WndGY2hGb0NxMnp6dmxxTjZtNXhxcXJWOGpVWDVDMlRvUmFKSUVsRjNVUHg0?=
 =?utf-8?B?OWRNNktGRUR2OCt4MjVDUndzcTVtR0F1eXNCY3VzV3pRSEt0SE5NTHpJVmZq?=
 =?utf-8?B?a2szVnU4d1BRTVlKZGRXM2VNMkdZV3h4RDdwSWJSeFY4dkc0R3drRE1ubHN6?=
 =?utf-8?B?SG1TNHhMMXhpaFI2VUJGTlo3VGt1ek1yU1o1TmIrR2FLbGxOVXBZTHFYMEky?=
 =?utf-8?B?d0hNM1k3TDJ3S0ppUGF1YWFLUktzemRhSzdZdVVWRS95aWdCRVF5MlQyUzcw?=
 =?utf-8?B?RFJYNlVXQlVUVFhQaGVnb0llbzdmT3ZGaXFLVVZhU2kxa2NoQkdrMnNLN1BD?=
 =?utf-8?B?bW5pWTc4VFYybnptMWt3OU9VRFVsaGlIdWdRS2twVHVGQkwyS25XNGZjNDJ1?=
 =?utf-8?B?SHRMa08wOEpyZS9IZnEzTXJXM1pxSDBLMWlzZ2RoV0RMS1Y4Q3JXbElvVlZL?=
 =?utf-8?B?bXdyUFhiYUVXUkFrNkUrczZnM1lXcVIzQlkzZ01UbWNDRVJLdDk3emFaczZ1?=
 =?utf-8?B?amxFRXFvaTdUNmtJK1FkL1laeVJ0ekcrS2VqQXNKdDVUa25jd1dqbjk1VlRH?=
 =?utf-8?B?QXNPbGluSFcxZWtpd2hob0lsOUNxZStmUWRPR0xRNmREOW8zUCtSaUk2aEhO?=
 =?utf-8?B?QkFCOUI2TnVvUkhsWHJEM3BRTkFZU0lxb3VFWWRoMzBudE52Q0YvM09CbERB?=
 =?utf-8?B?OHhJdXBVbWt1NmovZmFnNjFNMHJUUEZieDMvVVlaODBGS2NhVjhiSWloUG4z?=
 =?utf-8?B?Y09JZ2h2VTZZOTlpRFNqdVRIU09GNU9QbFBxNUVxMXJxQzQ3TnluYmRUVi9n?=
 =?utf-8?B?amtWZldyekttQzNiVFFZcGZrZysza0p0cEJqR1l3R1NYNE1sTlc5MjBmOEoz?=
 =?utf-8?B?UnVsT2o1RzI4ZFhxNDYzZWhCRnJEQitZR282Rklsc1hTMTAzdzdVdFc2aVo0?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LdGCuOOhmRt3Kr8ZjpXSkIP4GJeF7EoSxKUnrlqttISpPgOpivRRemg+SfYU5XxJiiYHfK8+1LioP2/NmAYTsmQzvUWgC9Yks+iBvGIQjU1a54k+iwO8gEWuAWAzw+Giw98yBs7gn8QAgyycaUhHLnFAJvrOV1cobESBZcNGprybKpx3/YoljGAgU0y5zaoL8msefLAVPH7VsXxCsBvtCxnV7DjinwWFmeCFQh1HnH6gQXCq6vDv8tCbbGaxhSLsbfPoYyTuPpXHZOx0depPGoKNNsmZ34lstK6SvE+42hYnwGEYXoNdMl4KmBlDfcfYixYKzprB7E7H2fmrpQ/KK/y1nxqGujH6to9PkZd3/ASfe3y6rUys6Bfpcl2iv5WhstjiczDHWdnS8DMke2LbRnfRJM98MI4zQQ0aJq0F9MYopPnRCHYtrdgfjmel9Cynf+qYBNgicKrru9otWhKFxrTlW+b63yvhxnF+l8+ILyw8tKoNFPgmVg19PH+D+TK/TlZ/gM+8dC9TIr3R3gNknSK4Gv3lGmKPysnzujnvSxaz/7oy8iUVetlyx3jegiLDs2Y+VArPWf+1NCNANi7uiaDU/5PUeYU28fn/7qK/m4BtbfGwjjZv+jZ/IZYp7qcYR2Ba68Hjq5TALYe4I+I3juWc01Vp8xBeYOl91RvdEJANH6G3puYSHUjFnyQVe3ylyxDod09v3cXnRrCJzHa6c3Sx38bLuZEB3JvqIs8AgzsFFQQbGpG3QxwdiXdSWls/SMByGzbKN+lTCjuRmkHUQCT8+ioJuOdiyKwntSwiUleZ227/iGWHkB204Hangd3h7xfwSIXKMNYoI2HDCc/dWA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cf8b72-3c0d-4eb3-b204-08db71832900
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 11:40:35.0904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jC8FSVXwUMN0UNDdKk9mBG5eHiK2JI7jCKnLW2SVMVTZqtzIesGmdEOSN+7kWA6EGwwT48VEDt1J/uSNwz3SJMXIyebw/619JyjokWU57A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5709

On 16/06/2023 2:10 pm, Roger Pau Monne wrote:
> Introduce a local xc_cpu_policy_t and use it to simplify some of the
> logic in the function:
>
>  * Populate the introduced xc_cpu_policy_t with the current domain
>    policy, which will already be the default for the given domain
>    type.  This avoids fetching and processing any default policy.

I'm afraid this isn't accurate.

Right now, xc_cpuid_apply_policy() is idempotent on a domain, but after
this change, it's only true for the first call after domain creation.

I can't remember if we depend on this behaviour right now, but my gut
feeling is that it's going to become more important as we gain more
opt-in features.

~Andrew

