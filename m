Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA714D3091
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 14:52:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287859.488115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRwje-0000FT-AF; Wed, 09 Mar 2022 13:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287859.488115; Wed, 09 Mar 2022 13:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRwje-0000CI-61; Wed, 09 Mar 2022 13:52:14 +0000
Received: by outflank-mailman (input) for mailman id 287859;
 Wed, 09 Mar 2022 13:52:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRwjb-0000CC-Vw
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 13:52:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c738d24-9fb0-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 14:52:10 +0100 (CET)
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
X-Inumbo-ID: 1c738d24-9fb0-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646833929;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xtdrIpQWSDXHbzOFZtUcsP0JgHhcfup69P6OLR5ddh8=;
  b=Z3xDTvqg3QDFLeJxH17/vCIHVUczd8JLpo7rMy6pJIWb2S8i+cDVJ/aB
   hPil9X+0ILZ1DEQw7WADldKxoeMQNIwDze8ocxAM8/NmVt2j5EeiD+J6b
   W49hpdfK9sayDO4ycmDokL6PMV9cJSi4uLqsuK8KkVv0V0iFBib++A8m0
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65815752
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YktUHKsEDMOLiNZMDWsFCJvsX+fnVKpeMUV32f8akzHdYApBsoF/q
 tZmKT2DP/mCYmGjKIwkbYywphgO6JSHzNRrQAJsqCw8FiJD+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV6
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8MBZaVg8kmbiJFFnEgB59h1J76I3qg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 ppANGUyNnwsZTViFkwxKYkGzd2BiyfATDNHlhGRt44Otj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3Eru3SmSL2XqoCGbv+8eRl6HWtwWgUBAwTREGMi/CzgU6jWPpSM
 0URvCEpqMAa+EW1Q/HnUha/oXrCuQQTM/JPF8Uq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/Hhr5s0lQnnVct4Hei+ididJN3r6
 2nU9m5k3exV1JNVkfXglbzav96yjr3ydVcuyz7qZX+gvl1DVqmJRrGq60eOuJ6sM72lZlWGu
 XEFne2X4+YPEYyBmUSxfQkdIF26z63baWOB2DaDC7Fkrm3woCD7Iei89RkjfB8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZKVfvEMJGPxf4M4XRfK4Ey/9X1
 XCzK5rEMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlZbgTQMrppsP/Y/m05F
 uqz0ePQm32zt8WkPkHqHXM7dwhWfRDX+7itwyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 RmAtrtj4AOn3xXvcFzSAlg6Me+Hdcsv/BoTYH13VX71iidLXGpaxPpGH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwUE2WZoWtBNcehxGGgHTzy7T+z0+OeSGFXV7ZrRhDT+8+ieQ3q9SIUCTGwu9d4q
 Lqlvj43i7JSL+i+JK46sM6S8m4=
IronPort-HdrOrdr: A9a23:NcOePKNuMUFj18BcTyX155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY59s2jU0dNj2CA5sQnjuRYTzra3GeKjM2YqbQQ/
 Gnl7R6TnebCD8qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPof2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0auSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7vvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wA9HdwGOt15Dt
 //Q9ZVfYF1P7wrhJ1GdZI8qOuMeyXwqEH3QSqvyWqOLtByB5uKke+x3IkI
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65815752"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJme9gxoULf0zTE07leIh3Z/gPfFLy5sFWuol3YMP6LVVu3ixuRxM0q9DXLsjk8ETLwib4jZXHq79OlYl0UkuLqnFEtSY1KEklJrBsW3gNSdAQ5GL+V92N44DE+xw1Ps+DzSbvvOWrwuT6J75vHggjWYp6/AqOE5j/ze/MHgTXxuGptPHad2RkfSL3H6eWkRjf6cP546WCgL/Xurvd6xJF9R4lvYDfWrXlt89jSH6vtsaBwyYB+KkeN8NzjrHg1IxS0KqFfO6CfRpmFV5139/jXMFFgL/KkTLLpCaYaH1jR9IkaUmhtYu6u/LHFjZ3IP/DtI8gfnETVgJ6Fs5XYRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwAvxd5DQWuO656Ujwbi0719LLOXT2qm5Gef/YBdiQc=;
 b=NVLcZ4XLSH75ips09xSOmqdagHBxHZp4JTXr0nkLQf98i+zhjbUItG7dtFo0e3jnXrrHQcs5kkath4K426x8P9Lt1XKEq+ALNSOOOIEmlhhBttkSJHPssWEsn2nie7GPTAPAWJqFY6yvu8hZWTunv4ySGzyPWdyhm5mn61tUS7ntrYB5DYodApqYiIolvEC/LEwqWnHEn8HXCzJwrX2DPLRdDr9WrLiFd7cdYnjYikS4ZdJ+3uwlfp+k6LG6kAOD0OkeVCr270qcrDhEXFONuGDEEZZQJPcs5/glITJ2jZ0+qLw7w4XEqV3Wl+tTRRee4uBMgiFgQklH1s2BWVxIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwAvxd5DQWuO656Ujwbi0719LLOXT2qm5Gef/YBdiQc=;
 b=iEew/Fd/fMMf4QICG8Ggd/UYXnNzJa3QLgEAVJ5F6FHn4x1hmknhBZN+mX7wfEJ32w+WqYQ3MdXi070GIIHhS4B2C4msXp1wO/RWryr53QWk9VTp2xFUwrKlUb/Gyo5W7KzsyxoRijHlq45EI+UaQFF4r06WbHYr3m8T9ObeOf4=
Date: Wed, 9 Mar 2022 14:51:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <Yiiw6fFxWglR7bWL@Air-de-Roger>
References: <20220307150609.10662-3-jane.malalane@citrix.com>
 <20220308173643.2929-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220308173643.2929-1-jane.malalane@citrix.com>
X-ClientProxiedBy: LO3P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d977da1-ed8a-489b-0e09-08da01d3f0ea
X-MS-TrafficTypeDiagnostic: SN6PR03MB4381:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4381F06897654A3906BA58DF8F0A9@SN6PR03MB4381.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KuCom0AZVdxAqvGRux3JerR9tfvu4R6RbpG2Voa1LnRDjrHtRDLLEOLAfb7yIqsRRqF6wpTX8RTjE3yKhXlOuIcw64ajM/CUAnhMTKQ8yVDBQJfUUA65TwqagWz6JEQnq6otCnhWvZUO6CKqy1LeNuXf1FJbM4392ryrNEmLp3cNw9ppkMKIhMFMPbLytNH8/JHbpe3M9SAVBTC83mK4/Hb4GYY50sCxvfeJi78wqpN0aIJcgHnVFql2+a2JKQzBvbssTBZHLcwtcQKr31LXC8CBukHIxIyXc4hSGsv/5KJY9LhZp45vov5Cd1k8YpD7hBM0gi+svnVRTd9emGeC/Im45+jW2tugVphqUp1TTJYouo4X2TD2q6UpnUwmFdc/zii+yMnl8/6F40H9XwSgmW3WfY+OGIiAy28Ojc5hwUhSlHee6KxjbI4iQDp886QQaZ/gxlAZa17M1kpNrUFb7KqKe4eY7rFHAJFAueEbr8TiU9pcb8ewPHdwQEnXKF9xNs1ZoA7FWqURewK77cEApNwqAxIjIwDhvLWoSrMEamLPOzZcy2/agqqFqj1tvtJ1RhSPfZwPOFvBbjFPEpIhS0v2GhkFZlONpDtRuVpgINj0gE38z7NQErl07eOGlsM12COI6O2MZUWNoVCdWR7WyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(83380400001)(38100700002)(26005)(8676002)(8936002)(33716001)(2906002)(5660300002)(85182001)(66476007)(6862004)(82960400001)(66556008)(6636002)(316002)(66946007)(4326008)(86362001)(6666004)(6512007)(9686003)(6506007)(54906003)(6486002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVBFb1g0Q0E0M3NWY3N4cWJZRmV1TXlsUkpqT1huelBxZCsySWs0M2dTMlBj?=
 =?utf-8?B?ODczcUREenArNlNmTURscndaK1VjSEg2VUROWVNVV2NheGF2QkNwdnJUV0hs?=
 =?utf-8?B?T2NnbVNmZGpuc2NBcXFYSmxReUdSMGZxbnlEVkdrL1h2a2VKY3hwSDdIaTcx?=
 =?utf-8?B?cGNoVHdsbUxIMi9YekxoWVRwelZ2dC9PcEN5MXJkOGxJci9sVS9UQUxjbkZq?=
 =?utf-8?B?SWMxQmpqbFI3Y2IzUHNKZ0lBVndtSStZU1ExbTB3TzQvS2YwcHdkb2EyeVQ4?=
 =?utf-8?B?d2FBYWFmbFlvZmNsYllTWnQySkxRQTFpTjFXTXRQK1gveU8vN3h0RDF5RHpa?=
 =?utf-8?B?NkM0U3JqZURpVFFHNnE4SFRGaGFhR0hoU0ZMSEtyVEFyaWIyMzVsVm94N0R0?=
 =?utf-8?B?K1RBWGQwdlNCUWhFY0N6TlRKQ0t4VTZGUXZMcnlHODA3OFE2YkowVlc4b2Ru?=
 =?utf-8?B?VW1sQW5MSVlwd25qRjFoR3c1RVFTR1o0cjBJMS80T3BaVll2UzlWdmFFekJJ?=
 =?utf-8?B?MGdiMG1zbSswSUU3b1BVbTVWV1FtTUZZTFF4WWNGcVFkQ2dOQ1dIL2tQL3hq?=
 =?utf-8?B?cWo4Y3dCTHJmNEVWZ0huQ2VxUTFnbFNNOEYyaEcvZjk2QkdJQ3hKSHVhN3I2?=
 =?utf-8?B?WGdzeXZyRUFrSXlXNC80dHQ5aXFiamlMUmwxYzlNRDJqNStpMWtYSmtZRDJr?=
 =?utf-8?B?OXdvYTNNNWttKzV6RFJlWEJnQXEyZEVVZXBnZEV2UUxlak1TZGZRektWSXMw?=
 =?utf-8?B?OEdUT1dIQk1hNzJ0OHphU3N5ODZMc3FuMytPZkxRNjJ4ZjI1MGg2Z0syRWlp?=
 =?utf-8?B?RXhvd3BxYVIvVUY1MVcvcnhTelFRWFI3WVRMUnR6eWRDdDluc25ud05QRXVK?=
 =?utf-8?B?UXNJeEVXSkp6OWgvUlozdVJoZm8weUNwZFRqNlJ2cmlzTEJsVWkxSlVGaEJa?=
 =?utf-8?B?UldDTk8rb0plN0JsbFhydDYwdWpWbjl0VlFmRGJ4L1ZGSGMvcEhHRE0rWVNF?=
 =?utf-8?B?UmNLOExrM29PUkNRTXdlODRKOE5KTkhsOUZqMklvajZLOG9FSWFYYVY4V1RL?=
 =?utf-8?B?eHhaZ0lFR2dLMEU3ZjRLbmQ2by9jdUMwOHFSbE9MaW0rNjBta2xZVW9CQXdn?=
 =?utf-8?B?MjE3b1dYeW5rdWtjL05XRmhnQjJpa1J5R3dzdkwvZkxXNTMwQlpkTjFRaHVB?=
 =?utf-8?B?aUFWSFhZdUR4bFc4ZXozOGRIelhYcTBNT1VUUEZKNnRiZGhPbGl0Zmc2a0hU?=
 =?utf-8?B?amhJanA5bjIvOHo1bCs1UmpIby9zY1FKZmpnZTVGN2N5aW5LM0FJa0FIYmVj?=
 =?utf-8?B?bnNpUGMwRnVOZXBLMGtRdnFBOWtQSDF4MUpuS01WVHM2MUxFdUVYQWFTNjdr?=
 =?utf-8?B?eUxnVHFkV2pLaDhGUm1oUERBcWxMYnowMXd0VVNjL3MzeU5kWllhVXJ3dW9N?=
 =?utf-8?B?VmVqNXlpTEFDREVSQytyMlk0OVJXNWpEb2NMWFVqb2FXVWV2aHV4d3lSbWZ0?=
 =?utf-8?B?eldjRTNuSFNFc0lJbWpJc2NTeDVkVG5wbXFWQ3BLc3RuNyszUUdMM2hWRnB2?=
 =?utf-8?B?cXM0NjVrdDhUZzA1UkhpaXVYLzZiMUhuanhkM2w5RkhXdUdqdFZ2VXpndFdi?=
 =?utf-8?B?cVBTbWhqM25HeDI4eW4zT1BuTVBNRnM4b1lLK2lja2t5R2I3Ry9rMHM0VXY1?=
 =?utf-8?B?VEhmcWNpbWVtakczSU1LbTJWK3dURjJ0RlpSV05TNVphaFcyQmllRXoyZDlv?=
 =?utf-8?B?WkgyS2dGeWF6dEJsMjlvUFZNdUlIV2ZKVVhnMDBJbWMxTVlEZjVzQzdHMVRV?=
 =?utf-8?B?d2lFSnZSUURNQ1pIZUk3ZGZ1WVFGcm5ZZEdWYjBSVzUxUGZlckh3aWY2dzVO?=
 =?utf-8?B?bHhwMlMzN1JrWVJvWjRLS1RCSzgzZDczb2lPZEJVRjdGcjFNNzFxbnJLN0k0?=
 =?utf-8?B?NUFlVXJTSVAvREpQdkVSM2R0Y09FQXdPdS9GU1FaOXJiT3lYZFdabjlCMnp0?=
 =?utf-8?B?RGRiRWNqREZoN1I0UC9QdEZKKzE3MllzMGpkd1JrOGVydmZvcldqN24vR2Vp?=
 =?utf-8?B?UDRnM2F5WkU0OXJDemlMcGhRRG1XamdBTEMxNis2MGhTWGlxcHJqSWY0V1RH?=
 =?utf-8?B?dit2V01KMU5Qc1JmRkpLWXlkWlJUeUxiVXhNV2dEaUxid2FpckMxWVBWSDUz?=
 =?utf-8?Q?k0ezSGvuYqxwhBPYwXKt7Pw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d977da1-ed8a-489b-0e09-08da01d3f0ea
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 13:51:41.9662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyLQdNL7vxCEmeHQtVlVawDAumm7ur5Fyh0m4bO8h2Q8fKWRJos8WE87O3iyupvHg8FYfIClsWvOCiMGNFDSbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4381
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 05:36:43PM +0000, Jane Malalane wrote:
> Introduce a new per-domain creation x86 specific flag to
> select whether hardware assisted virtualization should be used for
> x{2}APIC.
> 
> A per-domain option is added to xl in order to select the usage of
> x{2}APIC hardware assisted virtualization, as well as a global
> configuration option.
> 
> Having all APIC interaction exit to Xen for emulation is slow and can
> induce much overhead. Hardware can speed up x{2}APIC by decoding the
> APIC access and providing a VM exit with a more specific exit reason
> than a regular EPT fault or by altogether avoiding a VM exit.
> 
> On the other hand, being able to disable x{2}APIC hardware assisted
> virtualization can be useful for testing and debugging purposes.
> 
> Note: vmx_install_vlapic_mapping doesn't require modifications
> regardless of whether the guest has "Virtualize APIC accesses" enabled
> or not, i.e., setting the APIC_ACCESS_ADDR VMCS field is fine so long
> as virtualize_apic_accesses is supported by the CPU.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> 
> v6:
>  * Use ENODEV instead of EINVAL when rejecting assisted_x{2}apic
>    for PV guests
>  * Move has_assisted_x{2}apic macros out of an Intel specific header
>  * Remove references to Intel specific features in documentation
> 
> v5:
>  * Revert v4 changes in vmx_vlapic_msr_changed(), preserving the use of
>    the has_assisted_x{2}apic macros
>  * Following changes in assisted_x{2}apic_available definitions in
>    patch 1, retighten conditionals for setting
>    XEN_HVM_CPUID_APIC_ACCESS_VIRT and XEN_HVM_CPUID_X2APIC_VIRT in
>    cpuid_hypervisor_leaves()
> 
> v4:
>  * Add has_assisted_x{2}apic macros and use them where appropriate
>  * Replace CPU checks with per-domain assisted_x{2}apic control
>    options in vmx_vlapic_msr_changed() and cpuid_hypervisor_leaves(),
>    following edits to assisted_x{2}apic_available definitions in
>    patch 1
>    Note: new assisted_x{2}apic_available definitions make later
>    cpu_has_vmx_apic_reg_virt and cpu_has_vmx_virtual_intr_delivery
>    checks redundant in vmx_vlapic_msr_changed()
> 
> v3:
>  * Change info in xl.cfg to better express reality and fix
>    capitalization of x{2}apic
>  * Move "physinfo" variable definition to the beggining of
>    libxl__domain_build_info_setdefault()
>  * Reposition brackets in if statement to match libxl coding style
>  * Shorten logic in libxl__arch_domain_build_info_setdefault()
>  * Correct dprintk message in arch_sanitise_domain_config()
>  * Make appropriate changes in vmx_vlapic_msr_changed() and
>    cpuid_hypervisor_leaves() for amended "assisted_x2apic" bit
>  * Remove unneeded parantheses
> 
> v2:
>  * Add a LIBXL_HAVE_ASSISTED_APIC macro
>  * Pass xcpyshinfo as a pointer in libxl__arch_get_physinfo
>  * Add a return statement in now "int"
>    libxl__arch_domain_build_info_setdefault()
>  * Preserve libxl__arch_domain_build_info_setdefault 's location in
>    libxl_create.c
>  * Correct x{2}apic default setting logic in
>    libxl__arch_domain_prepare_config()
>  * Correct logic for parsing assisted_x{2}apic host/guest options in
>    xl_parse.c and initialize them to -1 in xl.c
>  * Use guest options directly in vmx_vlapic_msr_changed
>  * Fix indentation of bool assisted_x{2}apic in struct hvm_domain
>  * Add a change in xenctrl_stubs.c to pass xenctrl ABI checks
> ---
>  docs/man/xl.cfg.5.pod.in              | 15 +++++++++++++++
>  docs/man/xl.conf.5.pod.in             | 12 ++++++++++++
>  tools/golang/xenlight/helpers.gen.go  | 12 ++++++++++++
>  tools/golang/xenlight/types.gen.go    |  2 ++
>  tools/include/libxl.h                 |  7 +++++++
>  tools/libs/light/libxl_arch.h         |  5 +++--
>  tools/libs/light/libxl_arm.c          |  7 +++++--
>  tools/libs/light/libxl_create.c       | 22 +++++++++++++---------
>  tools/libs/light/libxl_types.idl      |  2 ++
>  tools/libs/light/libxl_x86.c          | 27 +++++++++++++++++++++++++--
>  tools/ocaml/libs/xc/xenctrl.ml        |  2 ++
>  tools/ocaml/libs/xc/xenctrl.mli       |  2 ++
>  tools/ocaml/libs/xc/xenctrl_stubs.c   |  2 +-
>  tools/xl/xl.c                         |  8 ++++++++
>  tools/xl/xl.h                         |  2 ++
>  tools/xl/xl_parse.c                   | 16 ++++++++++++++++
>  xen/arch/x86/domain.c                 | 28 +++++++++++++++++++++++++++-
>  xen/arch/x86/hvm/vmx/vmcs.c           |  4 ++++
>  xen/arch/x86/hvm/vmx/vmx.c            | 13 ++++---------
>  xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
>  xen/arch/x86/include/asm/hvm/hvm.h    |  6 ++++++
>  xen/arch/x86/traps.c                  |  5 +++--
>  xen/include/public/arch-x86/xen.h     |  2 ++
>  23 files changed, 179 insertions(+), 28 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index b98d161398..b4239fcc5e 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1862,6 +1862,21 @@ firmware tables when using certain older guest Operating
>  Systems. These tables have been superseded by newer constructs within
>  the ACPI tables.
>  
> +=item B<assisted_xapic=BOOLEAN>
> +
> +B<(x86 only)> Enables or disables hardware assisted virtualization for
> +xAPIC. With this option enabled, a memory-mapped APIC access will be
> +decoded by hardware and either issue a more specific VM exit than just
> +an EPT fault, or altogether avoid a VM exit. The
> +default is settable via L<xl.conf(5)>.

Sorry, replied to a v2 version of the patch instead of this one. Could
we use 'p2m fault' or maybe 'guest physmap fault' intead of EPT (as
that's Intel specific).

Thanks, Roger.

