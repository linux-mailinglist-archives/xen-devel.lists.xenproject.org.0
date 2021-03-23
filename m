Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682CC345BA4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100589.191798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdx0-0000nd-VL; Tue, 23 Mar 2021 10:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100589.191798; Tue, 23 Mar 2021 10:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdx0-0000mV-MI; Tue, 23 Mar 2021 10:07:50 +0000
Received: by outflank-mailman (input) for mailman id 100589;
 Tue, 23 Mar 2021 10:07:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdrY-0006c2-1p
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:02:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62d07dfd-584d-4ade-ba26-d97a9f62589c;
 Tue, 23 Mar 2021 10:01:48 +0000 (UTC)
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
X-Inumbo-ID: 62d07dfd-584d-4ade-ba26-d97a9f62589c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=nS2izB/wMYNzEri//vlEUg8wYiGwzGHZuOBvg6gJjNY=;
  b=BI23oKd9eV1jPdgoWfeblsJDN9wrpp6kiMtcvl0C7SGAGvCVv8hXEdrQ
   DVtBofD0nhwEBvBUfiShjbQRivoUUZn3bwvMVl1RT9amIJKHkkxN5mZ/P
   fy2btkjidmuKyuMOLBD7QnWieuIlA44Vw3WPa6DK611Q6KKq+ctQibzV6
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: y2Nkz9I8NkfXTlEo3pOotCr2R230RJXgRk78uP/XeJASRT9gk8K3HfyOLoPVJZxokpMe1U0nEX
 ekp/mOfkcHEeOrPT5xDgQjpTnOaAJx38LTTtMNippTv+4/vxPyyLjqqXv4r7wdMnR4Jq8XY5pO
 P5Z2sboKv/CZJCsjhYAoNddN9/O/Jhe8KO9pF9fkoAi7ePP9H0BwKh7ZoBhQClMOaFdvdxhKsg
 9FoAD7G3O7Cag899sFl1AErKaIz/GaDJI9tqqXCqvasJGMX5uoB+cQJjT0ZCNaOomkFzZOMgLA
 fIw=
X-SBRS: 5.2
X-MesageID: 40055730
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EAyTXakB+4i8y9HlFXsw1yB9Z1/pDfOpj2dD5ilNYBxZY6Wkvu
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
   d="scan'208";a="40055730"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ede7H1yc7gXevCIdFx3ZqT32NSvBjcHYd9c0T+FcOpa6+saO76p2yvbmsy6v4tr2/3MCIExiO6dZkse30qPUmXHqahh32Cykyy9Op0Km79ALGARnOaEbTdDBqgaUWcvxHgpzjJkFKR7+EhbkGGMRWOPi/B8euYP4q0iQ6Lqt7EAnQ32aGddc9H9CHr2VZxok8g4QPBM/4ems2zORYCVNLOE6FNUXWu1/51TCLlIbRbXQE44OCaKijJecajAZ3MGMv9IJNtUYPme5TC7Blwt7ClTsW0KSEfmUnPx0prBPf35lA5+7OJCvoXVS9dzGImqGH6BK1uGdS2TmZFw71JZ8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0q/89uigaDgolgby8oRhEV72/0m8hoezhu+aa5CjkiI=;
 b=a3ZZc0sK+Y77KfJTe6OCEw3mIi8fY6fdWCgIZx3WpuN06dgaoWU6MZt72oDApRNgbVuVn9Bk/09tYWOX/pN2yKKBDJr/U0oAYE6gIBQlrvOO24DefsDD5ZRTJAHKaJblfUwCKyI3E9s2ETnp35V7hdeyo6T3z69dVUo6T7a5QuHEOOlxrscJql1jG2dn5ffajwxCrXOEiv21IXtJXU4xoAT3L31iiJhm+82jmdF8jjf1iWppgdzcpB8dbtClOXJIDUcVISG5tnhMJTVBKN5kQ4+1IVTUQ/IjCbeFNiMHBQQ2sR6X/V0xmAlkTft5uAhhmwEw5f3OH1VH3KQKTCKwTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0q/89uigaDgolgby8oRhEV72/0m8hoezhu+aa5CjkiI=;
 b=B0sGhjU0dy0yK5rTJbvQUWtUPuF8T62Ts8kEYK5sIM6wU9p7l9Ww6fDpurN7vMiWU/A5sdEwN3qSdg6LSk9p9l7JHbCmfAXEHJH1r2S+EzasC6l3V7It+HyiDQV+cfhW49XOnnK23Q8vrNcWg1FLR1LkiRJjOJeteTYvAUn3PwA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 20/21] libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
Date: Tue, 23 Mar 2021 10:58:48 +0100
Message-ID: <20210323095849.37858-21-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0191.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 690eef40-92ab-4d05-0636-08d8ede2a104
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB496944D03D2BD741A17031C88F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:267;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +kQJVZLBh4jKzhRwMdk67ZsVyijt2xghim6PT/BS9GEmWaj6tTe2oZx5D286ga/BUhMf5X0I+/z7wkznY7IeIUCmQZ1wAJcyJHQ0sLyNOTNCq7lnA3lnEm5eNJCQW80c3zdQLxoTwhScSFEpyftmffu74Khk+aNOWywwFhAJy/s7utiUfMPlPm8eaJlTNmfwGnXwOrLHV1NBo5JSj/pmAg+KzAympW1ZIvHfLZLUe5coY7EJDtEQC7mEXtQ2/aNBF1q/S/7PbruXZvUqHyvyfl7UVOJnQWJhtgqPLl3tI/RgsYMD5GUO1W11UJY/FFJ5UkTjEipJKfEu6XVfGaD+5iWMBkxrSz0I7bhM+aeEI+3BNe7SrNlPvEXw6KYzmwUY9m3UrwWrMLk6FWIs0NgTrvNb0Vg3FwapvMD7QRlnj5nbhXB0LpmHAc8hB7PU7ax7Xx/98N9SBYd8X3f5Sq6c8sQ4SysZAlYqBTCnCCiWu4VGYRU0CZYIj+rSXtlc/XN6t+JyUODFUhtxfjLSujcDs2gdL52h8lkYDbOHbw8O0nA1rPGpkFfbcgiD99BzBkC/394eJxRc1RfPr0QuIwsGoGl/d6oiINMURtYQb8+rrM1RItv1CBykMRkyTPPgQ3g0/O2yfwNdJM/cePA8uYYjeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(107886003)(8936002)(6496006)(38100700001)(83380400001)(6666004)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U0srdjVYNXM4K2pKUG5xU3FjV3VOKzg1MVlKNkV0RURTV1d2TndxRERmOHk5?=
 =?utf-8?B?cHkyRmlzWDRwdVp0SU1taDI0TUp4M1dEeEp1TjVORDdJdmFITDl0Yjlmditl?=
 =?utf-8?B?SUwyK3BUckQyT3o0RUN6R0J1cHNpaGx3YzMwNm9qdE1DK3lVakhUeG5aUi9k?=
 =?utf-8?B?ZGlrZ1VpV3RWRzgySXNnNHFQTC92WE4ySG45c3R1RnNwOHFPNElVU05wZmtP?=
 =?utf-8?B?V1AwUVFTT2YzdUFYaGhsNnY3L2s4amsyemFKRmZzZUprSXZpRVpReEFJS1FN?=
 =?utf-8?B?ZS9ZNkhtQU4rNWNZemd3YmJsZnVTQThzMGM4SkVtL2NYMmR2R0tCUzdYeTVG?=
 =?utf-8?B?SDhZcEtnZ2d0MElsalE2cWh0cnd0WFlyRUQrbFRmY1doVVRYcmc5Qi9KbEtN?=
 =?utf-8?B?SVllbWtIOU9teDN3bi9ESzRyK0JDZy9NUVIyVkMrVkpsdnNVL1hYUzN5cmNl?=
 =?utf-8?B?UHJGbXNxS3BqSnd2T0Z0QWxkaklkZGl3YW5LWXluMUpVTEFVK3ZSdHBXb2tC?=
 =?utf-8?B?ekp5RTFXUERTM0l3NXgrWTYrMzgvTC9La2Q0NGwyaTRIbWxtemM0alUyb2d4?=
 =?utf-8?B?VlZBZ1pWM1djcVpqOCsxZTdIcUFjQmpmTmtZME43S09uOGhKUm9IV3IwWUhq?=
 =?utf-8?B?dDl2ekxaMGZJeDZkUW9mTHF3Y3MxRGplYVZkK2I2SU55N0tzV1RPT2FxK3hO?=
 =?utf-8?B?Yk5PeDRXQThUUDVzVk1WYUpoTTUyQ0ZTVk0xTFNFenZKT3JkRmlOcDBHRWxv?=
 =?utf-8?B?TUxvRGZBTkxCZlkzR3NxQkdCaHFZOE5NUnNHUHQ2OWV0NXdyNXRLMVNKTXhK?=
 =?utf-8?B?Tkd6VWljZGZnZnRwa1BEMyswMnR0Z3ZwSUVic3Y2NURmUVlYUWlIU3l4bDB3?=
 =?utf-8?B?eThUczlqNTFLQ2hwU3ZaeWtkYk9hYmg0eWNaWkhuWm5lQXJJNENLMlRvWUl5?=
 =?utf-8?B?OU9PcVR5Z2p0TXJ0dGR3YUg1QmtKSjJpQTg0VXY1ZzBrcTJEQlhNL3QwOEdr?=
 =?utf-8?B?STg0NnJWM1QxdXVqSjJMZTlreGxTZFFlQUxMUTU2YThwdThSY1ZYUjUwY3VS?=
 =?utf-8?B?TFFubDRFdENYS2J0SHVDbk0rNjBxVUxKOG1yQkYxRU9pNzBreWRSMnFnVk5t?=
 =?utf-8?B?MWxmSzNsNXcwM0pMTXZ0TGllYml5UHpSZFhhVnZVNE1FRS9ESURsbm9pMVJV?=
 =?utf-8?B?U2hKZjhRbEt5dzhSaFIyQXlaWWJubS9xSi92aVkwMjVRMVcxN2NXQ0RBOU1G?=
 =?utf-8?B?RWl3SjhvOEZ4MWNnSkRHcXhIOCtsRlNkWnNTbnJtZ2cxUWRiSkw5Zmo1VzVm?=
 =?utf-8?B?N1pHUUIzTkc4clkrNzROVTJHZnZHbGt4YU81dml2WFdoUmtwQmRUTWgzMHRD?=
 =?utf-8?B?a3lzeDdzb3hJalpNdWhhQ1JJK2VmUHFQejk0Z0pMQUU1aDVoU3pobGlGYm5R?=
 =?utf-8?B?VGhEVXNBY2JSaVo2SHRMaWdJTWxjd3VEOHlPTXlFSHVlT0VpbjFNY1Z4dUwx?=
 =?utf-8?B?YnFXbnBoeFR3dzBmWVhKSVJ4ZVd3aWNTTll2SXVlMnVBUTNlTDdiZlgxeVl2?=
 =?utf-8?B?RGxUSVpXdERPUXRRcHd2b0E5UXRweVl2R2liV2x0SXU1dER1aWdES2xHQlla?=
 =?utf-8?B?S3V2YVVMNEZIMWdwZlpKQ0RtVmIrTUFMY1h5SVdNeHlhWW04YzJYbGhTc0Y3?=
 =?utf-8?B?cTQvOTJsWUhYcVlBc0s0bUs2OU9rWnFHRjVUMGIvTlpKQ3BDUmlLSW5qWkE3?=
 =?utf-8?Q?He5BHv7BErj/FfzrvVmgj0v68Sk9obfPYKFzgcQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 690eef40-92ab-4d05-0636-08d8ede2a104
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:01:29.3887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iX3tVQlntxM3xh0OTc4ljD4asklIUZCEeo4c94FhstTtqE4joX7cyPLWjIc+mFIKy3wQA0EGxJnk0SXxIn9kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

With the addition of the xc_cpu_policy_* now libxl can have better
control over the cpu policy, this allows removing the
xc_cpuid_apply_policy function and instead coding the required bits by
libxl in libxl__cpuid_legacy directly.

Remove xc_cpuid_apply_policy.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm unsure why this is called libxl__cpuid_legacy, mostly because I
don't seem to be able to spot a libxl__cpuid (ie: non-legacy version).
Should this be renamed to libxl__cpuid?

1b3cec69bf300e012a mentions the process of switching to a new cpuid
interface, but I'm not sure we need to keep libxl__cpuid_legacy, since
that's an internal interface that's not exposed to libxl clients
anyway.
---
 tools/include/xenctrl.h         |  18 -----
 tools/libs/guest/xg_cpuid_x86.c | 123 --------------------------------
 tools/libs/light/libxl_cpuid.c  |  87 ++++++++++++++++++++--
 3 files changed, 83 insertions(+), 145 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index a830fac1d12..5a576f72b4d 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1890,24 +1890,6 @@ struct xc_xend_cpuid {
     char *policy[4];
 };
 
-/*
- * Make adjustments to the CPUID settings for a domain.
- *
- * This path is used in two cases.  First, for fresh boots of the domain, and
- * secondly for migrate-in/restore of pre-4.14 guests (where CPUID data was
- * missing from the stream).  The @restore parameter distinguishes these
- * cases, and the generated policy must be compatible with a 4.13.
- *
- * Either pass a full new @featureset (and @nr_features), or adjust individual
- * features (@pae, @itsc, @nested_virt).
- *
- * Then (optionally) apply legacy XEND overrides (@xend) to the result.
- */
-int xc_cpuid_apply_policy(xc_interface *xch,
-                          uint32_t domid, bool restore,
-                          const uint32_t *featureset,
-                          unsigned int nr_features, bool pae, bool itsc,
-                          bool nested_virt, const struct xc_xend_cpuid *xend);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 96b969342fa..dffb9923b33 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -383,129 +383,6 @@ int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
     return rc;
 }
 
-int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
-                          const uint32_t *featureset, unsigned int nr_features,
-                          bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *cpuid)
-{
-    int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    xen_cpuid_leaf_t *leaves = NULL;
-    struct cpuid_policy *p = NULL;
-    struct cpu_policy policy = { };
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto out;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = -ENOMEM;
-    if ( (leaves = calloc(nr_leaves, sizeof(*leaves))) == NULL ||
-         (p = calloc(1, sizeof(*p))) == NULL )
-        goto out;
-
-    /* Get the domain's default policy. */
-    nr_msrs = 0;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_leaves, leaves, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto out;
-    }
-
-    rc = x86_cpuid_copy_from_buffer(p, leaves, nr_leaves,
-                                    &err_leaf, &err_subleaf);
-    if ( rc )
-    {
-        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
-              err_leaf, err_subleaf, -rc, strerror(-rc));
-        goto out;
-    }
-
-    /*
-     * Account for feature which have been disabled by default since Xen 4.13,
-     * so migrated-in VM's don't risk seeing features disappearing.
-     */
-    if ( restore )
-    {
-        policy.cpuid = p;
-        xc_cpu_policy_make_compatible(xch, &policy, di.hvm);
-    }
-
-    if ( featureset )
-    {
-        policy.cpuid = p;
-        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
-                                            nr_features);
-        if ( rc )
-        {
-            ERROR("Failed to apply featureset to policy");
-            goto out;
-        }
-    }
-    else
-    {
-        p->extd.itsc = itsc;
-
-        if ( di.hvm )
-        {
-            p->basic.pae = pae;
-            p->basic.vmx = nested_virt;
-            p->extd.svm = nested_virt;
-        }
-    }
-
-    policy.cpuid = p;
-    rc = xc_cpu_policy_topology(xch, &policy, di.hvm);
-    if ( rc )
-        goto out;
-
-    rc = xc_cpu_policy_apply_cpuid(xch, &policy, cpuid, di.hvm);
-    if ( rc )
-        goto out;
-
-    rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
-    if ( rc )
-    {
-        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
-        goto out;
-    }
-
-    rc = set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
-                               &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto out;
-    }
-
-    rc = 0;
-
-out:
-    free(p);
-    free(leaves);
-
-    return rc;
-}
-
 xc_cpu_policy_t xc_cpu_policy_init(void)
 {
     xc_cpu_policy_t policy = calloc(1, sizeof(*policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index a7b33bbcd06..f1418382b62 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -423,6 +423,8 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
     GC_INIT(ctx);
+    xc_cpu_policy_t policy = NULL;
+    bool hvm = info->type == LIBXL_DOMAIN_TYPE_HVM;
     bool pae = true;
     bool itsc;
     int rc;
@@ -436,6 +438,42 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     bool nested_virt = info->nested_hvm.val > 0;
 
+    policy = xc_cpu_policy_init();
+    if (!policy) {
+        LOGE(ERROR, "Failed to init CPU policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    rc = xc_cpu_policy_get_domain(ctx->xch, domid, policy);
+    if (rc) {
+        LOGE(ERROR, "Failed to fetch domain %u CPU policy", domid);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /*
+     * Account for feature which have been disabled by default since Xen 4.13,
+     * so migrated-in VM's don't risk seeing features disappearing.
+     */
+    if (restore) {
+        rc = xc_cpu_policy_make_compatible(ctx->xch, policy, hvm);
+        if (rc) {
+            LOGE(ERROR, "Failed to setup compatible CPU policy for domain  %u",
+                 domid);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+    rc = xc_cpu_policy_topology(ctx->xch, policy, hvm);
+    if (rc) {
+        LOGE(ERROR, "Failed to setup CPU policy topology for domain  %u",
+             domid);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
     /*
      * For PV guests, PAE is Xen-controlled (it is the 'p' that differentiates
      * the xen-3.0-x86_32 and xen-3.0-x86_32p ABIs).  It is mandatory as Xen
@@ -446,8 +484,15 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      *
      * HVM guests get a top-level choice of whether PAE is available.
      */
-    if (info->type == LIBXL_DOMAIN_TYPE_HVM)
+    if (hvm)
         pae = libxl_defbool_val(info->u.hvm.pae);
+    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("pae=%d", pae));
+    if (rc) {
+        LOG(ERROR, "Unable to set PAE CPUID flag: %d", rc);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
 
     /*
      * Advertising Invariant TSC to a guest means that the TSC frequency won't
@@ -463,12 +508,46 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      */
     itsc = (libxl_defbool_val(info->disable_migrate) ||
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
+    rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("invtsc=%d", itsc));
+    if (rc) {
+        LOG(ERROR, "Unable to set Invariant TSC CPUID flag: %d", rc);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Set Nested virt CPUID bits for HVM. */
+    if (hvm) {
+        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("vmx=%d",
+                                                              nested_virt));
+        if (rc) {
+            LOG(ERROR, "Unable to set VMX CPUID flag: %d", rc);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        rc = libxl_cpuid_parse_config(&info->cpuid, GCSPRINTF("svm=%d",
+                                                              nested_virt));
+        if (rc) {
+            LOG(ERROR, "Unable to set SVM CPUID flag: %d", rc);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+    /* Apply the bits from info->cpuid if any. */
+    rc = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
+    if (rc) {
+        LOGE(ERROR, "Failed to apply CPUID changes");
+        rc = ERROR_FAIL;
+        goto out;
+    }
 
-    rc = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                               pae, itsc, nested_virt, info->cpuid);
+    rc = xc_cpu_policy_set_domain(ctx->xch, domid, policy);
     if (rc)
-        LOGE(ERROR, "Failed to apply CPUID policy");
+        LOGE(ERROR, "Failed to set domain %u CPUID policy", domid);
 
+ out:
+    xc_cpu_policy_destroy(policy);
     GC_FREE;
     return rc;
 }
-- 
2.30.1


