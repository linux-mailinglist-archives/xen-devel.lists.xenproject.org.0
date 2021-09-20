Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759D1411327
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 12:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190746.340524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGvk-0003xL-JL; Mon, 20 Sep 2021 10:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190746.340524; Mon, 20 Sep 2021 10:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGvk-0003uS-F9; Mon, 20 Sep 2021 10:53:48 +0000
Received: by outflank-mailman (input) for mailman id 190746;
 Mon, 20 Sep 2021 10:53:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxQs=OK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSGvi-0003uK-GI
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:53:46 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0652b07a-1a01-11ec-b86e-12813bfff9fa;
 Mon, 20 Sep 2021 10:53:45 +0000 (UTC)
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
X-Inumbo-ID: 0652b07a-1a01-11ec-b86e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632135224;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=eIpQVoAWPDK76f3PRLpFpmQxugrY0f9lvwH9M+M46rg=;
  b=Z/kEi6KSds1RDPEnTGA4eh/1mbmPSYjue0idsDm/faTKRmsCWLK+vM3E
   +TBJ7XbnOInUTCuAAtZz2lu6DVGJCfzCPAwVdBcL0RyeccoVjbm1nM4lv
   B3sQUTNJ+SW3W44QX1WYktQAY5ycyMFYX+Q1hHliI+Ks2i6Ak3SJJ2zdn
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RAVCgpKBBnsDhrI9+xBzeb7pLzk4gcyjl0IPITZMFit6sK6PPCRlEN6eSxTEhryA0CzZeYlxsQ
 UC1R+9q+T5NgEMPLDQHNzEvHc0dGY7JU/U+XJkJzRyKqRqsfN/4IDNx+Sl2qkI/YbxTBW+E3B+
 iW2qIJIfcKPEyRCGTpiUwWmi6rF5Zx92cr98BwyM37llVf+Aq+3LDXdwbXEyVYAG2hPXOkrCoV
 7JuqXMRR45b0jrq7dg3FEOsnWEgATjg5WXltMPGwFRM0iZeR6zUVtP5vms+bed9dYXaUWIGzed
 CPgUYhvbFJvUZ+vz5ES0Z6a4
X-SBRS: 5.1
X-MesageID: 53522888
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IGMRiKMYJY9chnjvrR1xkMFynXyQoLVcMsEvi/4bfWQNrUol1TMFn
 GEbDGjQP6mLYGrzL9kkYN7k/R4G7cWGztAwTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En552Eg7w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozOInNMuk
 YhJia7zYjYRN5aSlecReRYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iRuIUCjGdg7ixINd3VW
 ek0exFPVxXBSBgeBQk+N6M4pt790xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiR9hRn0uej
 nLL+SL+GB5yHN2AyxKV/3S0nOjNkCjnHoUIG9WQ9PFwh0aI7ncOExBQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nMk3Rj91j
 wKNo+GqLg1XuYbLRHGR3LjB+FteJhMpwX8+iT4sFFVeuom48dBr1HojXf44T/Xk1YSd9SXYh
 mnQ9Xlg3e17Ydsjiv3jlW0rlQ5AsXQgouQd3QzRQmvtxQdwfofNi2eAuAWDsKoowGp0SDC8U
 Jk4dyq2t7tm4XKlznXlrAAx8FaBva3tDdEkqQQzd6TNDhz0k5JZQWy13N2ZDBwzWvvohBezO
 BOD0e+vzMYLYRNGkpObk6ruUp93nMAM5PzOV+zOb8omX3SCXFbcp0lTibqr9zm1yiAEyPhnU
 b/CKJrEJStKWMxPkWvtL89AgOBD+8zL7T6KLXwN50/8iuT2ib/8YeptDWZimchjvfvY/12Ko
 4gAXyZIoj0GONDDjuDs2dd7BXgBLGQhBICwrMpSd+WZJRFhFn1nAPjUqY7NsaQ890iMvuuXr
 Hy7RGFCz1/z2S/OJQmQMygxY7LzR5dv63k8OHV0b1qv3nEiZ6ep7bseKMRrLeV2qrQ7wK4mV
 eQBduWBHu9LFmbN9QMCYMSvt4dlbhmq216DZnL3fDglcpd8bAXV4du4LBD3/SwDA3Pv58szq
 rGtzC3BRp8HS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbDj
 lSYGxYVo+XJsrQZytiRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvocgQbZmyaUyu4nmq7NAl1k2GXzKaxKgC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Dv/06LXLz6DJz4LfaA15ZOAOBiXAFIbZ4WG//L
 TzNZCLCB9SDtycX
IronPort-HdrOrdr: A9a23:C0v8+62OgWQISiqZX5wk4gqjBS5yeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5Wo3SIDUO2VHYVr2KiLGC/9SOIVyaygcw79
 YFT0E6MqyOMbEYt7eL3ODbKadZ/DDvysnB7o2yvhQdL3AYV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1EtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqZmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87ysIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXoHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1nackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMG9yV0qp/FWH/ebcG0jaRny9Mww/U42uonZrdUlCvgglLJd1pAZGyHo/I6M0rt
 gsfJ4Y0o2mdfVmGJ6VMt1xN/dfOla9My4kD1jiVWgPNJt3cE4l+KSHqonc2omRCes1Jd0J6c
 38bG8=
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="53522888"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyBVWgihQPpJFdpahJn6SA7LSBaugD+k2Kc5rCRgJBU0flEV3MGHC9HpcZ75RGuxnTxOjFoYqYC9TA4cRrlaYceFEAXh1GQmcNe9MNqgk1jxWPGLwH7St3Wa5KMFPZMUPm+9goZk0hXPFmLMFpCCR6Pt+9gQWrcCY22ky217O6cKKngJgcvJgBDclfk747cFusviYlX33V2PtBVcPG9qHSH37oZj+/fLJW5x7lWr68CXbikvk4hJoaD7GtqkJ+A9a+416KAkAtFoNrtLU6ErUut3PI4sjkHkhdLK80nT2qazAPVDzGwTrlmqDw9BKXsTEhIElXOkbJjpONSOWFv9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ea/QQyMu7ExwpRYNFalsAY59NvqeBjZYHdIQjejtLwU=;
 b=Fl/UzympctbNGmBKK2sjBk5pCgAQMAZ4XpZuZETMposdsMsQepgHp1hj9h6hM+8OySB2mvbwhalwAW5CqdWKyEwv+ga4yKCofrTurSYT1VWvooz7fZODT/6RBy5imRy3qCy7jzQjQZymFWahfdd+wGNAPKk0bYye4cZtQPVPVRr2u5B7OIrdoGyuMwlnKOOo5dnp9tygZYoNUE5ZwRUBZgbhyyYfGCJlKK83ZdMYbBxhJY23p1/Ry9sZSaM2Dy5Ss7OXglcj7um68lUu7wyc0c5hCfuIG26D1vL1al7wG1/t7uKRMo1Yp8NZoBoE/ROrWKaU0z9RoznyGCN3Zm+jhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ea/QQyMu7ExwpRYNFalsAY59NvqeBjZYHdIQjejtLwU=;
 b=Cpn7oC7aGTn3Dps/yKFDR4tE6bype8ZBtzTyMcNEz6CiP00wNuYMx9M4gKr5gm9bFLkWXYqIPddYZBHzEM6I52XzkHVA6RhxcX6AFOf4lj62AD7bgAwyaG69c2QcGgeO8gFfDTU+5CMpBsOARtLQ+Quaygh75UFvXEjMLZ+lLfI=
Date: Mon, 20 Sep 2021 12:53:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH 4/6] tools/xenstored: use atexit to close interfaces
Message-ID: <YUhoLnpv+Dq/dFBR@MacBook-Air-de-Roger.local>
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <20210917154625.89315-5-roger.pau@citrix.com>
 <90f64a21-d5fc-fab3-2f3c-73de00421cb3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90f64a21-d5fc-fab3-2f3c-73de00421cb3@suse.com>
X-ClientProxiedBy: LO4P123CA0167.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82f95343-9efa-48bc-5b4f-08d97c24e749
X-MS-TrafficTypeDiagnostic: DM6PR03MB4603:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4603B9C76620434485C174BD8FA09@DM6PR03MB4603.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dya1pNuQkT6bLBjXnQPrExlRSpgkN/mCNHNlXkDB+0ELzR7kynANuaHM0Sa7t7Rrjko86znJ06WP/s4z/t7MK1vLnGqTvtkz0SWyGFbJwdDM7UbrKHjCNi3BbOad67XAFBxZ1gc9eedUuYa8sMp9gQcjGaNmIAqHnSAwA10+Xu/zvaMqj0iet/v3TCGtDxTXJSxpbmefta3jE4Meh3V6dZNkQKmdQ8/IjqSjouSAleAkSVb/65GkVlO6jf1dAfpvxx4qcv1k2gPW06q7FVswuNz8VKwd7LDhSLtSzUyDQZeaQfGwZwdVfoQI4ZSUtTixEsiYvdBLZw6rTMf8Peu1Qovs850eBqUXAJZDoAUxWaTHgqdZVyjoXoZr2MJwr24kyPVddKfP+muLfs0Mw1sto8CgBAsPHDDHFdjB7K/lzGuI5jrZDj1x4gLjFr0deRQkUC4JJC2ehv90Psuf1t+PJjSLW71Y1QDPnyqJ2uR1yjAp3EpO+26Cra5ZDdnYVjM/Uo95on5KabQxE+glikZdMb/xn0w3g7XFGRijZQ1ka0iWhK9oKZYuzSAAs4cXzEcTCOXPNHKiyhqHaf63ovGdy9wXNcYM47g1nReVdATSFaJ6MnNbwrMmzbWPwAqxlKKPwD2j7bX2yDBmfhVE891evg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(5660300002)(8676002)(8936002)(6916009)(508600001)(66556008)(6486002)(53546011)(38100700002)(4326008)(54906003)(66476007)(66946007)(6496006)(316002)(186003)(86362001)(85182001)(26005)(956004)(9686003)(6666004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG1QZVhYbXMzQkZ5dUZtVno3cUd1QmtnTDRIMVRHaDNXY2dQUnkvdTI0d3NM?=
 =?utf-8?B?L3pycVF5bzFYT2tweWpGVUl5b2hzL0szSUZidS9UbWN0SU5mc3c0ZEFJMzhJ?=
 =?utf-8?B?M2N4eWFtWFZLTGhkSGVYL1JJamZvbk44MEEveWtlby9CT1QrbE4wV1hUcVBo?=
 =?utf-8?B?YmtkK0dyWWtNSi83L2RiWmJ1UnNCd3g2ZGZjYnFWenJMV3V6WnBOc2xQU2E3?=
 =?utf-8?B?OWtmUkRMLy95czdHdkM2NDFuK2RHUXlCNERNQ1dtSWw5dzJiVFY0K1FaTERY?=
 =?utf-8?B?bHkzMUhqaUlmTnZla01XazNtOUtwU1p1YzZLQmNTb0tlRTY0aUNnRk56WmRX?=
 =?utf-8?B?KzY4RzNXVWpvYnZjb2lyRUpTVmwvSDU2UlBkNDJWR2hPOXgrZ2pZWjlzRnR6?=
 =?utf-8?B?a2RwdzZSQ3FDTUdvVVlNajB4c01TK1FwZ1BkaVFGWkNwYk5BRXNoeTBnR2ZS?=
 =?utf-8?B?UzVUb3p4V2JvWGkzM294OWd4bUNCSG12SlZFeGxYVXZzanZiQUNXeFRMaVhU?=
 =?utf-8?B?Z2hvYUc0N2NYUDFsdGlQSGRBTTEreHB5YmxGRDl0cSsyUHhCSlIwRVhGaTNZ?=
 =?utf-8?B?U1NERTRGRlNhby82TmpBdERZTG1ZNzNrT3FFcnBiVmJTSzkzbXIrL2xrcjhy?=
 =?utf-8?B?TUs5L1FOWkRVeC9QZ09QVnNBWTBHZ2t0MDVNZHAyZjdJRW9FTUpxN3FQWEVI?=
 =?utf-8?B?U0lIdkhCVVlNNnlETUdDMXNhYUladWNVMTRsS09zSjZ5RTE4dzQ2TjlMVEly?=
 =?utf-8?B?ZDk3ZFU4Ukp5b3ZLRzUvd3p5TU5DNUlGSkhDbGpCMm9mQ3UrbGUzNUlLdHEz?=
 =?utf-8?B?cGxuUHJvVVV0Q29HQmhIOC9uaWNMTzBHb01oU0wvNkV5TEt2VTRHczJ3SGxZ?=
 =?utf-8?B?OUthRzNSR21vMGFnck1Qc081LzNQSFM4cG15UTQ1anNlcFRWNmZvclBXbjFz?=
 =?utf-8?B?K1pUZ3hFZHVJRE1pbTFBanVETG80QkNlaHNhL1VnRVhKcm95NU9CaXNOcnBz?=
 =?utf-8?B?Nmo4Nm5XaEVxWUZneGJiMGN4VWYvcE9BazdZdVU0QnpEOGFGOCs2bHAxdnJJ?=
 =?utf-8?B?aitrOFdTQU90QUh5YkU3OFo3MzJ2bThTZjZXVlhxRlRWQ004MFRrTGo2RlNL?=
 =?utf-8?B?bDJ3WldjMkNuSjFjMVk5aG5Ib1hteTc1R0VBQkVBSWQza0s2RWJhUjZISlZC?=
 =?utf-8?B?OEt6TXR4aGUvWS9tOEtWeVJwS1ozOTNkVWlZVUJ5WkM4bTVoY2pEby9xYVZ1?=
 =?utf-8?B?L1dSNjFmS2FVd21wa0pIZEVGbk5OcUVSZWtsSWVHQUxwZ244SWhkZCtQQzRm?=
 =?utf-8?B?WTRXZlp4UWVoeklhOFlWbVVWTWdQTlZMRFFGQllKWEhPZzR2M0JOV1ZvWGh0?=
 =?utf-8?B?NmpoOXFyWUNnSlV5Z0ZKNFpFSTFqbVNhdHdQb0JFaTJEVXk5VktiK3ZpQm0y?=
 =?utf-8?B?cEFXRUdtdnNKcE5FYW9lUW5VZVNERWw3dmRnT0wwaXd5ZmtRcDQ5ejlwRDZm?=
 =?utf-8?B?aTFteVNvZVBIelVpOStpZ2FCNjlmdnNYbk9hN0ZaU1lzSTYrRFo2NkpzN2lV?=
 =?utf-8?B?SGUvTlNXUWgvZWExc2p3L29tTy9lWHFkNlhielo1LzBSNUx5YjFmbGtkcWdv?=
 =?utf-8?B?cTR5bjlORGk5UFBlTTQ0S3dZekxvR2dtR2NuaGQ0M1lKcm9ZYjYzcnRxS2tu?=
 =?utf-8?B?QUMwWXNyOTgySDY3L1d2VEdILzFXMG4zUWk4SS9oWWpIVWpUTllOdEtjb3pw?=
 =?utf-8?Q?LMCFWbphCX6qMOzGpfiZd9xvHuYsMdpGZny73fc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f95343-9efa-48bc-5b4f-08d97c24e749
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 10:53:39.2618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmfdmPNR5Tg0+Q0YAL04qRXeDHNhtfiTeY0viNYrfVnIGg04CNVY3C+2fztCM2G1BFq5aaDF9P+3rgfbKAySUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4603
X-OriginatorOrg: citrix.com

On Mon, Sep 20, 2021 at 11:22:15AM +0200, Juergen Gross wrote:
> On 17.09.21 17:46, Roger Pau Monne wrote:
> > Exploiting the talloc clean up routines to close the Xen interfaces
> > is cumbersome, specially when atexit can be used to the same effect.
> > 
> > Convert xc and gnttab to use atexit which allows to drop one
> > indirection from the storing variables.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >   tools/xenstore/xenstored_core.h   |  2 +-
> >   tools/xenstore/xenstored_domain.c | 57 +++++++++++++------------------
> >   2 files changed, 25 insertions(+), 34 deletions(-)
> > 
> > diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> > index 47e9107c14..8930303773 100644
> > --- a/tools/xenstore/xenstored_domain.c
> > +++ b/tools/xenstore/xenstored_domain.c
> > @@ -737,35 +725,38 @@ void dom0_init(void)
> >   	xenevtchn_notify(xce_handle, dom0->port);
> >   }
> > +void interface_cleanup(void)
> > +{
> > +	if (xc_handle) {
> > +		xc_interface_close(xc_handle);
> > +		xc_handle = NULL;
> > +	}
> > +	if (xgt_handle) {
> > +		xengnttab_close(xgt_handle);
> > +		xgt_handle = NULL;
> > +	}
> 
> Could you please add closing of xce_handle(), too?

Sure, I somehow assumed there was a reason for not closing it related
to live update, but I see that's not the case as you use exec to
launch the new image and atexit handlers are not called in that case.

Thanks, Roger.

