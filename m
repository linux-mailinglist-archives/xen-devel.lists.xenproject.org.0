Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E2F345B7E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100555.191666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdpY-0007aA-BB; Tue, 23 Mar 2021 10:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100555.191666; Tue, 23 Mar 2021 10:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdpY-0007ZY-6N; Tue, 23 Mar 2021 10:00:08 +0000
Received: by outflank-mailman (input) for mailman id 100555;
 Tue, 23 Mar 2021 10:00:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdpW-0006c2-UG
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:00:06 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08a15162-6565-4df7-851b-84c50e21e68f;
 Tue, 23 Mar 2021 09:59:55 +0000 (UTC)
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
X-Inumbo-ID: 08a15162-6565-4df7-851b-84c50e21e68f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493595;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ZVYTmperKRV9McJzyxCAMKd6T4Q9wkkfiMKYTjTYp9w=;
  b=dkVnjy0gR4LrRC0Xasy3u9aB4z8bf17VBfDuLCLFqlNp9uf3r87S4jQv
   yDqug4n8kwN9fTNE0zyBv2cWzF48yIGD+evIrtFl+NZoj8eJ9Avvs0Sgr
   aENs14LfY7LQSVOk2gGe6TvLf3V05zu8bFAlJW4r3FYosV1TbO2lndvbP
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zsTGLXBLhxYbWYKXJA9GMzC2QetVFtT0b5xaIsrP9D/HyQnfLtQ6XqN3z9HZwqm3/0AQCZ6FcN
 6w8f40D2C5G4ZKt9O0/BczjbtxGICu5/if5Fz+slxinUg7N028u4IS22pg3p/zTPk+Iv89dg/b
 DlGpVjWFgf/vliqOIXKk8Y8qha/cujY3pRbYAbuQ13dPjk6/Ye0zuQoyWQ8ZK2LOdgKlB+UXN/
 Wqbkj4xuhbjkL0I6KSZsQbnWggwIg/VopWx0S3UKqyuIWDjgvO7q8DjMdku3O7FqZ2xqD39xjn
 4Zw=
X-SBRS: 5.2
X-MesageID: 41330285
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:L3wV46nGF5Al2XbVWrWsGRE9wuzpDfOpj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0ZNi+wOCRNNW17LLA+E4
 eR4dcCmiGpfm4ZYt/+Kn4OWeXCoNOjruObXTctARk75A6SyQ658bKSKWnk4j4ycRNqhY0j/2
 /MjhDj6syY3c2T5xfA2wbonvJrsfT7zN8rPr3vtuE0LXHWhh+sdMBdXdS5zUsIicWOzHpvr9
 XWuRcnOK1ImgPsV0W4uwHk1QWl8BtG0Q6a9XaijXHuodP0SVsBYqIr7+IpEWqq12MasN5xy6
 5N1W6C3qAndy/opyjh+8POEyhji0vcmwtSrccok3ddXYECAYUhyrA3wUU9KuZkIAvKrKojEO
 VoEfjG4udXfV6wfxnizxdS6e3pcXIpEhicRE8e/uSTzjhNhXh8i3AV3coFgx47hd4AYqgBw9
 6BHrVjlblIQMNTRaVhBN0ZSc/yLmDWWxrDPE+bPFyPLtBJB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMynxvRwg1DwaVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA/fcR+
 24NPttcr7eBFqrPbwM8xz1WpFUJ3VbetYSoMwHV1WHpd+OBZbtssDdbfbPNJvgGTspQQrEcz
 k+dQm2AP8FwlGgW3f+jhSUcWjqYFbD8ZV5F7Wf3+V78vlJCqR89iwuzXip7MCCLjNP9oYsel
 FlHb/hmqSn4U2//WPC6XRVKgNQZ3wlpInIYjdvn0snIkn0ebEMt5G0YmZJxkaKIRd5UofwHB
 NAoU90vYa6NYaZyyxnK9/PCBPVs1Ij4FaxC7sMkKyK4snoPrkiCIw9ZaB3HQLXUzpvmQhrr2
 9HQBQeRlDWEw7vjanNtu1WOMjvM/1HxCu7K89drnzS8W+Go9s0e3cdVzmyFfKMjR0WXDpSjF
 1p+6o5iL6N8AzfblcXsaAdChlheW6XCLVJAECgaJ9Pkr7mQg12UFyHnCeXkR01Z2rs+XgDn2
 CJF1zmRdj7Rn5m/lxI2Kfj9115Ml+QeE99cVhWm4xwH2augAc57ca7Io6Il0eBYFoLxe8QdA
 zfaTwJOwV02pSczxiOgguPEn0g27QjNuHQF64YbrnWw3+hQbf4050uLrtxxtJIJdruuugEXa
 ajYAeTNir/EP5s9AqPpHopURME3kUMoLfN4lnC42e51nJkXqaXD1RiWr0BI9aTq0LjXO2F1Z
 1ljdQz+cu8W1+BHuKu+OXyVXpkLBiWnEudC8cPgrpQtbgptLRyE4LAOAG4nE1v7VEbFoPMiE
 gaQK5H+7jPNY9kQtwKd0tijy8UveXKCHFujxf/DeA/d2w8lnP3P9uG5LzTtLoka3fx0zfYCB
 26+y1Z8+ytZVr66ZcqT4YxK39Rck4y9TBL+/6DbZTZDGyRBqt+1Wv/Fn+2a7lGTqeZXZ0Wsx
 Zh+tmN28uabTDx1gyVnTx1JMt1giuaaPL3JAKHAuhT9dOmfXyKn6ux+ca2yA7NdgHTUTVQua
 R1MWoKbspCjTE+jIo4lgiKI5aH3X4Noh95+jFollnkx468xnzUdHs2aDHkvg==
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="41330285"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oclrcvNmzj2wuqpOxjANgH8/TsyS9/JnZkgsXm9BC4kVqI4eztHg30VoxUVnpL4EhhCwr5fKNVOQkbjfIYSHi0XdXSohU/Lcd/8ENteNs5aViutq5fL9XxV6mVqREsdmz3VxE3weFaKfNdzDHpXIzPJ3jr+JujfWEClD5paVPXb0CcSvV0DX8dpthKeQa4Scs6dgm/6wPIHNORPO7cEKRvH7H3KocnqO/JpJTjf1uCPjl/7+ZR4Miq0l9X/AosSJQMBiXIV+XwUC3nDwDUNMaSPXqgnRyc49T6h4tJDKEB6AMBKp4RCgdnCZpyxDfz8SQQrb9srkVsAV7Ac2JJkXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWrNMyZoDfL7l68Ms6pfloMPkzoINCdhTAU0j0iWLHk=;
 b=S+vux3G4QMSmkxwzwh4gQ/lXm0X+iK8XXvWEw5busNVYFXlSOBoiM7bWr8YKzofRw85id6NxtjUjrmaXbwwXoxSBLRqJPB02z18zpy4trt211JGudVHU+F8z9u3hkFLjkMgBKa+AlYGWgAtFBW3RTgFUyk6+6+d6cxMYU/0q4Kr9I4tXmFmJfHeZE61M+a84HbbI4Ep5tGCGNTaPQCf4O6GbiHquR0DyKv8X1dRrHwlItJocjwofcSXHpX7zPhkO5Jgk2iIz2UgTCtFkkG9Ewy4+huah26I7Ev0H8zgfvQ191yfKknuX6FARy5kXj5VVETxPNC//4bwOevOVjo9Ypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWrNMyZoDfL7l68Ms6pfloMPkzoINCdhTAU0j0iWLHk=;
 b=F2El6fLpy8jPpQ1e1rIl5BUZyaQgUBzt9mTPA2P+vBxMcBuBUJe4QOmHR/3CyMaD8/6zucl8IQfUUr4h/oY1pybK9tav0T0HX4eQf/C0oufufJL1rEi8AjVFUc/ny3uF+f1DhwgqwJPqKl7ccJU+oosnQrt1giJ30/fRZ+/OyN4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 02/21] libs/guest: rename xc_get_cpu_policy_size to xc_cpu_policy_get_size
Date: Tue, 23 Mar 2021 10:58:30 +0100
Message-ID: <20210323095849.37858-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0036.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c01cc99-ae16-43d2-eaf1-08d8ede25dff
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB263316220AFE38A5AD83DF078F649@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SuSm21468e2b8FGwOzyziLa7rDWRJ5tMoY8dmwYT6F7xEizIo2HDcvv/cmsor8WwZlwQIjudiww1bZ671BwWncziaB1gxVpEMXizJFsmZAdqWmsyDMG9dk9PE3gJrOZFBT9UN3u5rz57F0s7G/dFcbE1TQGA5fy4wn0scOh+d3GjJmmwUYzu+VStIW3zv6nXAH4sbuO1kqCIOses0xEcsy+558PMaEmQzjBR3q7DKZoazeq56Sq5C2d5NGZyFPWoRLD61RxoRCzU65nTtyhhxwhtxsF9TniUcc4JE7oSgcvOt+Zxdj1K+17x1ITrGMbokCkpByYz2TXmCNBQzOTPSfgWTsJFWXESspaSbqelHmjOVYXtMVRnxq6js38SnbVCbej949Zm7my5KL8KpTaLzS4XxhK4zay3bhqLKf8OCMCbh8VDIemh9uaeQBz+vYTfawDK8uIKztkLtfUxhLR861+W/CweBIA+CqVOf/x/n3LjxKfdwDBFVqdiuNXI7UKUUYVKXd6Hz63IVHGVkQTFXoJWNPpskE7l1e2Ve5zA8t+aTUfMAORWlp5qtxcDs2TqcUQXYzXJMKbPG7LOWTnMaR7NLdpp2WyKR9N3r0Dh++gPwsyBIIc87XyFh4+33+wDoovXHh0QuqrBBd8FQ9uwFxaPOA35AQoErXbDO3GEzbI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(6486002)(6916009)(36756003)(6496006)(2906002)(8676002)(66476007)(5660300002)(186003)(66556008)(66946007)(8936002)(86362001)(4326008)(54906003)(83380400001)(1076003)(16526019)(316002)(2616005)(38100700001)(956004)(6666004)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aW9iTG1melFweUFNSDJFamNPYnltZHF1VXFWTnY3YWVFNEp4OU5oQ1RkTFps?=
 =?utf-8?B?RDRYQnhmL3NFM2lUNFFxWW1pcldMNDVnNzRiRkRmMW1EaE82UUgvSGZ3S3F4?=
 =?utf-8?B?dlBmaCtNUjVQbDNsaklLdTZUTFREc0lQUjFMMW5tUWpUNXhPaFRjUENZRjNQ?=
 =?utf-8?B?Y0JZMWpaTjJsVUNmM0pBYUF2clJjdGFYMkp5TVhLV3k4YWhVWFFQRVRWTzdk?=
 =?utf-8?B?emxldmFkZU5HanlVcE4wN091aW1PZ2QyTkdveU9aUUZESzYxUTZoWUllMDZV?=
 =?utf-8?B?bWRCNy9KVnJGNk1McGVOWW5DZldsRmxHdm9FVnZRRFN4UVk3NEpOdkFuUEVQ?=
 =?utf-8?B?WktFYTNlbUIxR210WTZXWkRqVUp3WHREU2dhaUNLT0NiZ3Q4bWRJS2x4bDdx?=
 =?utf-8?B?anQvaTRUeEJmQnBwWHV4cUd1ZHUrSFlIbFJLWkhxUk5UaFhzWld1MlcvNG5w?=
 =?utf-8?B?cnFIS0x2Ty9QZlRQTzNJaXd6RjloTTJVdzk2NC9LdVVBVnR4bVhJYnltV3VX?=
 =?utf-8?B?N3g0L2FZeitwY0hESG9URjE0ckhuSU02ZGtVT3QxVTFEZzhqUDVjQ0p2R0pL?=
 =?utf-8?B?T1JUeDVmZDJTemp0eWxza0VzMVAwdHRtNHVMUDYzSlFkQVdMUUkvZjVEWFdm?=
 =?utf-8?B?M0FUOWhRUldBNUJKZC9NMCtEUVJsNVFFWTVVZzQ2RUlZRWhQU2NtNi9lZTVi?=
 =?utf-8?B?M0MyWEVsc0FoczBWSEFpOXY0Um9iaGhMeDVXTEdObXZKdzNmdk5lQ3BEWUZP?=
 =?utf-8?B?RG55d0tYV3dhcmM3UUZkZkROWkpXakt4eGgvRUZ5MDlsUVRKSXZIcGVOOGE1?=
 =?utf-8?B?N1F5QTNrVmxvN0x5RUVRc0FwWklGdVRCYk1paGtvRWlIbFl4SnkwNXVoS0tM?=
 =?utf-8?B?azhxeFRrUklmODd6eTgxTyswcVdYQjMwZlM4UFlNQ1NLQURSVWphYWpYRnM1?=
 =?utf-8?B?amQzMjZ5NHdMQ3VSdjVaNldqd3BBMnRxTlhodEYreVpTNkpBM21NZUhBUmxC?=
 =?utf-8?B?ZXFFU2lYUnFIM2hxNkdZUXlqOWF4UVpKeVFrSyt1WmpKclFXbWtrVjBuQXdq?=
 =?utf-8?B?SWV5M0lBaU5xWDVOekpua29rUytpYi9tdXdITmU3b0RLNG1xNWZNMVBGQ3hh?=
 =?utf-8?B?ZFZlRTJTUGtjdUNWL0UzRnZnbkppZlRhcUNqelhHRXJVZnpIaWJPRGFUdkNG?=
 =?utf-8?B?c0J3VDIzV0dHdlFRUlQ4NGRtUTJKVTZzZDdJcDVleVkrVlJ2S0ZkelQ1OHhN?=
 =?utf-8?B?TmJQa2JRdUtSL1hNSmRMMXNIT0RLV2hkaGZUeml1eDliY001L3ZaenJRK20r?=
 =?utf-8?B?dkJ0NndCUmFXdndWN3hFUWZ4ak9UaUhLOFZxRXlmdmJaNFFkTFNKcDRkQnUz?=
 =?utf-8?B?alhyYXhjVWNtSk15d3U0cEF1QnVVZmVPUm16WTNHVUR6N05zQ2tTb0RMcXl1?=
 =?utf-8?B?bGM4NHpmOFNGczdyKzhGaDNkOEhNMHZRUFl5c01Zd09iR2pvQTNLRjd4eGpu?=
 =?utf-8?B?WndWOEV5YjlMU2JWRU9mdDFTL09WME5iTkk3YnQ5THRHYWx4ZENrcm9FOUZs?=
 =?utf-8?B?Y3N6VmQ3bXZ0TklwbFdBNnU0YXdRNlRxaisrQW0vSHVLM0ZRb0h2Q2UwUTEr?=
 =?utf-8?B?Y1Y2NS9LQkg3aWcySXVJWVJpc0xCdG5mSWxmRmdrVGkzbXhDa1VIVXd0UEdt?=
 =?utf-8?B?TkdpVUI4ZGlkWkZQd2l2dmJZSTZjM1ZtTXB3dXk1NVdQNnpqT3M2NzBBc2lt?=
 =?utf-8?Q?dPlHcIAZc7DrUT2eV/OTo93B/yncqPkIz/y/K6i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c01cc99-ae16-43d2-eaf1-08d8ede25dff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 09:59:37.0391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgl8PCupPskFSKcEjFaWNRmUte4VK18jpetpjDr5rwt+9ky7SDkA8R8WXreH1yiBmOp0+j8aeulzbuPA8G7j6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

Preparatory change to introduce a new set of xc_cpu_policy_* functions
that will replace the current CPUID/MSR helpers.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h             | 2 +-
 tools/libs/guest/xg_cpuid_x86.c     | 6 +++---
 tools/libs/guest/xg_sr_common_x86.c | 2 +-
 tools/misc/xen-cpuid.c              | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 318920166c5..e91ff92b9b1 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2594,7 +2594,7 @@ int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
 
-int xc_get_cpu_policy_size(xc_interface *xch, uint32_t *nr_leaves,
+int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
                            uint32_t *nr_msrs);
 int xc_get_system_cpu_policy(xc_interface *xch, uint32_t index,
                              uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index aae6931a114..9846f81e1f1 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -109,7 +109,7 @@ const uint32_t *xc_get_static_cpu_featuremask(
     return masks[mask];
 }
 
-int xc_get_cpu_policy_size(xc_interface *xch, uint32_t *nr_leaves,
+int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
                            uint32_t *nr_msrs)
 {
     struct xen_sysctl sysctl = {};
@@ -302,7 +302,7 @@ static int xc_cpuid_xend_policy(
         goto fail;
     }
 
-    rc = xc_get_cpu_policy_size(xch, &nr_leaves, &nr_msrs);
+    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
     if ( rc )
     {
         PERROR("Failed to obtain policy info size");
@@ -447,7 +447,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    rc = xc_get_cpu_policy_size(xch, &nr_leaves, &nr_msrs);
+    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
     if ( rc )
     {
         PERROR("Failed to obtain policy info size");
diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
index 3168c5485fd..4982519e055 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/guest/xg_sr_common_x86.c
@@ -50,7 +50,7 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
     uint32_t nr_leaves = 0, nr_msrs = 0;
     int rc;
 
-    if ( xc_get_cpu_policy_size(xch, &nr_leaves, &nr_msrs) < 0 )
+    if ( xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs) < 0 )
     {
         PERROR("Unable to get CPU Policy size");
         return -1;
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 2d04162d8d8..52596c08c90 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -462,7 +462,7 @@ int main(int argc, char **argv)
         if ( !xch )
             err(1, "xc_interface_open");
 
-        if ( xc_get_cpu_policy_size(xch, &max_leaves, &max_msrs) )
+        if ( xc_cpu_policy_get_size(xch, &max_leaves, &max_msrs) )
             err(1, "xc_get_cpu_policy_size(...)");
         if ( domid == -1 )
             printf("Xen reports there are maximum %u leaves and %u MSRs\n",
-- 
2.30.1


