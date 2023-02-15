Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5B697FC9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 16:43:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496098.766658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJve-0004ff-9e; Wed, 15 Feb 2023 15:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496098.766658; Wed, 15 Feb 2023 15:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJve-0004dV-66; Wed, 15 Feb 2023 15:42:42 +0000
Received: by outflank-mailman (input) for mailman id 496098;
 Wed, 15 Feb 2023 15:42:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSJvd-0004dP-29
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 15:42:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e9d832e-ad47-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 16:42:37 +0100 (CET)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 10:42:34 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6485.namprd03.prod.outlook.com (2603:10b6:a03:398::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 15:42:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 15:42:32 +0000
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
X-Inumbo-ID: 5e9d832e-ad47-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676475757;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tS7fSBCHK+Iq98OAd95KnNGRYrB9Css0C8bcJfQ9f3c=;
  b=OImJlacJ/jf3ntlsnAxyMndf4Zvt1VG9HFwFK+0K20/ZiLu72C9/9jYN
   9day6xxsz9I3119HHN4jHe60IOLZxf8YeIcpAraNS2oA2qjDHrbqDTleL
   ZQofBYw4/3/HSREAdZd+kpVddytTqc86ZotokYvOXCxv4UcY8Cp7aNpl1
   M=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 97079184
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XeDjMqp4BtaR6cNedN3ICOSXXqxeBmI4ZBIvgKrLsJaIsI4StFCzt
 garIBmHOfyCYWSmfdlyb96z8k4AupKBm94wTQM+rC1kHy4bpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEziRNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAG4IdhnSisaW+bGcEtZUn+cELtDMPrpK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKIEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpqaY10QTDmgT/DjUGaXSQ/ci123X5AeAHc
 m5I6jgerZALoRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQCy
 Vuhj97vQzt1v9W9S32H8ayPhSivIiVTJmgHDRLoViMA6tjn5Y020BTGS487FLbv14WoXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:yKDIJKnl2l2o5HDoLr9lwcvnHH3pDfMxiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msjKKdkrNhWotKOzOWxVdATbsSl7cKpgeNJ8SQzJ8/6U
 4NSdkaNDS0NykAsS+Y2njHLz9D+rm6GcmT7I+xrkuFDzsaE52Ihz0JdTpzeXcGIDWua6BJcq
 Z0qvA3xQZJLh8sH7iG7zQ+LqD+T5qhruOVXTc2QzocrCWehzKh77D3VzCewxclSjtKhZsy7G
 TflAT9x6O799W20AXV2WP/54lf3IKJ8KoOOOW8zuwubhn8gAehY4psH5WEoTAOuemqrHo6jd
 XWpB8kHsJrr1fcZHu8rxfB0xTplBwu93jh41mFhmaLm721eBsKT+56wa5JeBrQ7EQt+Pl6za
 Jwxmqc875aFwnJkijR78XBE0gCrDv/nVMS1cooy1BPW4oXb7Fc6aQZ4UNuCZ8FWAb38pouHu
 VCBNzVoNxWbVSZRXbEuXQH+q3mYl0DWjO9BmQSsM2c1DZb2Fh/0ksj3cQa2kwN8ZosIqM0kN
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOMl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wt9ihn3ek6hlTAfsuvDcXaI2pe1/dI4s9vTPEzYs
 zDe66/WJTYXCzT8YUg5XyLZ3AdEwhZbCQvgKdJZ7u/mLO7FmTUjJ2qTB/yHsuaLd92YBK3Pl
 IzGB7OGe5n0meHHlfFvTm5YQKZRqW4x+M+LJTn
X-IronPort-AV: E=Sophos;i="5.97,300,1669093200"; 
   d="scan'208";a="97079184"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEyjnmRWFsLjZiBZFcI1zKSBz18Y744JZWjsuTJvSH2zuT4r9jOmOccd4KXolVbuVi1HukS8vEXe/EzSsDlTF6PayUrc7DE0X2+qTyZE+qZUjNZ5QJKx+3zhOBoDpLpZQzNxDFndDbDShrbuPH5+eqfBF69GIUS4fQqxrzg1zw6ObCef1JN54ApHz0T4jZ9lUp7bGQ7fM1gloyJATetcEmIMm7+U1UHzRCp07E+UlYa4/E3lWp1xsK3sGrTA5T/dKjw3FjT4/OdZ3U5M6cQKasyQMy+Lsk0ZGjHerP816bnXckoy8tHLl049mLzpHZQmJScyQyCG76L7I5Prz73KBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAVq2WUkPBmRVptWqO60GQ/LiRitT+Evk1FCbEYaE8Y=;
 b=eygpn8t8CYTi/V1GtkQ2XNTn3qZnm6uExI4AaHmGfZuvkVwo5OO3A6XabbJCwA2y54cBfZQZLlidBpUvJPHzMr6VRO6scbsKbjb1GBhROPzo8r1aPyh3L54/Vf6eXDMXi/7JbH92blS8PjLdKsRdtVzaHTcTNtlXqBIotKtC4tH5CffvZUf6Zie+Rxf5HLjreRfc3sF97iAAcRv2kAQr+L/Qx18A5VvPZhdqlaHq2LN+jinHmHVngTs/qeNcV0nZXxfc4AU16Q7NKu/BV/R8BV0oZ1b4G8OfotjZGhYetd61irWijDpNWxpT1W3IpjNzICtdq4LRhkLu/PrTethXFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAVq2WUkPBmRVptWqO60GQ/LiRitT+Evk1FCbEYaE8Y=;
 b=DOv90YH0W5thFAuI/faFkWon9y91cCG9lq1dfkaFuxkLf82DRHpYId6mw2CBTjqPOnS2rSfrplUUoLQuOtqq1swXxFqXvEsyXTwrFaXoGw87MB9SI0dIC3OmaRYkmBYDo1wLBtgYCGRMRyWdyOvfs+LYQ6TCHNR3x/DzY8U5xDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a649fa3d-2947-d627-d8c0-861850a09ca4@citrix.com>
Date: Wed, 15 Feb 2023 15:42:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] libs: Fix unstable libs build on FreeBSD,
 auto-generate version-script
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20230215152111.51218-1-anthony.perard@citrix.com>
In-Reply-To: <20230215152111.51218-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc8c0c4-3d99-4703-4b08-08db0f6b4078
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lIp3g9UWUlvJb0qFdMhn46eAQft4cSAnVjT5aKP8lrkFikX6oC/8nPq9gp4fiztmhz/Xj7ehhMn2xD7np5g2Ga+FAcyqFweVcLwBe4/vEW0uYMWpMIMnuGGyjXu57tIyTwMURkEIUWM8hIp+4KCkEZOHPjopoNtiJDFK+oZ9p5sUO1bhrBXgEl7/lMpJIwspCt0BuA7IjSpYE5ldhQv88m5teZkljOV3Oul3rsfHn8X9Zz/Y9zEty1KRsqipUQA5BdpKqNzZbnf8hqqQf8zQPyq1M8afNwS7v0LxYeClOrkSzxusqhoGfm1bCxLKHkHn5WJMpdTfp5GTTtxU9Qqe34M4CNmj6roXNlsNWGpS5fr9/lb7U5VOMilJB4lySOl2cMoFAT6fjWdhTBpKIaQHigxPDL0vF+tkoBGRK7SA/EpuIqS+DNR93asgmOBQHEhGVHFqkxSFJBEe3H3HOKMgN3E0vgTJwd4ZkZugxgzDEtaVCKrXHz/mpLHH0ip9afKymZ0sgG1hg8OtEE2g/PZ88yTLPEzHtsvpkRYJf6MK9NsmB/v13tAnBLFdse/SwPtV6+VtscgauKaq7SVvTBTnl6PyVNc8TJ7B/8KBJc0j3BJPrcgW6DwHe7AdY0Fhly1g1Vj+Q2SqS8f6pD1ySbUTBcgtVy7AmT2sdI+e26xzFkPMgYVfUFD+wrWlMqaGHrapirkQlhWRxDSTXPjASlnZK5JDeNcHDUFVcIgFYxKNoH0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199018)(36756003)(41300700001)(66946007)(31686004)(54906003)(38100700002)(5660300002)(8936002)(316002)(4326008)(8676002)(66556008)(66476007)(86362001)(478600001)(6486002)(6506007)(6666004)(2616005)(31696002)(82960400001)(26005)(186003)(2906002)(53546011)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzVVNlFQZGsyWVFMZUxsdEtwbGNOelhGQ2hPM3RjRzBucTRjWXZJZGlCRDNW?=
 =?utf-8?B?UlpSZkVvYkRzSWd5WWFRakROR3BjaERGWFdwbHprdGUrRjBlenRvRk16am1k?=
 =?utf-8?B?WW80aFNEaEhyQVdqRVg2eVh2ZFFCVVl5RDFjR1g5QTUyUHJKc3NtN3kybmJI?=
 =?utf-8?B?WVpjSWZ4NTJLUENzNFNnK1ViSEhJelhzaUxqY3ExNGpHY1RsNENVU0pudkNi?=
 =?utf-8?B?SHIyNXNRbFNmQVdEL0QzK3ZaZmcrY3o1eVl1QUZ1dEw1M0owT2VmTlQ3Qm0r?=
 =?utf-8?B?clRhNUdWUyt2STdGK3FxRC90VTlwbUQ5TzBJVUxsNjQ4MFg4VEVMM21jcWpP?=
 =?utf-8?B?TVlTK3ZiclgwV2pTelNzME5GNXJGbzI0Y3Fvd1I3NmFVek5aSC9PU1B0T3RH?=
 =?utf-8?B?TnVHTFU4NU9rdlRMbUhXTjBCQldZdFBMMXZZSU1FeUpXQ3ZNb0dtOTBwRVM0?=
 =?utf-8?B?K3dqK1A4TjgzUTIrNjdiUjNYa1BTUGRNZlVqMkJYb2Z6RWorbENSRGlnTS9I?=
 =?utf-8?B?M2ZKM0MwQURhM1BxQzZMbE0zdG5iU3h2bU5zTy8zSUhBNnFrUEJ6RzNsVmhn?=
 =?utf-8?B?MVJ2YWRIZEdXN3NHanRJRXovSVUxQmZwa1UvdTNEZm8yVTRvZGFnUExWak96?=
 =?utf-8?B?ekdzOFFraDVnOUdJRUMydkVOTXZGR1BqbUJvaW9IUGxwZWo3ZmQ3YmFCaGpU?=
 =?utf-8?B?c0l5djVZNmkzL2t5ZU1wYmNCQlMvblluRmJvdmpSVDZWcm9UZGNNbzNtVmU0?=
 =?utf-8?B?T2xkczhBbUdpTCtsTUx4SE1GaGVQWGtQcDhKQUlZSi83Um9LcHJxYjdOUHdO?=
 =?utf-8?B?cFdPMSt1a1BiZlUzUmJIeGg5UHZ3aElHb3QxTUo1ZTN6QzBVdUJCMU9hU0No?=
 =?utf-8?B?amhpQVZOcURRZmE5ZWhpeXNaMmZMWHg5MWFEZW82TElaOUNGeVNiR09nbGFJ?=
 =?utf-8?B?cE8yenZlamV5WjJsNDlhWXBOOEZ6bmVmeGpJRWlqQTZFZ0NaSEFtaS8rLzM2?=
 =?utf-8?B?TEsxYzZRMmliWjZGb3owUlFzU2M5QkR2TThlQ2hiTWJvbTVKVnRZYW1HUlhw?=
 =?utf-8?B?TDdwbmxhUWwxdW4xUFJaSWM0eXR2V0dyTXhCb3E2RlJIU0w2NTBMY3l4M0tu?=
 =?utf-8?B?aDRRQmV3alBCTGs5cGQrdXYwWFkvQmdlNjJXaUZxU1hrdHY3T1p5WTlmWTdM?=
 =?utf-8?B?UHU4blVtM1h4L1JHbGE5QVVFczJqRUlYakVKb2JvRzV4TFBQa2hJNUtrTDNi?=
 =?utf-8?B?UGF4Q2ljcXhDeVo5TWdqa3N2OTF6ckhaclErUUNvOEFmSStYY1BmTnJIeEo5?=
 =?utf-8?B?WEdPNFJJNDNtMGNjMEQrc0d0YUpwZytodXlQS2ZQeGJBNjB3TVN0NVpmNjhu?=
 =?utf-8?B?NktIQmdBZ2VUZzlWd0FnbHMvOUlFMjBidGRnd2NQWUwvdzVkdUVSYjB4TTI5?=
 =?utf-8?B?eWtwSFlReGRqbjdIVm1EcFpzWGVodjVOT3pYUSt3d2dOUjJEWGtGaWNNKzJj?=
 =?utf-8?B?ZEdVdGVzRDdDdWJPeVhwOUtWY3pPdG93M0dYa1BXeElydHhvUXhDRlg5M0Jn?=
 =?utf-8?B?VzU5YmFPSFlvaElqZnVvbytuSGRYOEFFSnJhOSs4ZUhhZHJGb09YVGxKcHRU?=
 =?utf-8?B?Nld0TzlRWS9vM3NzVFhVRmx4VXFCRVhIZDdsUFpLeEhsV1ZBVUNKbU1DVTdj?=
 =?utf-8?B?K1F6M0paQW93Ykt0YTQxQWExOFE2R3R3Z2ljaWh5bmg3T3ZQUCtrVmo3RHN3?=
 =?utf-8?B?dE1wZm1raVdxMGtTUWI3UHo3R2tQV0NVcTF3RzAxQmEyMWNRY2JYNU9jZ1lO?=
 =?utf-8?B?MjlPWDQ4QmRHalNvNHE1S3F4RkVDZU52NGtwaU02NXJ2T1Uwdi93N2NzR050?=
 =?utf-8?B?Wml1QXIxaG8ycUI3WVVPSlIwL1ByMHkybWM3SDFlZHRWa2JRYkJFNkhweWh2?=
 =?utf-8?B?OVFDN3hLczBPc0MzMDdzSTM4WGk4RFJZSkdsLzRncG90QTJJOElLeUNQNDkz?=
 =?utf-8?B?TWtFalhkN3l2T0IweW5LM0JCRXdMSTRNVlg3T1UwOGQ3RE5VT0dUZktVSkZE?=
 =?utf-8?B?WmQ2ZFdTdUtBTm1keCtZa09aV3BDNVcyV3V5a0hWTUkvTUpGRFZmS1ppWUNB?=
 =?utf-8?B?N1ZYNHQyV21xWUVSaXhlK3BDRlROYmpyOHFLcG5lektkNHFuWGpRVURZYVNj?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iYaMoHHW8Jnb5IEqeTMG5nF8knAXoY8XpIcvk/UZ8sGIWuj4l0MgWIMuUfOkZUNy63ShhiEk6TbQSsG7QVhmEjXch3xyrnUKxxiwvC32M1/F0mQ24R4TfTmd9EmU09KV5k7botI8u+sTwTHEMxvnj7C0fbhnu0rm7HBqLP1B7YTbBv7NMT96wXbaS9z1qMYbHL9qhYd2kcEJZSVoyFdqfr9oYKGWkhMuxAJthhaf3TAnkcFhFzGKd6DRYvAlWDyPi2hab+8RxR7HXIb4IiL2pb/0f+Grb6Nl7HlWMRV8innu3Jh3QqtkM+xVAIa+OKlmRJ4VNuYLOjIgw9NdWPcZpkD7kJb5cylMfYu0Yjw1FQoJbi0vP295xv+fOIF2fUMWWwz8eFI/xSsoTVdz6jZmfi3KuGypVfJukpSOE/l2gj4bcn6WhRFfzBUVS/X9RLzzFK6LkYItgPGgYgwvXCjS0x2hiW0K1Lh5b9btoT6HejKuUJbp5RuJ1BpztpUVMQtCHNKiD4QplwQr4LdKPxfpC+98U5jP+GHNoMCqXUhENot+S60Afzk0qml4HUdMlX6lwjL5U7ACsYdGWUxNHPAJrY0sxZ8u17ytcm/stNpaPZAapo0wvmyHyCgdOjWYMshtY3KIpldi+F+iY9afdICFhc+lsN/hWK++uBdNagbMiP8yWOKfILxZiXjfq4QmgLKJM68WS5jxhXFuHbjz/+nRSOWIGzVSC0yG1UZYW4LCnt/IioHwt4qpnToksmrWGQONCAUnY7qqxFuE7RLQL/0qOfOjgrXWLzUtq90M1/4jzt8vfCK4g3UiSLRIZ1hNbW4V
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc8c0c4-3d99-4703-4b08-08db0f6b4078
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 15:42:32.3255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUfDewIgShbCRRFowB3gEN5AZUaZa6T17RD2mrdxtNkJ7bjDAhm6bhUH3L77JM4+stbbc8apEBDQO8yKuItfqR4QuIrbAtqxrA2FsBpdRIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6485

On 15/02/2023 3:21 pm, Anthony PERARD wrote:
> Unfortunatly, --default-symver doesn't work on FreeBSD 12, with LLVM's
> LD. Instead, we will generate a temporary version-script.

It was all builds, not just FreeBSD 12, and not really FreeBSD either.

LLD simply doesn't understand the --default-symver.

It's just that the FreeBSD builds are the only ones where we're using
LLD.  All the gitlab clang tests are clang+binutils, not clang+llvm.  We
ought to change this irrespective.

> diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
> index 0e4b5e0bd0..cab8e9704a 100644
> --- a/tools/libs/libs.mk
> +++ b/tools/libs/libs.mk
> @@ -72,6 +77,10 @@ headers.lst: FORCE
>  	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
>  	@$(call move-if-changed,$@.tmp,$@)
>  
> +libxen$(LIBNAME).map.tmp: FORCE
> +	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >.$@.tmp
> +	$(call move-if-changed,.$@.tmp,$@)

It has come up in the past that using literally VERS_ is buggy, because
anyone who copy&pastes too much of the canonical reference will end up
making a compatible binary.

Xen's stable libraries are buggy, and at some point we really do need to
bump them all to 2.0 to fix this.

VERS should be a library reference, so libxen$(LIBNAME) in our case.  I
suggest we take this opportunity to fix the unstable libraries.

~Andrew

