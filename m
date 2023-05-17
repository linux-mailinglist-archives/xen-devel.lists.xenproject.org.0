Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2186E706F01
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 19:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535998.834113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzKaR-00017F-MF; Wed, 17 May 2023 17:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535998.834113; Wed, 17 May 2023 17:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzKaR-00015X-Hz; Wed, 17 May 2023 17:05:15 +0000
Received: by outflank-mailman (input) for mailman id 535998;
 Wed, 17 May 2023 17:05:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bcLS=BG=citrix.com=prvs=494da41bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pzKaQ-00015L-9i
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 17:05:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbd7b5c0-f4d4-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 19:05:12 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2023 13:05:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN7PR03MB7087.namprd03.prod.outlook.com (2603:10b6:806:357::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.35; Wed, 17 May
 2023 17:05:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 17:05:08 +0000
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
X-Inumbo-ID: fbd7b5c0-f4d4-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684343112;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Fg5W1XDHXS/R4/B4+Apfe6z1HaDLwENesQB3BTFUihY=;
  b=fyzxdTTaLsde8xr2tzvlBgoGmYe8hDxkwfjjM0zpd3h3Q04hbeuPgp1e
   T+ajggS+z6/8wOEwlIwz2GYuqcH/OyLyXAoncdVY7XnqF/1JQfvA4Q6DT
   GVKiKSrjC+8TP9KAqBs70Ex9SUO/7yHewRnsJ4DMDr/17aoKklQlKJMOy
   U=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 108161360
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:70YE46Kss/X1wu3kFE+R/JQlxSXFcZb7ZxGr2PjKsXjdYENS1zwCx
 2QeXm3QP/jfNmCgKd8gadzn9kkF7Z/Vy9I2TlBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wVhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4nW21Ur
 P8BCgwKVUjcxOLv8KiFd9tF05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLkGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHurAdxLT+PgnhJsqAfO+3Y/NxtRbAOy/8uUiXWbSvgHF
 lNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4J5oflqYRq1hbXFI87TOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAtTA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:sk/xtKNqe+JMecBcT9z255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBYpTnyAtjmfZq6z+8J3WBxB8bZYOCCggeVxe5ZnOjfKlHbakjDH6tmpN
 xdmstFeaPN5DpB7foSiTPQe7hA/DDEytHRuQ639QYTcegAUdAF0+4WMHf8LqQ7fnglOXJvf6
 Dsmvav6gDQMUj+Ka+Adws4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/PwmE0gwYWzZvx65n1W
 TeiQT26oiqrvn+k3bnpiPuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkd6yesCszqOSP7k9vtN
 XXuR8vM+l69nuUVGCophnG3RXmzV8VmjLf4G7dpUGmjd3yRTo8BcYErYVFciHB405lmN1nyq
 pE00+QqpISVHr77W7AzumNcysvulu/oHIkn+JWp3tDUbEGYLsUiYAE5ktaHLoJASq/woE6F+
 tFCt3a+Z9tABinRkGcmlMq7M2nX3w1EBvDak8euvaN2zwTp3x9x1tw/r1pol4wsLYGD7VU7e
 XNNapl0JtUSNUNUK57DOAdBeOqF23kW3v3QSKvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtFQ1Z1nlBaS1rdx2Gyj2MSeAtAnWu4RjD8ATgMy5eFOrC1zMdLkWqbrinx1FaferHM
 paO/ptcovexCXVaMB0NjbFKupvwEklIbwoU+kAKiKzS+LwW/vXX7/gAb/uDYuoNwoYcUXCJV
 ZGdATPBax7nzWWsznD8VfsZ08=
X-Talos-CUID: 9a23:Q3VPkW6a7dJtpZ5rmtsspBQYAJkma1/hy0yIfAy4UFZzdoCnYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AASGmrg3VXAPu7zFNPyc5K6IeVzUjufmTEmwyl9I?=
 =?us-ascii?q?/48DaBwFzABKMpmyKXdpy?=
X-IronPort-AV: E=Sophos;i="5.99,282,1677560400"; 
   d="scan'208";a="108161360"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jq6nYJHmkfdqPQQL4hwJp7joIYdnVfRpSo3HalXXB5WsJbiV1h2rEK5FcmN7YOO7eKnioD1LTKcr1Xyj4Wd9Pon/aa8XTPVjKSsviXjoV6CQUxxGJ1wG6IiNjKffYjK269YeXNJw3fAwqAvIt1Yj8RNnXJGL0XDrGZaSHov8SUPPHgSpZYPCXHES31X7XG47QjHjRwqaGqixjGOlvE6VCzXIXJyjM9+XaGSdznk2+lsAkWVT4dU1JbTpD/XwqOoFUAbVYIJoGoDRIN8Wdahjb/R4QRINReIbMVSNPCf5dvXiBx8AC57YUU8915V9ZaptMZeXX+IapuPPmGrYKTb02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fg5W1XDHXS/R4/B4+Apfe6z1HaDLwENesQB3BTFUihY=;
 b=hGw8n8JpBaQthuX569uZ/6swp/NJYZI/5NGI0IaqhlYdLVCS4AmTzsifI6jBP9FonG3iLOCv+QjaITROQ3gpBqdrFKf4h1oJs4zCrHw523Yq93hX6dXI/Xj2+WSuVov3vp0BJrrsSFOCk5nbALfVYoDC4HdJE8wNA/DQiI0FldLPE1ko9EIYrCv3DgDalwyVDCE+50IS+SZREK6nppCvvVvTj5sbUmGlIK4Va6URvAuyx5em4EJVG0V474Z5bowbq81y4ueJx54AaihKU2AntVlXCyKhq4YGj7EuehVuiCMUGbgx4fMptmUB1wvugOMmkVpQXXf1dsQ0dX4pigPz4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fg5W1XDHXS/R4/B4+Apfe6z1HaDLwENesQB3BTFUihY=;
 b=XWrVBGX+odPhN8FrgmfG4hRQXIkwSst3ww1U/BwGAxn1M0EPv24TVGi0hDqtJVqgChZ35lk2C2i9Ofr0JTbkEBUntUL/ukIb/OaiEU90x5a/Qy7+DFWoCqsKfLfd1RK21htOW81TQhLYxQQlTFQ1FSJ38MbYFn60DdXazKV8r/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b79b5b32-7bcb-b4cd-1594-e16aaff640e1@citrix.com>
Date: Wed, 17 May 2023 18:05:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: do away with HAVE_AS_NEGATIVE_TRUE
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <f994f67d-e0de-ad28-d418-1eb5a70bc1b8@suse.com>
In-Reply-To: <f994f67d-e0de-ad28-d418-1eb5a70bc1b8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0130.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN7PR03MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 701d4ec8-cae2-4fcb-d85c-08db56f8de0c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FQ8JfmoPW4SCRrR/z48AriZRvlcC9LzURJ8HHHaPRWnZoiq9LveYv4swAIwaPxaPTHXujhlWSySpaBFmWRN9W5pfoaVUc32PCP+27C10TFUEkp+/0qhBtVph6NHiBAChdlj0n3g91fL5ttZX3qMPJyal0F7M8Pl23niVEgbBW0lcaOyJ09BdJt5jCKUTXIcfGyJ75+mpNHnit3cMMZmFT/Mg2ACtK0hnTScYwylWRI3+pvJyVytJXaiR842Ndsf7kiMz61DEJGTixAvJEjXRHNQzs+MTbwPrtIr/rUA9pYk9v878H3uuVSCKvcTNvXqWb7e3npvf4//Mx8Fr9gd90nx19qQjBHEK3RV9bMN3qchymNyuvxgWBxb1xql9DTno7VUXKWI6jxw2KsB0wKjraZmU486vQ8UdFp+UcD8rUE6pN36Ppc1epBUV/XHPWIos0h7LC2IaLd8jS9ykDwzi/zmR7P1Tm5haQKWKSFr7b2eZbJTvb9o22c06Bfr5XDzecttK5bF2Lw3230EllAAFDRLB19CHSYXQSDygi1liBy7n5YuKmvZfW8ddVlq506IIZFcoxwz4ZJVhJrDUMwbOkB3Ya8Uh/d6fNL7xIVPWDSa9Ivwk2iunvenstBbGpqIdqwR809F9qySXXmN32oBReQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(31686004)(4326008)(66946007)(66476007)(66556008)(478600001)(110136005)(54906003)(316002)(36756003)(186003)(6506007)(26005)(2616005)(53546011)(6512007)(107886003)(6486002)(41300700001)(5660300002)(8936002)(4744005)(2906002)(8676002)(6666004)(82960400001)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUczNmJaSmJuQk1kbXhPTXQvUDJnQVdzUXBMcGZFZk9kZi9BSStxbVFVR1lK?=
 =?utf-8?B?eWN4MmtoZ2lsKzJpZUh1TnJ6RzAxendOeGFKQXhiWUVtL3ZBL0ovY1lUeDFn?=
 =?utf-8?B?QTRHK1FFQ1BSNkUwUXRBSHhTMnBPVUR1K3BOQk5id3NUbXdhVldCd3RmeXl1?=
 =?utf-8?B?WWxlK3BtS3B4bDJMTlFpbWFoVU05ODNrQVFlcDJWaDA3VktaU1VrS0JaeFg2?=
 =?utf-8?B?d2g2S3ZwK3RkMGxBeEloZFdaMzFHMWVXMkFyMFk2OWcrbVZQR2ZxbU1aNlIr?=
 =?utf-8?B?YWRmK3ZMSEp0cnBxMDFmanppVFhCeEdoVVlTK1NUWGtjRnJMb3N1U3I5L1or?=
 =?utf-8?B?Rjl6UDdkVU1FeDhOcnNOUTkrdTlNSTdzci8xb0Zaa0V5Zk9VTTNMaCtZUEJC?=
 =?utf-8?B?dVFOM256Q2p2MUR0dG1HaGV3c1pjN3U1eUYwQk5UcXpDM0MwNE1wRU1kcWhv?=
 =?utf-8?B?SVVKNGw3T1A3VmxmT0ZuY3RoMUhqdHMvUDhJdWVJMzZ6M1FPYmd1c2VNemtz?=
 =?utf-8?B?MkJOQ0JWVWhReStwMjA0N0V0cEhlS055a1JxTkFFS3JBYkh6NWFLSThlcXV0?=
 =?utf-8?B?R0tHZDdWczJxZnAxdFdMTWpKTFd0M1RSU0VreiswUXpOcTVoVllYUUxuNkFJ?=
 =?utf-8?B?NU5Wb1ZleEZBekc2N1Q2ODdueVAyTGRYNHRDMzdHTVZ1Y2htTWtWUXppbVRy?=
 =?utf-8?B?S3E5WjRMaUN1TVdnblpaQWpiSnVDc0YzR1NaMmRSQ083dFVkYzRONGxzWnRD?=
 =?utf-8?B?N1R1TjF5T3o2U3Y3Nk5hNTZYdVF5SGZ6dWlyNEJTaFdrUWxiTGpTMW1UN28w?=
 =?utf-8?B?Tys5ZEJJT3ZqU2VNQVVobzZHZjY4SklqdVZHQ0RsMEVycFpCOHZXYUFrUzRn?=
 =?utf-8?B?aVhia2MwS1A2bWxLaGJhVXdjK05Ga0JZV2sxUHowV3ZZYWw0b0tLYXpFZnFT?=
 =?utf-8?B?UW13VFFTbWtRQi9DTlRzSkY5aUMxZTFxQnArUWpwVlVJcmtvZnJ6NmhwaXF3?=
 =?utf-8?B?TDB3WGxhYi9IZlZjdHBlSnZ3KzdwQVVHcmlEeTBTY1BSQTFUMU9ickFISnBo?=
 =?utf-8?B?Y0VDZHExY1dZcXdjYXNSSHUva3NlMkFQZFNpZmdwU2Zld2c2am5tVkljRm5B?=
 =?utf-8?B?L0pKNU04dGIwUVJUbEUxU3NYUUswTlk0OU9oYlZtSmRDY21pcWd2bkZZeGdJ?=
 =?utf-8?B?cTFNejBtWFo5RUgyS01CQjZxVzVrNjhHeVZ6RDFITFBLSEV3dFFod0IwUzhB?=
 =?utf-8?B?N3FqblZvRmlzaGNuWW00bnc1YVVSYzBadVpuMXpqQlRIMmR2cW5tTGFydVc4?=
 =?utf-8?B?UUhjRkRzSm8zY2xTQ0VuSG80aVp6ckh1KytkSzhtL3c1cnR0eVpRUlBKQk9D?=
 =?utf-8?B?ckIyR01samlubWxUeFRVVGRTZUJDVFZyc3pERk5IL0hHYldsZmRvQnZFaG05?=
 =?utf-8?B?bzBUZmZwMVBDaTEvUHJlT3BWamd5MURoejlFMUdMRksyRzg0VE5qUkFKd0h3?=
 =?utf-8?B?bytXVHpHM0d4VW5kKzVzdkhWMFZoOHRoY1RvMVQzM0cwYTdpNzljTVVkZTMv?=
 =?utf-8?B?c0lJcHBmdWYvQ3BEZEFHSmlGWU9GSFgrN1dROVVjTkdIOVNQSmhEMVAvNExz?=
 =?utf-8?B?Wk5HUFQzRTE0VStINjU5YTErTExPUnZ4OGdlclpwQ0h0bkJDUXVIdFhxUHdj?=
 =?utf-8?B?czMzVFBNL2pIcmlpMnQ2S1ErTUc1TmxsUGc2RVFMMmNMcGJHQVhhbHhtcGpD?=
 =?utf-8?B?OGRNUmJaVTZKamZLNnQ0cXVrVHd5L2F0ZkY5NFZ2aytFUFY1TmJ2eFBzYkZC?=
 =?utf-8?B?WlpPM1R3R1NPK3pISEhBQU8xeXFaOUxxNThIQS9TTGlZUkV3RExTZnluWXlU?=
 =?utf-8?B?SmVrVzFLQXMvckVZajN4SzdCMFJlWDhSVTdhQnEwV0VtejFuVGNGZ0tYK0Vt?=
 =?utf-8?B?Z09vRisrL2J2Q2VZUHpzWXlqWmM1THJDL2k2cXlpcnNseGhza1BhQUpRWCs5?=
 =?utf-8?B?ZlVFK0hpWHplTFRKSmxsRkg3TEU0dDFTL1gySW1SMHZTVTBzczR2eHNidEpq?=
 =?utf-8?B?SDIwUmtrcnloelNiTURKd0dJc2g5d3NnNFJONTAyNW1JVnF5ZkNxVlFWNTVa?=
 =?utf-8?B?T0hrV3lqQjVXTUszeWVqY2x6NU9xNmxVb0FQdkIyYTlMMFNzcURqaTlFVEtT?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UTo3bjFxNV0gdjETDTiGzd07Ai678kFVnEo8MBbvb9d7gTNiIYHr8XY6gCxTTUx3f1lULqUzlqgzQ/wdfsJ0LyxPq37QDciEHSh/doxVG1h++cYmUwOYHop63MW1qBEOBXUyiCjwcllmGKqK4qEvYd0HWw+A1isFfB1CDAQi9cKzo3ZLwFt1/6m0gUIsRUqG2F/0xVrZJrx9/B3rI2yTFU7U1q9t3tubH6jgZg48dUYh49NnF3RVRnV1Gh5gevq4j9yRnef1CQcOQspEPdpNRzHV3QExbu2lKcFRaRUieO14/e1bZ7IFpcqlPY7/gaCuM2OwqEYAUWrjGZaaMA7qALDmRsicf05bTwXfdEd4WpWGiYcPPx1itZhpmpKGcd69CpbancfdUOR2+GPLGprwB+Fn+6417zVpMytupim6hCRZRlmEW5nUEU4nYc+TWdOqxr+kANI3HTjbQo/uXwgEks/+BOw7ECTt5b2+23J9WqE2kHHGhYTWz0AWc6cTYMSwPQjpVm+d7EaLVsxleRxhbRe+Rfhdi2BjJdQxPBQUOhmZ+hzJexo3noBoioc2C1QM3E2jkJruHQk54iQTMBLgqMv+wmFJS2PkfbK2wKsA+NlhobhPzhC7Jp63dLFO4hk6FRhTMBTbZ9hXMw5q6Sfp8oztvTuTe1ihfE7zST3945+jMOcv4FcBvPoC9ukySkIlmDUX3Sa8C8BTlfNdCP1ZwMvm9aJ2SU4Vpz/EPcKCznO3HBXa+QKciJFrUfvAP2ov64YckzhuwRxsdE6POUEyfvvm7gFn8162VpXb+bMq6HFNIGf755kXKW6YXBaj33xQ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 701d4ec8-cae2-4fcb-d85c-08db56f8de0c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 17:05:08.3328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJ4TDbzEw9nhBUIVEhTuhHRDhQCmL9EsbOvhXQB5dsn4OnLihx4sL8MgewP4cVYJtfXWFtsRYWwlM455lcI0VU50mdCFMmC3TCBBhsEagz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7087

On 17/05/2023 3:22 pm, Jan Beulich wrote:
> There's no real need for the associated probing - we can easily convert
> to a uniform value without knowing the specific behavior (note also that
> the respective comments weren't fully correct and have gone stale). All
> we (need to) depend upon is unary ! producing 0 or 1 (and never -1).
>
> For all present purposes yielding a value with all bits set is more
> useful.
>
> No difference in generated code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Unlike in C, there's also binary ! in assembly expressions, and even
> binary !!. But those don't get in the way here.

I had been wanting to do this for a while, but IMO a clearer expression
is to take ((x) & 1) to discard the sign.

It doesn't change any of the logic to use +1 (I don't think), and it's
definitely the more common way for the programmer to think.

~Andrew

