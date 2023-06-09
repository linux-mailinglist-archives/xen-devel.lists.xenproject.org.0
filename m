Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C17295BB
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545774.852337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YfE-0000iV-LE; Fri, 09 Jun 2023 09:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545774.852337; Fri, 09 Jun 2023 09:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YfE-0000fs-IM; Fri, 09 Jun 2023 09:44:12 +0000
Received: by outflank-mailman (input) for mailman id 545774;
 Fri, 09 Jun 2023 09:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7YfC-0000cT-Bz
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:44:10 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d3bc536-06aa-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 11:44:08 +0200 (CEST)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2023 05:44:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5856.namprd03.prod.outlook.com (2603:10b6:a03:2df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Fri, 9 Jun
 2023 09:43:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 09:43:55 +0000
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
X-Inumbo-ID: 2d3bc536-06aa-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686303848;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qOUMLfCZ7KwLZt4dYp0BD/7AeTwD1IxitLwcqErvdJo=;
  b=Cw4nVWfp0MW9ax12fCXh5FA61RDNaezVg4W5iu+hulmdViTT+KWA8FqT
   s3dv+AHoLtFe7q7vrxEwl5myDrhV7O+OigNSeugzLj6I5yJvP7gGgHN/n
   1Rta59ocvY0xU37IrRdAqLCM/jXdG3U6sY8KPKwKwqyENWtYLMAzg5BRV
   E=;
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 111515627
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yrDzpaJmWz6gVQQJFE+Rc5QlxSXFcZb7ZxGr2PjKsXjdYENShDUAm
 DEbCDjVPv6CYjegKdF+YNu38E8P7JWEz4VqGVFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4ARuPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5rH0dRy
 eRCCwoBRT+GmP+XxoOwGu5F05FLwMnDZOvzu1lG5BSBV7MKZMuGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTSPpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxHqmAd9MTuLQGvhCgQWq7TUNBCAsUXCkiNm+kGeeAuwOE
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1rLZ6hyCAW4sVDdZdNs8uck5RDon2
 0WImdyvDjtq2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN07ls4CyKOy+1ncnzu3p5/hVAct+gLNU2Sq7wV0aZSkYYPu4l/ehd5QIYDcQlSfs
 Xwsn8mF8PtIHZyLjDaKQugGAPeu/fntGCbciEFpN5An/i+x8mXlfIc43d1lDEJgM8JBdTqyZ
 kbW4VlV/MULYCfsarJraYWsDchs1bLnCdnuSvHTaJxJf4R1cwiEuippYCZ8wlzQraTlqolnU
 b/zTCpmJS9y5XhPpNZue9og7A==
IronPort-HdrOrdr: A9a23:Y4xIt65NGO5N6WsaqwPXwO7XdLJyesId70hD6qkmc20uTiW9rb
 HWoB19726TtN9xYgBGpTnkAsO9qBznhP1ICOUqXYtKPzOW3FdATrsSj7cKmAeQYxEWn9Q1vc
 xdmsNFebjN5DZB7PrS0U2RD8sn29Wf9bDAv5ak856vd21XgmNbgjuRxjz1LqS+fmd7OaY=
X-Talos-CUID: 9a23:lN/nsWNrf8vZCe5DRDdB63IMQOMfflbyyWjNAkmJAjZuYejA
X-Talos-MUID: =?us-ascii?q?9a23=3AqBceyQx4BI6YkdeaDC1gNbJkRIGaqKX2MWtUj5k?=
 =?us-ascii?q?7gc2vKgVQPC20rG2JE7Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,228,1681185600"; 
   d="scan'208";a="111515627"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPV0kIWFze1CSYE8kFmA/BfjWTdmbr8WKzozE3jwSJRLujjxMQ1fbEnSE8/xMT3M1MKkh+dOayNJrLogSAmBxeb2fQj351wKwWrGHkSZUgRf6GWl3rT18qzT3Gbx9Rbc2qnPJLewTDWmdq3JEiHPUWiRLc55SfBNzDEINRgrU4luI59O9s5iPc0v3u9TiJwm3os0nw8IzwK/DfNC560cVrvUghii4qMJd3ZBEEhxfsr02KY9x8/EWGB+BlNQGdfYWfgVFTgzZaTRGv0eBoRTOaV7qMdlqfRCAP7F6qoRdDlivk8vk2fpqZKyqwLLvJ9y6QSBsTwJFHvSKqDtd/FUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOUMLfCZ7KwLZt4dYp0BD/7AeTwD1IxitLwcqErvdJo=;
 b=S/3umUEkG8TOWd894SXfh50qLeAKp5GQvQ8ytKebK8cgvEcpXhysRU28nsBAmoMsehlWCnCYgwtkJ7dp+9XgQd09LrYnFv/tp28WO4L4pk9R8DYqAEVbhGSoNfqq/WlK/yTp14jhvFEhBD+7JNf0MyQDp2tklz+PkZih+FNpEddFW8BzEd0tOYrHxLbzg7ajV2LzE47jrNO73CUTAIjwefwkBBwJ0LMCdTQGBGV8hikzMscafaQumW+AlNOenPdsC6l8se5OvXBb7Ho0oszAj6pIYS3sVDy6pwEW++Dtt1vzdiaKPzvXb8Nm8AmztaQ4xz82Nos3iDsQCPE54OHrpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOUMLfCZ7KwLZt4dYp0BD/7AeTwD1IxitLwcqErvdJo=;
 b=rSBt0UOwznEn+V5cA+QWNX/FF91C2K3gC+wH+NKmbTTn5nRQvI3Dpphc/Y0VdqSFWXHhTk9BHSzHuecZzu28mikw+H8A37816JkHSmtoB4KB5zAZNwz5bimgJeHNBDgFJQvW8DvoUi4xjLL4zVOiF//lCEqo4GXrwUZ/5uZWEYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d52feaa7-4217-973e-19fe-9ec027eed5fc@citrix.com>
Date: Fri, 9 Jun 2023 10:43:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Shawn Anastasio
 <shawnanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org,
 Shawn Anastasio <shawn@anastas.io>
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
 <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
 <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com>
In-Reply-To: <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: d769bbec-7266-436d-22b5-08db68ce0a71
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O1TCQmtjzSNsjrlBD6QMCORKNBk8uxf72/LT4y+0lOzcE1T5U7QV4jzWGSKGKj6V6yvmTOuZcgQQUT0EMesZjt3CAAMXPcbEAgwb6hiWrl5PTQndGFq+egqgEO/sHoAa8hIg/Ia8lZ/l4MeAMuFKhstpeq+215mR9PvsvEPEq8kBVNarPqesqsMJFsKTbOIlHuVd+uJtl5ybedWau8b5YbEWvVv6YF7/9HTr4iTefxGQYGSajnjrE3i92HO7io7mbtsJGhCzld+XNW5MZgyIe3/pXG8xTNFTWoSoIYVEneBgYe5vfkOe155A2zzQ5VwhxHS/5efr3UxZeo1LnIMbSURPoIlhRem3PkA6EfTnHhHrVUXshiUklUqlSsZzd8kwRUVPeWcSauG8bKkAG+Zt86IVL8wjz1UVKqKUwrP4gdnS95tyxDGl+ZVO8UdZW6Y2Ujb5K2YkzAfAEPMVF/JPDy4bm8ZbJD6SIqf1KztvSoegkK8LZGt9JtoBdXqam5HE1YNmYm6oZoVzjkGLwTSJ/UZhdRJQCoa3SGdZ5rocQyvLU3uIpKhryF7tYxWNVfugdn6Adt0A9qa/5fnhgnSvPq4nzv91ZVUkjGW4lgLk/UpawLTt6oQsKfgLztse7NnOAgzGoNbozKsKeiWiLR9EMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(86362001)(2906002)(2616005)(26005)(6506007)(186003)(53546011)(6512007)(478600001)(31696002)(82960400001)(38100700002)(6486002)(36756003)(966005)(6666004)(5660300002)(8936002)(8676002)(31686004)(41300700001)(66476007)(4326008)(6916009)(66556008)(66946007)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y054M2xIclJFZG1iQmNlVzl0VG1DdjhnTXdHbnZCS2s4RUVxVmhLYnRQa01X?=
 =?utf-8?B?amRqaFFVWWxOT2dYZU5obFU5bEkrdHJvdHJZUnlmYTlmMEVkR0o4NnF1T0J6?=
 =?utf-8?B?ZGpwMFB3SHBwTVZ6bklTdDMyVCtjaTRrS3M5L1o1RXl0Wk54Yld2dmQ0THJh?=
 =?utf-8?B?dlNpUmViZ1lKZjNraExURVU5a2s1OVhLUUc0SXRVQndnVWRlY2t3ajlmcVky?=
 =?utf-8?B?K1FnakRlNkpzV0o5a3kybzB4TGxnN3hTaEQ4OFRFbHo2ajNTQk81YXJKdlJp?=
 =?utf-8?B?Y25hMG1wTXFaLzhKelZwTmg1cHBvS0FwSmtrL2RndjdrLzkvOWUwck9TTzQ1?=
 =?utf-8?B?bXM3ZlpZRWtVR2hRdjhHUHNOUWNwQzUwM0hDVFl1c1RMYjlCQ29EdUxjWWt5?=
 =?utf-8?B?dmJvdGhBZ2huQXJvWS9oWUIzNGpLczVGaWoxdkU5SlRTenBUMFhGQlA0WDNE?=
 =?utf-8?B?RzNpbVQxTnZIWG9hOFhBTnBsME9ZN0taUG9MUUMyTzRmSVFiR3FWN0h2elVi?=
 =?utf-8?B?clRoTi9kUzM3ZjM5aEZvRUlGVWxicGZvYjU2dmNENFFBQXd3L3pvNE1vZFlq?=
 =?utf-8?B?YjMxYmFiV1JnWUZCZHpxUHplV0FSR3J3YVhhbEtPWE45NXhhU1VncXZSc2JS?=
 =?utf-8?B?TDZKY0ZOOGwveEhIeSs1UGZEaEF6M1g1dTA3c0MydS9uMm5lNEN2UWR1TnFF?=
 =?utf-8?B?bkl2Ly9tM2xpS0hlWHlZZWhkcE5oRjFibFZLb0lPZ0plM25pUmh6d3d4ZXBi?=
 =?utf-8?B?V3JWZ2dSeU1BU041S1QxNjc2WHFkK2d3b1JwZGhnMDA1Rm5pcnJ1V2dMTEdF?=
 =?utf-8?B?aVBCS0FFM21qQ1B6bVkxMzU2NGpLRndONm96eVMrNlFtU3p1empseEVrWE1v?=
 =?utf-8?B?VC9QL21XOCtTWjJGN3hrUlZGMDRBMTlYZ3hTb3U1bXNIUGZKK2JySzc3UnpO?=
 =?utf-8?B?NkdrdVR5a1VqeHBtbVhSZk1JS2ZFVld3cXBUTG9LYWpySHJzSGxxRi9RVTBo?=
 =?utf-8?B?TXd1ZjlodEhoS08vTmZpSGdFcW1wVHBlOHNHUEh2OXVscDhaYWtNZnFhbVNm?=
 =?utf-8?B?NXV0bmp4THpiN0dxNU5Dalo5ekJiNmVzQjZSSVZxcmQrcnc0eTI4ZWdPSzB0?=
 =?utf-8?B?aW1melZsV3NLZDdHc0dhdlhkcDRVMFpxYWZObEozM1U0djNKa3VsbkI0RWVL?=
 =?utf-8?B?VS9jZDdqeFpkUk1ZMzBIc09ZWVJzcC9SV2R1RkZrUjlPMWwrWHFSRkdKU0F5?=
 =?utf-8?B?SkNyYVpSckl0ZjZrcHExaFJKWFBRQnlHQ2ZGT0JYRnNDSjZlRmpCdlF3b3Ar?=
 =?utf-8?B?b0dRWXNuZkplRmlKdENyeUNsWWNHZTBxM0ZWZEJrWXo3bXBUWFZOdk5wTlJK?=
 =?utf-8?B?NWh1cXhQVTU4dUdCVCtPSS83UTBPbDFWTUtIWDAxR2dBaUF0S1dxWkhJWjBO?=
 =?utf-8?B?NGpCZlJQOWM4SGxtbnR5d1ZSL21USktyVFNaaUU1aVF2dzZaY05PWWoxNTMz?=
 =?utf-8?B?aGlwNWhTekUxWm9RSVJYOWdUR3haVU01T1E1bzN0Q21zUjlvRmJlelZNZUlh?=
 =?utf-8?B?b3dFVkJla0pBa0ZoUFljbnN0b25TL250a0VhZzFMZWxWTVFIaUllOGQ3cWRr?=
 =?utf-8?B?QzJaUk9VNE9KNDlaRUljaUtUcFh6VmdiaW1zNnRnN2loR3kzZVhqNkVLc3RL?=
 =?utf-8?B?YjJLdkoxUEFMc3dyQ1dZaUE1a2RYeTBuVEVYMW9xQmVNUlB2V0wzQWNtQlEz?=
 =?utf-8?B?d0pqSHVjT0hUUDR3T1NLTysxQ08yMDhmb1doTzJPQ1lvMDJENTRUVW03bkZR?=
 =?utf-8?B?N0xudjA4NEMxL3h3cmFwSXpZb2tWNnpZT3VwSm42OXcrZXJqV2gwYlpUaXhC?=
 =?utf-8?B?eVBqSE9RWnlqbXkvSEdSdDViWkR1SXcrazZKY2dEcjZqUzdOYjBPVGM3RHFP?=
 =?utf-8?B?emVRS2UrNU1VeFR1SEJld3FvYlF3R3Q0a3U4NzNKcTgwanRtL25xQjRjaVhv?=
 =?utf-8?B?WlVRcHZMSVdFUUE5ZFRBdlRyaGMzQWtucUplNWNaT2R4Z05GTk9tWElRUzgw?=
 =?utf-8?B?MVQzZUhFTUI0NzFpei83eERibGZJalVjeTY4Zm5Na01SNVh2d1o3b2ZMaThs?=
 =?utf-8?B?bmVuOFovOWRObVNUZGN3UU5lVW4rRGpvNGplL0pGc1ZTVTRRbmpPWlBiZmZu?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Ukd6eitLWWNGRVBhb1BFTGVKdXVDeDVqNDZtdlZkYUV5TnlxaXQxellQUE5k?=
 =?utf-8?B?QWxVYlJhQVhZYmQrYXFJS0xmeXQxN1RuRld5cElIZk9tcktZank5aThEK092?=
 =?utf-8?B?L3ZhWGhwbnJ0M0xqenN1TDBJV2NZeGE3b2IwbHZxOHZJZURHWU4zTWtqUi90?=
 =?utf-8?B?dm1vVkZEOG1ReERaUDVrYUlqY3pOYUNaSndoSVZLQW1aQlRFcFFrYnpuL0Ez?=
 =?utf-8?B?a1BWQndWSys5V3pLZzhibGp0MmxpVHpBOWg4Q3RucUdkWFJuSGpFNHZZMTNE?=
 =?utf-8?B?WGxOcmhPd2FLeWtGSExCNTgxSmM3d3d2YzdoWTNiVmdpTmJQKytHTlMwQnlt?=
 =?utf-8?B?MmdKcytuWnliRkNURjJRaEZhZ1I3RXA0ak43Q0ExYW5PM2VBVWhTYnk2aDJj?=
 =?utf-8?B?QnNSTGVOb0kxcGJQSWhHejZRSDVFa3I4cXdkem9kRTVtRlJwN1ZxaGlObFpB?=
 =?utf-8?B?cFV1MEd5WUJPZlNKTThKWFREM2Z0bXB3ekQ3bVBqaFVFMnE4aVZmeWpsVUpz?=
 =?utf-8?B?ZEZCNXMyOGVyMDdXcjhWZUxOQzZSYnNOU1hIMlUxNUhnSTVaNGE2NkJ4SDRj?=
 =?utf-8?B?NHpMVjVXV2RGWXV1TVRXb2RzQWRQelpKYU8ySW9yTVRpeWJXdmZVRnoya3ZP?=
 =?utf-8?B?bFdXZnpwMnhYN0grR0RVdXJLQmZxWWtFRzJIMUp2OTU0VjhYMFJta1Rla0dV?=
 =?utf-8?B?WldtejJocVorUmJ6VXF4SWZnRUhWL0tmYnVjejc0dnUyMVByQVZHVjQwcXQz?=
 =?utf-8?B?M085WXJhTE5qVzJ6OTVXZERyZlQ0Z0xTdmpXTEhtQ21GYi9HMi9UbmZhdm9J?=
 =?utf-8?B?L1R5UzVKdEVSdDZ4NHB2bzA3bGJMYlNHOU5MdjJSVkpTTDRpelpEWFd3Z0hz?=
 =?utf-8?B?VmdHbXVZVmt0MU5CUU40VWd1K0thSmhvSEx5WFdNOGJaNW11QlB4THdtalpw?=
 =?utf-8?B?cTRsWS9lUVkweTg3Y1Yva2pFbnUvbWZOM1Mvek1vdnlTNXBtZDRTMStBRmVh?=
 =?utf-8?B?TWQ4TWRQRG5sVy9OMXhEY3hFSHpPeU1XL0phU3ArNEw2d1daVkZvTXcyTkhk?=
 =?utf-8?B?MmN4ODdLWFlMaWNyTURwZXBWMkJxTVJMS1NGcGxBZFJOOXNTV040WjZ4Z1Bx?=
 =?utf-8?B?emdESXZyN3FWdkdobk9uYVgzSVY2STZwY0kvYVV3a0c2STY5c0lMek5lZzlV?=
 =?utf-8?B?cnFWQUtGa3NOUFNYRG9hZ0E3MEppV3J3RG52bEFpMGN2M2ZKRk5NRjNMdUx0?=
 =?utf-8?Q?am+n/jVvZ28QouN?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d769bbec-7266-436d-22b5-08db68ce0a71
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:43:55.3212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQKuoxOujlorY9soIcijHYnae82PgDIO6zbG7bFDBjGp8YwWkrTer4b4D70riqSwbeS2o0IhbPaxk+Y738vuiMDZ8qiZowFXzcclWh944ZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5856

On 09/06/2023 10:38 am, Jan Beulich wrote:
> On 09.06.2023 11:29, Andrew Cooper wrote:
>> On 09/06/2023 10:22 am, Jan Beulich wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/ppc/boot_of.c
>>>> @@ -0,0 +1,122 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> By default we mean to use ...
>>>
>>>> --- /dev/null
>>>> +++ b/xen/arch/ppc/early_printk.c
>>>> @@ -0,0 +1,36 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> ... the more modern form of this (GPL-2.0-only). Anything deviating from
>>> that may want justifying in the description.
>> GPL-2.0-or-later is fine.
> Hmm, I was merely following
> https://lists.xen.org/archives/html/xen-devel/2023-06/msg00415.html.
> The text at the top of ./COPYING looks to suggest -only, and I'm
> unaware of any other place where our default is actually written down.

The license is chosen by the submitter/copyright holder, based on their
preferences/wishes.

It's fine for Xen to say "if you've got no vested interest, we recommend
GPL-2.0-only", but that is strictly a recommendation and no more.

If the submitter chooses GPL-2.0-or-later, that is their prerogative. 
We have plenty of GPL-2.0-or-later code in Xen.

~Andrew

