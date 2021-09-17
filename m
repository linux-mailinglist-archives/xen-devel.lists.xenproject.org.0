Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C34740FD16
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 17:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189495.339255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG4q-0006W3-DM; Fri, 17 Sep 2021 15:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189495.339255; Fri, 17 Sep 2021 15:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG4q-0006U0-8R; Fri, 17 Sep 2021 15:47:00 +0000
Received: by outflank-mailman (input) for mailman id 189495;
 Fri, 17 Sep 2021 15:46:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Eq=OH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mRG4o-00068c-UY
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 15:46:58 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11889cf3-44ea-448b-97de-562d11ded3d2;
 Fri, 17 Sep 2021 15:46:57 +0000 (UTC)
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
X-Inumbo-ID: 11889cf3-44ea-448b-97de-562d11ded3d2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631893617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=xc5XifEQVsXnyl+ZbEPS5l0E4aBxZPLm3FQyJKAUnc0=;
  b=b0EmUgeoZhOOSWUxpQrluSmqoUoRA+lCRXNGOcQ1CIyMzjsv9cZndKJ3
   FZQnHkQ6rXGoos5LKatC/7ZcJbjQmD3LaEmd+Ld7ct/oDmDV7TH0F7SXF
   3xFousb9J+YZpJkxIiq+Kk+uf0DtSi9SG9Va8Q8WIRkAdrORh8v/rz41S
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pOxK3cjNsiCcsVk2qd0VoLNGC3qVs7nlM9GbjU0ETwP5mjDbCqV4JndzjiUQ9sCu1dJf8NRvfS
 bmB81hJyPB3xxKTJyfjU5PbYQbPfr1X210I0Ri+ExKC6P0c57RtfjXgwcT7j1TjJI4RFJYv89Y
 54j6Wgzbmzgf1p11pR3c6SmAAo6rt7ti2eXq7Klo7QPwaKEtXNLOR1mBC1sOObscD0R2QlQxxq
 5izpWvDR8FZNK/x+9xz3ZJoo3AQvauD8UZZ9bZrJlowkLg4LtUCYyWaXj+lu6fWNu+62GlsHQ3
 c1/dATSiksu3SMK7tcCb78VC
X-SBRS: 5.1
X-MesageID: 53410938
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kVrkTq0Wkh0LjcACBvbD5eZ2kn2cJEfYwER7XKvMYLTBsI5bpzJRy
 2IeDW/Ta/+PMGP1Kd8gbIzjoxlX7ZDVmoBrSAJvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywrFh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhso0yx
 oVrn7WLSDgUb+7Rut4cQwEFKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIQEhW9h3ZAm8fD2R
 Jc8bQt3cx36bTpqfQxOEIIat+KHvyyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1UgUSwt
 m/A537+ABwRKJqY0zXt2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQjSPHsE46cfNrEtIHuUKQ6JDV8x7EPz1RJtJeU+DKpPPaVBRzi
 ATQz4i4VGQ12FGGYSnCrebP9FteLQBQdDVbNHFeFWPp9vG++Nlbs/7Zcjp0/EdZZPXOEDfsy
 nihqCEkjt3/ZuZaiv3moTgrb9+qz6UlrzLZBC2MBQpJDSsjPeZJgrBEDnCBtp59wH6xFAXpg
 ZT9s5H2ABoy4XSxeMulG75lIV1Uz6zdbG20baBHRsF8n9hSx5JTVd8Ju2wvTKuYGu0FZSXoc
 CfuVfB5vcQIVEZGmZRfOtrrY+xzlPCIPY28Cpj8M4ofCrAsJVTv1Hw/OiatM5XFzRFEfVcXY
 szAL65BzB8yVMxa8dZBb71MieN0nn9umzy7qFKS503P7IdyrUW9EN8tGFCPcvo4/OWDpgDU+
 MxYLMyE11NUV+iWX8Ud2dR7wYkiISdpCJbohdZQc+LfcANqFHt4U63awK87epwjlKNQz7+a8
 na4U05e6Vz+mXyYdlnaNiE9MOviDcRlsHY2HS0wJlL0iXItVpmisfUEfJwtcLh5qOE6laxoT
 +MIctmrC+hUTmiV4CwUaJTw9dQwdBmiiQ+UETCiZTwzI8xpSwDTo4e2dQrz7igeSCGwsJJm8
 bGn0wraR7sFRhhjU5mKOK7+kQvpsCFEyuxoXkbOLt1CQ2nW8dBne37rk/s6A8AQMhGflDGU4
 BmbXEUDru7Xro5rrNSQ3fKYr52kGvdVF1ZBGzWJ9q6/MCTX8zbxwYJEV+rULznRWHmtpfenb
 ORRifr9LOcGjBBBtI8lS+Rnyqc35t3Oob5Gz1s7QCWXPgrzUr4wcGOb2cRvt7FWwu4LsAS7b
 UuD591GNOjbI8jiClMQeFIoY+nrOSv4QdUOASDZ+HnH2RI=
IronPort-HdrOrdr: A9a23:SBrV2azKQmuU5hfoH25pKrPxv+skLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjmfZq6z+8L3WBxB8bfYOCCggqVxe5ZnPLfKlHbakjDH6tmpN
 1dmstFea3N5DpB/L7HCWCDer5KqrT3k9HL9JTjJjVWPHxXgslbnnZE422gYytLrWd9dP4E/M
 323Ls4m9PsQwVaUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZtzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDh1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoykfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW/2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gvMCjl3ocSTbqmVQGcgoE2q+bcGUjbXy32A3Tqg/blkQS/xxtCvg0lLM92pAZJyHtycegc2w
 xoWp4Y442mdfVmGJ6VMt1xCPdfOla9My4kD1jiVWgPbJt3QE4li6SHqondt9vaNaDh8vMJ6e
 L8uRVjxDYPR34=
X-IronPort-AV: E=Sophos;i="5.85,301,1624334400"; 
   d="scan'208";a="53410938"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrfTnXCmYWfM+R0x/MdNBensOUWNPuBdEmzcz4b3LAgSH1udHnWKDMrCu1BG5WSSSs9rgA7unc+BFtgRpsF1OhsmtDIzm45G3L21O1k5nf0aVx9PN9n/zyRPYCp2Xz7l7sQhnxXtTxpRLWUZjReoXfM2fiiDq0FY+8Qv1JpSAOkH4y0s5pv0P2NFWkj4BdQTPoUAsBVH7OebrRAeNNsfIstxPOdQxMJ/s7J7Fsx/eC95cziM5kDXhd8BR2kSkqtqinoVYi2g+Spj1GoELzWF6FOPL5H9X6Tq5QZOj2R1MYJqNRD41+0vPZZ1UJNCo34Lev+5KzegKhXKomrW7UszOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=P6No9nF8vaLlLWVxNdu1JhmKZDYGo8kkft5wXq/DnGc=;
 b=QZOm5UlHuVOLtEtJyTtlGa6rhHTP+M3FYYIJ92lj1DaXjxKWYIefz6e6MAmfH70Ng3nxu9968dKiyFlDkAgXD3jNw1I3n74YgKn3eQs1fBqQCSZaA5PaZfNup5fAG26ehJtdoaOFstdP23nxBXluzi+5lrtxe6PfiAcZwVTT2lDxanGgwWGFprFqM8vDn/XnwmFqCeHkwR9p9ii3PdufJ9efzQs6o5O2Ig/jDjvbsQMA8H/NkHB8XDLhW88mN+PZznToBDgujmf2QYC9sLPWe8rfC4kLghribmMW1tlaLZKTsxREm402PQaR9+55aBK/uQyAxNLw7PrShY5/EZsW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6No9nF8vaLlLWVxNdu1JhmKZDYGo8kkft5wXq/DnGc=;
 b=Vle/hxLrbcpyANodfXK1dFKMtMO5qk+6W+9hh/de/Ser8O0gCr6yv3lunPI72aIIOg2MKNa+R+rs9weQlNw149vMOFzZsgKZNoRJ2wgitJt7ZW2GGoVD+ZMfsQ2BTDF8cBKueNbvZTi70h7r8zaFaEN/ShFPfAcmQeTCy44FRlk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/6] tools/console: use xenforeigmemory to map console ring
Date: Fri, 17 Sep 2021 17:46:22 +0200
Message-ID: <20210917154625.89315-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917154625.89315-1-roger.pau@citrix.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0243.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51663f29-f51c-47d4-db21-08d979f25eff
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4057574B77A8171B40C800E18FDD9@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +IP6b9WqtYY0BCvD0zGkG70xxa0sfnFZSFJt2lqxtZOE+q+bR7+nrm4J8TwNmhnmGvVqYoOGE9OkxiJ2reg2QiHv4x8oPZca/8prw4iAnoyDkLLnGRkNTCYD7Whgja1mZqBqETRUOrOtCfkNRf5mtWiw5/RG6ssBX8PSrZCDymixcPruAlUO1UUpOk8W6NTs+4ovb20EkHKxwviYXpaLFHVfeSwqS5GiKu9bYTH7hKlYYA02aEP8zFjb+2f04gpvAvENJmq0CHI2XoEbfwY8zTsE/ZqF/0oZDkyIiSUhEW+9cxOrGFdeE1xJwR5M+qkClw0xbAjm54laaV52PP40Zd3tivHGv05RRGB7bHu+K8E8xEJ8kuOv8Rf00IjuiKx1DbtWopfpwu6E369cz354nbOVZGFqgLGmj8IFn5HTjyvCjx/aKvIqkNfC3DxZgTnoCz7o2Vnq5oi0KCJL//RDBHO9S3cZzPcDFpXNJjj/vof3k1J7f5WEi+GBYGLsbOFh1DJ4uqKeojxSYuun3XOc6cI/SW5rF9xJE2Y4utQgr54BOXmo/vPibTU2j1MyRTMLa0nQmv1292rAQllqR56KMo3ZgBBE+l6+XUvcjfyD7hf+wfjEvAFErSA15ErvrK19zSzNWjavPbv6bGpIILrhvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(2616005)(956004)(66946007)(66556008)(66476007)(316002)(6666004)(8936002)(8676002)(2906002)(4326008)(186003)(26005)(6916009)(54906003)(6496006)(508600001)(6486002)(38100700002)(36756003)(83380400001)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHRaa0dZd0F5eTVVQlN3WkVHY1dxeVVib2RzK1hRVmZ2MHFVcVBod0ZEMjJr?=
 =?utf-8?B?eHBrN3VESTArblhLZEJQMmsxejkzQUZaU3FWNVpPL0VWUzI3SGhBZGlRaTh2?=
 =?utf-8?B?M0gwcWoySW1Ucnh0bmNqZXQraFM1cEt3amFMam5pR0llRTdWSmRudkRKcCt6?=
 =?utf-8?B?MjF3eWo1ekliUDdYNWZOampYbERmV0hxZTlxeTQ3QzJWSUJxYU9hdTBOMTha?=
 =?utf-8?B?enZkcDFqaWNCRkdTWld2dGxZbHczRkhHam5RSFVFenh2VDd3SzRjdm1FWmo4?=
 =?utf-8?B?clN5MGFaR2txWDA2cWZlQmxUUkNvYnRuZWVWZGh5VlgxOUtjYTFIUE02WDdH?=
 =?utf-8?B?NStFNTU3L0JGRUhET2tFSExVcStNN2ZFUCtiUVQ5bkNZL3NBbFB3TzZrOTNN?=
 =?utf-8?B?T3E5UEh1Snh0TDJaY2pVL0I1U0M4TmkxanpURTBTY3d5MVVZaVg1bTRHRUsx?=
 =?utf-8?B?VVJ3L3hsdzV3ZWkyb2d1S0VFN2dDRDBTOVZpSUI0dXE5djBtTHEwTm5iNXdO?=
 =?utf-8?B?eS9hZ2dOUU1rWjlYRmpzWXJzYlJ2ejdFZzB2VUJqbnlaUVI2NlZqTDNiOWFa?=
 =?utf-8?B?RFZReFYyNS82ajhGS2JidU5NdDFFY1U2Nys0dzJLVlVPOUN6QTVRVzU2N3Ji?=
 =?utf-8?B?TmZWdWd2WmZTZCtueXNlWHQ5eFFrUUFzVkZubkRoUEVMZXdUK2NJcXB1WEU2?=
 =?utf-8?B?QkNCeDdJSEs0RkNZRmwwc0ZqZFRJbGpIS2l2VFJ5ZHNTSUJXZ2ZOK1FzZ1gr?=
 =?utf-8?B?OXg5V3JmTWxhNTZTSjNwQ3IvaU5tUGR2c2RZZmNoUE5XVVM0WkRVaWEybVhJ?=
 =?utf-8?B?U1dESUpLKys1WHlFZmhTK2VFTW1aRzkzNGJ4NkpKQmNHV2NTSjhhTUdxbHVZ?=
 =?utf-8?B?RERzYi9ObGhKNllVcXZmemt4cUt5N2VPeTMvckZUUzl0VktrVUxXMG0wanZr?=
 =?utf-8?B?S0tCZEtnTFpNaUhUN0I4eERlREVNSk5DVXZRa1dFc01QZEJHQjV1YjY5NlRn?=
 =?utf-8?B?MkV1NTdGMDZBeFBPTHhKSkNDTlY1ZE43WmVOU1BqWTdqSS9lcDl0Mm9sQ2JL?=
 =?utf-8?B?TXpWSkNvV1hTaUdCVGh5WXY5K1VXc1l2UDFyK3JrV1pOd3dpczRxMk0rdEYr?=
 =?utf-8?B?S3dlbmQ1ZmRqRWIwRW52Y3dxVk8xZDdJQXBnaWpwemRaVmJhMHovYmx2VWtO?=
 =?utf-8?B?TlR1djd1QWJQa2JDUEdBRXlXTU1VdENvSURTd1dEY0VBb0xGKzZRalIxUzJG?=
 =?utf-8?B?WXJ4eC91Q1BKcmNHNzQ1dHFmbzBCNDViMDA0Y0tGWTloMUlTNGZ3MmF3dUo5?=
 =?utf-8?B?NkpiVXptdlpjWTJBZHFOU20wVjR5cE1IaVlWb1BsdGw2Y0lYN3VjdUorM1pN?=
 =?utf-8?B?M0FKYllPSFZOMVpHbGhoSGJEYzNUNHZyUm1XRlQwcVYwekYrRHp3bnlmaGtG?=
 =?utf-8?B?bS92aENPMTdLa1JESWNKZ0xCWFBrVW5YVkE0SW1EVEZUUjJXMXJIbE1iNkEx?=
 =?utf-8?B?MHdIaE92NkdNMFRMQkJ4NDI3SE96eHNPd3dmNEdLK1hnS3dXZUczL3l1ZWNP?=
 =?utf-8?B?aE5iak1ZSHFpZHpiMFJ3VitQNmlVTmJlTFl6WUNJL0h4U2NJekFHRkU0djRC?=
 =?utf-8?B?UFVEeFNJLzhzeVlmblhOTk9jRU4xNTdwSUtZRzFwVWlLQnhvZXpTVEpBMjI4?=
 =?utf-8?B?SHJ4UWhvL3NyL1ZLQmRXWjlvNHRiaEJma1B0eGM2MWJYNC9Md3R4N3FFelI5?=
 =?utf-8?Q?LLmaRa3nvc8yhR9Qky5RguCZBFPiPsW1P1E3zMk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51663f29-f51c-47d4-db21-08d979f25eff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 15:46:53.4280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0woerLFdqsuRCe72mwIkSNYeJvsgP0s56UMCmMCybsjtimS/Ee49skWezQBYyo7JTXsY1HPOjUmxwpCPLiqWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

This patch replaces the usage of xc_map_foreign_range with
xenforeignmemory_map from the stable xenforeignmemory library. Note
there are still other uses of libxc functions which prevents removing
the dependency.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/console/Makefile    |  4 ++--
 tools/console/daemon/io.c | 25 ++++++++++++++++++++-----
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/tools/console/Makefile b/tools/console/Makefile
index 84796eac8f..3f4cddab03 100644
--- a/tools/console/Makefile
+++ b/tools/console/Makefile
@@ -29,9 +29,9 @@ clean:
 distclean: clean
 
 daemon/main.o: daemon/_paths.h
-daemon/io.o: CFLAGS += $(CFLAGS_libxenevtchn) $(CFLAGS_libxengnttab) $(CONSOLE_CFLAGS-y)
+daemon/io.o: CFLAGS += $(CFLAGS_libxenevtchn) $(CFLAGS_libxengnttab) $(CFLAGS_libxenforeignmemory) $(CONSOLE_CFLAGS-y)
 xenconsoled: $(patsubst %.c,%.o,$(wildcard daemon/*.c))
-	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_xenconsoled) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_libxenforeignmemory) $(LDLIBS_xenconsoled) $(APPEND_LDFLAGS)
 
 client/main.o: client/_paths.h
 xenconsole: $(patsubst %.c,%.o,$(wildcard client/*.c))
diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index 200b575d76..682c1f4008 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -22,6 +22,7 @@
 #include "utils.h"
 #include "io.h"
 #include <xenevtchn.h>
+#include <xenforeignmemory.h>
 #include <xengnttab.h>
 #include <xenstore.h>
 #include <xen/io/console.h>
@@ -73,6 +74,7 @@ static int log_time_guest_needts = 1;
 static int log_hv_fd = -1;
 
 static xengnttab_handle *xgt_handle = NULL;
+static xenforeignmemory_handle *xfm_handle;
 
 static struct pollfd  *fds;
 static unsigned int current_array_size;
@@ -675,7 +677,7 @@ static void console_unmap_interface(struct console *con)
 	if (xgt_handle && con->ring_ref == -1)
 		xengnttab_unmap(xgt_handle, con->interface, 1);
 	else
-		munmap(con->interface, XC_PAGE_SIZE);
+		xenforeignmemory_unmap(xfm_handle, con->interface, 1);
 	con->interface = NULL;
 	con->ring_ref = -1;
 }
@@ -722,11 +724,12 @@ static int console_create_ring(struct console *con)
 		con->ring_ref = -1;
 	}
 	if (!con->interface) {
+		xen_pfn_t pfn = ring_ref;
+
 		/* Fall back to xc_map_foreign_range */
-		con->interface = xc_map_foreign_range(
-			xc, dom->domid, XC_PAGE_SIZE,
-			PROT_READ|PROT_WRITE,
-			(unsigned long)ring_ref);
+		con->interface = xenforeignmemory_map(
+			xfm_handle, dom->domid,	PROT_READ|PROT_WRITE, 1,
+			&pfn, NULL);
 		if (con->interface == NULL) {
 			err = EINVAL;
 			goto out;
@@ -1341,6 +1344,14 @@ void handle_io(void)
 		      errno, strerror(errno));
 	}
 
+	xfm_handle = xenforeignmemory_open(NULL, 0);
+	if (xfm_handle == NULL) {
+		dolog(LOG_ERR,
+		      "Failed to open xen foreign memory handle: %d (%s)",
+		      errno, strerror(errno));
+		goto out;
+	}
+
 	enum_domains();
 
 	for (;;) {
@@ -1462,6 +1473,10 @@ void handle_io(void)
 		xengnttab_close(xgt_handle);
 		xgt_handle = NULL;
 	}
+	if (xfm_handle != NULL) {
+		xenforeignmemory_close(xfm_handle);
+		xfm_handle = NULL;
+	}
 	log_hv_evtchn = -1;
 }
 
-- 
2.33.0


