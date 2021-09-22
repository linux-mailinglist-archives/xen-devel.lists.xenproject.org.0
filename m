Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531C414BB9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:23:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192835.343508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT395-0006fD-TA; Wed, 22 Sep 2021 14:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192835.343508; Wed, 22 Sep 2021 14:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT395-0006d5-Pp; Wed, 22 Sep 2021 14:22:47 +0000
Received: by outflank-mailman (input) for mailman id 192835;
 Wed, 22 Sep 2021 14:22:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mT393-0006bB-WF
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:22:46 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 546ea68c-4140-4c6c-990d-8625e408108f;
 Wed, 22 Sep 2021 14:22:44 +0000 (UTC)
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
X-Inumbo-ID: 546ea68c-4140-4c6c-990d-8625e408108f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632320565;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mEtagbVpJQVQH77X7f2fhBXuMNCzR+6xZPo0qRVCWWI=;
  b=K8KYI9t/C6dlfRbSAmJEj2uLxG0+jXZ8dShmo5RTd3ttZSWTfsztv2P7
   K6lzGVBCFtFhfvXOU/fWmoqXFXho864293TBBWHxUuUxyyoTYIFxqXVxj
   WvYa4vmB0R/qgfZHQxldLvdmdRShV55fX/D6RHDZbQHqMaLk+vJcw7Hxm
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iC38JYbCCpONcPRKe+ToDTKqPsLWITHNeyo9VOIBgM4lNyt2Ra4HNfSPUl/EEiLJowQFlmI6Vf
 qlJVpzcOVKzHTNaYa1PIMsgglBwSaBvO18xyWvefgq62l2udj51sdInCLA9G6ZapLHzGPh29Gp
 5CNBYkiBodVgUTS7YCAnw9ja1VoNDoXwe9ylEYzlM/wmgOEHR7g2NW+Nu6M4yF3osMUmVLEPHJ
 YV+WigJe2CkJr53OM5DYx4PQPXe3GrY+zPPONSWDEqQZZwncC7Vw7LJSZR/84i9tkzbNL8vRjE
 Dt3PFi47yTQIFtURTWuSTmxt
X-SBRS: 5.1
X-MesageID: 52928283
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:o4SUY6kyDvTtQCiSkcix8MLo5gyrIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfUT+BPfrYNzCkLo0kaYWz9x4CvpXSmINjHlQ//y00FiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Qy2YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NtKh8auFAN0B6jnwM4QCD1fVA94ZoQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpq15oeR6aFD
 yYfQRRlZRnJShljA2wGF8gmu86DvCClUBQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCssBkuAcQNF7AD7SrV4KePxwHeKG5fZ2sUADA5j/PaVQDGx
 3fQwYizXGwx7OXMIZ6O3uzL9mLpYED5OUdHPHVdHFVfu7EPtalu1kqnczp1LEKiYjQZ8xnLy
 jaWpWAVg7wJhKbnPI3qoAia31pASnXPJzPZBzk7vEr+tWuVh6b/PuREDGQ3Ct4ad+6koqGp5
 iRspiRnxLlm4WuxeMmxrAIlR+vB2hp4GGeE3Q4H82cJrmzwk5JcQWygyG4nfxo4Wir1URTof
 FXSqWtsCGx7ZSDxBZKbl7mZUpxwpYC5TIyNfqmNMrJmP8ggHCfarXoGTRPBgAjQfL0EzPhX1
 WGzKp33Ux73yM1PkVKLegvq+eV6nnxhnTyDG8+TItbO+eP2WUN5gIwtaTOmRus48LmFsEPS9
 dNePNGN0BJRTKv1ZSy/zGLZBQ5iwaETCc+kpspJWPSEJwY6SmgtB+WImeEqepB/nrQTneDNp
 ynvVkhdwVv5pHvGNQTVNSwzNOKxBc5y/SAhICghHVe0wHx/M4yh27gSKsksdr49+e09kfMtF
 6sZe9+NC+hkQyjc/2hPdoH0qYFvLUz5hQ+HMye/TiI4eppsG17A9tP+J1O9/ygSFCun88A5p
 uT4hA/cRJMCQSVkDdrXN63znw/g4yBFlbsrDUXSI9RVdEH9y6RQKnT83q0tPsUBCRTf3T/Gh
 QyYNggV+LvWqIgv/diX2a3d99W1E/FzF1ZxFnXA6erkLjHT+2euzNMSUOuMejyBBmr49L/7O
 LdQxvD4dvYGgExLo8x3FLMylfAy4N7mprl7yAV4HSqUMwT3W+04enTWj9NSsqBtx6NCvVrkU
 02CzdBWJLGVNZ63C1UWPgckMryO2Px8duM+NhjpzJEWPBNKwYc=
IronPort-HdrOrdr: A9a23:fCWyIaAuRJS1K6TlHeg3sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dCsai6GeKT9J/jJh9WPH5XgspbnmFE42igYylLrF4sP+tEKH
 PQ3LsMmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZTbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczOgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxeokPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesXMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO11GkeKp
 gsMCjg3ocVTbvDBEqp+1WHgebcEUjbJy32AnTr4aeuonxrdHMQ9Tpv+CVQpAZGyHqRI6M0kt
 gsCZ4Y542mePVmGp6VNN1xMfdfNVa9My4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.85,314,1624334400"; 
   d="scan'208";a="52928283"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQH9wp+/01aJc0xU61pz2tf+8pgcaQOxiE0iR0OHK2c1Vlqe6SGkcFoRreEvLkgJN8p4Lx3gyoxq5r0wsVq8x2a6J6XHiGSQd+ycLvZSAosEZmhv0xmJOLLGmtQDwrWVR/y8UJQ0EUuujuAYJvVFbm+00dBM4AqL/zH8LxdPHLfeD5IBaSGztTeUPPxNnTY7o19JNnvsiI94xUefmZiLXcyNLMUl2IpYrnKCGAJVC26CchmcN9QIC37iEzHHBRhVoHl28Bi0K9V8lHGdPFJp9keekSAAzagn3yXFg6qthTT6Ha9Qt9LtnvBgp7hbhRvs254zcv2T0fuGxTEaq9I+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rKTVIxbFozN0phUYlQnP1UxYWuvKfzgxgNVEXYOt3tY=;
 b=fv1aM1IAvWI5Li1rr64zShKxqqBmRKOSCpoIEbeEjTArZOebBGnghJiIh4cOSxfGFK88aPzRnsw3qrA4x6xlQ5gZDw/iWATWZdc3EBxDHtriZbC0VAJstgfEW1oZvYhUE6hhEDrF3CWG0t6kizzUTyIyDEmgaIuFkgQJXpUzFbyR5XDdExszFlwaAkEWuLot0x7VeBmLJ+hFMS6OX5Oz/w5+FCMcAldCKrsGnCWRJMfhTwP7Sge8e3VIN0SoH8Jk9qdOdpsRbw70hYmrqHEkDH/IX/gWDMLF3jHsqI08KDdp1CgGVJPAAacim2MdpP3bL/kQGiNlL334lm6fF36sXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKTVIxbFozN0phUYlQnP1UxYWuvKfzgxgNVEXYOt3tY=;
 b=TefVAtnhwNIu/qVU194L/u6TpNbTd0Fhq0bWpUVb/jMendc8kd1yAq5qbsZEaixkCZLEYz7T3SA/qgBjR0dn8gmDOrWbTnbMC17PQwHuZLZYYw1HPfJQQNmS0azMB9hvUUuzMVd1MPgxy9yuidnDGIRnrizAICdGVm7sTBZMrJQ=
Date: Wed, 22 Sep 2021 16:22:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/9] x86/PVH: permit more physdevop-s to be used by
 Dom0
Message-ID: <YUs8Jq4mei9+DDCU@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <78c84053-3d79-b36d-be03-08b3b3a3d26c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78c84053-3d79-b36d-be03-08b3b3a3d26c@suse.com>
X-ClientProxiedBy: LO4P123CA0339.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a6290f1-b750-4ca4-e44e-08d97dd46d19
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5525800F00F24363272B98A38FA29@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5BZ6ymswYWJzGnE7y2QBm5qQqcigic2WJLw7qj55bUnt5bP5MLEh5zNGzji61CctOeUaEzrWCbo5AER3Xu1Pm4VJljYQtmRUtgSenoLIIee40zmFQgEpOxZazl9FulJHYxTv+7ih3IjY3HMMrveKCHOt3n5NdAZK9baMHjwwPdiqM5MHkNvJTVPr7gxu11qgmtAUu80y+H/egJ9+Y57GU0/by6cdU6oGnc7ATmA3IUIZYROtNVzhqeo315hu/RMgJ9zZYOhZB8bByV829mcm1Ld3keB3F2iZxzX1ByNq6dkH73zqCXMBh2hTj1cm9QiIWwqlWd4zq7Vj3+vIhNjGDqqYqE1aGQIHeseAa93Kl9KDlSIJ3X6NzpXpgKoDunE4yYucSBxlfyLJ0i/US6qHzDDJcI70uYy2crsrbu7+GcgedXmqeM9jTbTa+6tW0kGzZATl3X5ErPPSieG9qY57dYfM673A4RZ1YPNFNx5UCjZgF8HtZV0Lxr88rhNF75IJPQMdanr13uEb53MhpBKA9+X8ZHfYsvy7JOFlHCXm3bDLB+nPNA4b+XTzj7C9jFvmjsI01XKmj183xClZX3DfeYSRUy3ZAwozJXqokdiT1NUPAn2uchb/HNle5KmWJOWefb30mGatVPOOrDZ8W162p1S//A0O5PzOclsvdY8TBtVDcX/GbtQtj0Op30Prv4Yo3HsOqZt2GsOh6PAHfZN3MA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(66946007)(66476007)(86362001)(9686003)(8936002)(83380400001)(6486002)(6666004)(2906002)(8676002)(316002)(85182001)(6916009)(54906003)(508600001)(6496006)(956004)(26005)(66556008)(4326008)(5660300002)(186003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFlvUnhGVjlVc1BjZkV3ell2ckU2ZWhDTzlmL1JZYzFqQUpPOHpTRTI3YlE1?=
 =?utf-8?B?TXFQT1RzZlVPaVJSOGdOa3RyajIvckVRNTdBNU9UOG1BdDlpRXJ3bFNzZFlU?=
 =?utf-8?B?Q2VhSlVzZTJUcEhpU01KK2I3Q1I1TXNmaU9VVTJ5MmFIN0xLcDYwWCtEOW5j?=
 =?utf-8?B?dVc1ZnRxekM4d3E5cUJhdjMwWWRxbXBicDRPZUJKYVR1QlZGUDlxNU5pZXhs?=
 =?utf-8?B?bFRmQVBiNCtEVnZtODFrblZyR2JEdXRiMDhqMCtSL1FHdkZCOXRCRVNRd1Mz?=
 =?utf-8?B?ZTVaV2RJQklTbGZHWmRpbW9rSTJ0MVowVFYySDVLekZoZXFtR2ppSjQwT3BQ?=
 =?utf-8?B?SGxwb29XL0Y0MHlBS1dON0E1UUs2TTB0ZFlNS0dTRmRSY2N5Q3c1NG1ZRHRR?=
 =?utf-8?B?N3J5UFBnRWszR3lZeU9oTHo4Vk1QK3VTQUpURDdUTHFZbUN6czBIam5KYllh?=
 =?utf-8?B?VEFSZWlWL3lpMENvZEhtRWpZYWNtdFZaRndoaXlqNGM3d0VmM1JyR25zMmQ3?=
 =?utf-8?B?aXZXNzBJUU0xNnRZSTRTNHA0aWVQVWo1V0J2TXF3U2FBdlFjdE5pNWoxaHg4?=
 =?utf-8?B?aE9kRG1OMlVKRzROVVEya2lFaUxXclJxOWVzQmFSZ0VoS25FWmhyUzlVT3Jz?=
 =?utf-8?B?VTdPSlEwMHM1VVg0aGEvbnpNY1NVczhIVkM0cWZjR2RvMkVJKzhKQi8yYmZ0?=
 =?utf-8?B?L2k5MHBRNngzaWlXdC8yeFhUVU1EVFYrSERHdmdDa2R5TDRURTB0VW5GWkxJ?=
 =?utf-8?B?YWthckFNblBnYS9MMk0xSVduR1lmbC81eWhPLzRZZ0xON2hHZko5Z0VtaVM5?=
 =?utf-8?B?K3d2MUU0cEsyL0orckJ3Z2U5TUNhMEVIS0JURE81bU5GM0krTHhnelBxcmpI?=
 =?utf-8?B?dThwVWpVRWNUMVhSTXFoT2VFYkdNRWRvdEZnYzNJL0IvakU3QUxBMlp2VFJv?=
 =?utf-8?B?Vitpai9XZFNtL1RkSll3d2tXMjgyQmJ1TlhsbGVDbU96RGZMVE9PemdXa0tn?=
 =?utf-8?B?SGpERUdlTVVQMEJ1a3JpMnVEeXdRTHlUTk04V1NsUldUMmZjdm5zKzlFWWlL?=
 =?utf-8?B?dzd2L3BhWml1dWQwbERuSmJoNzk3WmFzNUNkZTQybGFpa1RYa1AwUjZoUHBJ?=
 =?utf-8?B?OHJMMXAyaFlBdjB4RGNFcVFJcnl6ejFUS0pJTkszSHFDSkI0SndadWhPeVp6?=
 =?utf-8?B?aS9qeXM1WVkwOXdSMi9sTWpPTlN4VEQwRW1WemJxVnJJak01dlVNY3JWWG5N?=
 =?utf-8?B?S0JvcFkyckJDaHhwQjZtNHBzTjQ2VU1leUtLa1NpNGJscVE4anJhQkhLekIy?=
 =?utf-8?B?eGdUNVAveTlYc1dkY0dDaE9RTWI5SkZpc1M1V0IzN1NhTmo3UzA1ZWtpalJv?=
 =?utf-8?B?c21NWld5aUZPaHRpMC9BS0NndWlxaGpYVTRJSldybVFtWG5QbUZnbDc3WXB0?=
 =?utf-8?B?VmNMc0RpdHdSSlB6MW9BYUhJTEM1cnEraFFiMWFvcUxDSFFESk03R0lwZHov?=
 =?utf-8?B?akJKbVdkRE85MU9tbjVCL3BEczZCNGt2Y2NmTDZGR1ZwZ3lJcTU5Z3FYTjlX?=
 =?utf-8?B?MHh1aWE0dmIvMmg2SkdBTXJrOW8yaUUxeHpabEF3Q21mWkFiZDlLZTVWc3Ur?=
 =?utf-8?B?RTB6elhFWExOU3FmZkYyZTJCbnZNNE5SM2IxZ0NVTlBKaFRBMSs2Z3B1NVly?=
 =?utf-8?B?enFaRm5aOVl2M1FyMjRoeVJNZm1rMTlJZFNHUDF5M3RGRDlWK0FmU1YyZnIx?=
 =?utf-8?Q?M+r/PUx7bmNpetdKUEtZJojpI0wO6hkTleXVjUh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6290f1-b750-4ca4-e44e-08d97dd46d19
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:22:36.8838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jr7EJ4WesDAp3P0vd4q+9tzEtHI5MSrhJUcFrFlNkwCISuuEfoab5y1EC/nrz7hNJMdqXfV3h+BIivgESoEz3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

On Tue, Sep 21, 2021 at 09:17:37AM +0200, Jan Beulich wrote:
> Certain notifications of Dom0 to Xen are independent of the mode Dom0 is
> running in. Permit further PCI related ones (only their modern forms).
> Also include the USB2 debug port operation at this occasion.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I'm uncertain about the has_vpci() part of the check: I would think
> is_hardware_domain() is both sufficient and concise. Without vPCI a PVH
> Dom0 won't see any PCI devices in the first place (and hence would
> effectively be non-functioning). Dropping this would in particular make
> PHYSDEVOP_dbgp_op better fit in the mix.
> ---
> v3: New.
> 
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -94,6 +94,12 @@ static long hvm_physdev_op(int cmd, XEN_
>          break;
>  
>      case PHYSDEVOP_pci_mmcfg_reserved:
> +    case PHYSDEVOP_pci_device_add:
> +    case PHYSDEVOP_pci_device_remove:
> +    case PHYSDEVOP_restore_msi_ext:

Hm, I'm slightly unsure we need the restore operation. Wouldn't it be
better to just reset all device state on suspend and then let dom0
restore it's state as it does on native?

Maybe there's some wrinkle that prevents that from working properly.

> +    case PHYSDEVOP_dbgp_op:
> +    case PHYSDEVOP_prepare_msix:
> +    case PHYSDEVOP_release_msix:

Albeit I think those two operations won't strictly conflict with vPCI
usage (as they require no MSIX entries to be activ) I still wonder
whether we will end up needing them on a PVH dom0. They are used by
pciback and it's not yet clear how we will end up using pciback on a
PVH dom0, hence I would prefer if we could leave them out until
strictly required.

Thanks, Roger.

