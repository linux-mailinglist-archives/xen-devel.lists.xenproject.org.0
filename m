Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA5A648A68
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 22:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458287.716190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3lJR-0007ej-Ex; Fri, 09 Dec 2022 21:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458287.716190; Fri, 09 Dec 2022 21:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3lJR-0007cf-BY; Fri, 09 Dec 2022 21:53:45 +0000
Received: by outflank-mailman (input) for mailman id 458287;
 Fri, 09 Dec 2022 21:53:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vX0=4H=citrix.com=prvs=3351f26b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p3lJQ-0007cZ-1G
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 21:53:44 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1364aa3-780b-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 22:53:42 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Dec 2022 16:53:39 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6119.namprd03.prod.outlook.com (2603:10b6:208:318::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 21:53:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 21:53:37 +0000
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
X-Inumbo-ID: f1364aa3-780b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670622822;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0G7xtXDmQrZVS8Nn3WlErlZeN4nTWCBXKB+0GtUuEc4=;
  b=bEmKv8EPM6Eg5XDl/JjxQkfLoTR4VBZZuPuf3iO7jL7iXEt9FH0NF5WQ
   A0KeKhdD+yOlyWZ0FBH+uonLfu4QZ+KHG3iCD4KfCHzh+AvU8iZsbOSF+
   ESHhttOZ8t+sILfodgUm1ToX5NYn1kX89SZrtZ5GSJ8e+XJtpLG3SsPW7
   U=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 86621808
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uAOi5aJxVGGIqBrVFE+RJpQlxSXFcZb7ZxGr2PjKsXjdYENS0DAOm
 GBOCzqOa67bYTb0KdwnaN/j9UhTv5TSnNBlHgFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5ARvPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c51J0pB9
 +IkcAkcYx2D19KI+K7lCcRj05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzX2lAttCTO3QGvhCr3eYlysREEEsVXi2mP2zr2iFcO5NN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9UQARMGwLfj0sTQIa+cjno4Z1lhanZtp7C6u0kt3dECn92
 SyXtzM5g6gPjMkNzOOw+lWvqzelupXUVRxz4wLIXWuN7wVlaYrjbIutgWU39t5FJYedC1OH7
 H4NnpHH6PhUVM/c0iuQXO8KAbeloe6fNyHRikJuGJ9n8Cmx/3mkfsZb5zQWyFpVD/vosATBO
 Cf70T69LrcIVJd2Rcebu76MNvk=
IronPort-HdrOrdr: A9a23:3ZmKLaDAU0843ZjlHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.96,232,1665460800"; 
   d="scan'208";a="86621808"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5Qo/NgV3Xd+iIPNcfKc4fDQ/Kd2j4xgMyRKo8d4VAkK3EH6EAJ/arbx+DQXtvv9toov6mcb0ww3EKI9zypPdyab13W0rKAAUt15zTJ0NQTTHd+Lq4nsS+xmx/1Pax1+oxQioyPZnHddz0vicmW3nWSJiteJC66BRogiwF/22CgnQSDQGEPfh83KMqFE1Jmz/5/NnoSq4fvzvHhgG3SSg0LDPDG308Sy8cFMJQGlqZy2Dp7Q7riWsBSklMV4lnoPunhqWqn05hUeV6xXix0lwtXNqT6wMyx4FgcJsTm8AfkZHiZO/CfgVcGaf4nHdtTWy+DoP4weR6z+H1jeVGufJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G7xtXDmQrZVS8Nn3WlErlZeN4nTWCBXKB+0GtUuEc4=;
 b=Ku+/pABZSuAUgeiz6L3NLrFk+IfCKzYGppmNB/gD38RAeq+LjAjLUh7jEOygF85rhtRixGOnnssqmjz1hTWX4C4bhzP/ftdtUj2WjMLi+aJP7Iw8bjyCbg9iWS5xfPqVTJ0o4YLRED30eiuDowLNhhulkb489OnP8BVR5lZWtOiq6npXx5sEYTNgsytmWSemXvekCXaXteZTwRFG4ko8b5k2HlgOc63DPXEShEfRVkMX2rqem5Ml2xZTaFMfM8VX0GENY07C7XR4qiKb292ZYBaeKI0RvZpw7/brF914toKefrQUI0/s7B59uqYjnkIqFw/iI6OCrvDiDVCtcaL+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0G7xtXDmQrZVS8Nn3WlErlZeN4nTWCBXKB+0GtUuEc4=;
 b=koLIHzJtcgsK/Uo/h8Gw7TaqouXPZZ7Fc1+t+ZOcgCQkSGgod+RdHpWjPyDAS8awq2gsXdQWGDfkM43098lfEVYDCcHr743xNwVGWuVBLycjiNNC5de92lCqudg0K/szNOdBUtxKCSKOFjcyf/2I7dA+VkZ7MJO8LbIi9WgdFk4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?TWF0ZXVzeiBNw7N3a2E=?= <mateusz.mowka@intel.com>
Subject: Re: [PATCH 5/5] x86/tboot: actually wipe contexts
Thread-Topic: [PATCH 5/5] x86/tboot: actually wipe contexts
Thread-Index: AQHZCXqrQyWSF53TrEGtcF2dIG8p2a5mHmsA
Date: Fri, 9 Dec 2022 21:53:37 +0000
Message-ID: <d74b9566-4bda-a409-bebb-4fd0db2959f6@citrix.com>
References: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
 <028fc34e-8a39-b0b5-34bb-2c96a82fa452@suse.com>
In-Reply-To: <028fc34e-8a39-b0b5-34bb-2c96a82fa452@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BL1PR03MB6119:EE_
x-ms-office365-filtering-correlation-id: 5893ec2d-fbe7-4445-37c6-08dada2fd363
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Hj+u0YHNTB+Y/GtS92NES0VvRhT2dPmdGMbRBnorlcY7fLIszDAJq48HPP1meGd0EvDWETXR/urgiklYR05Uy5Bh/7zVLK8UdyxwVZ2UHB1jjME/cDnffuYImk5zQJs3nu3ATNI8JDhoMtCj5SuGoLQC1f8suun858K0LjUzcTD6yPBPAVqXlbQh9iI0vCTgx42MkcNPzelzgPf+CHIcdZftY8I45t4UR75FOsrvy5P6cAH4iWYyhs5/d5TkU/Ej0YXKzhVwWI17NiUMa/FvbCtdw6Nqai/7Bt/Ps3kl0vhGUigXuDvBywrmkLbpR6DKU3YcVP7bZrj2yBdK73IqFtPVpPYIO29Un+tDPmUXiM8Dw1Q+MQQ69P/vvlIPw3reh/DSrZlOpq0GhIeoEpwZEcScazVXQMAXfsPnoMYSLPPKLEBENoVScddTg0SAV4TvIOclQOscMCgd7xBHMzvjH0DTLBKG9xVhkEa0wjQ6HsDqb74AF2v4HY474eF3SkH237xqmo9gv3R5yjluvZiPb9SLlctBTFGIPIj+0DtlTh8XFLDe2n8nAgWQhqKsUn997LJQSJQo63NHLl01FVnCma4kucrI/SEKOBku1rL1E4SN7JtnbQvBuYbITao+R6ITA6jItK+bdhAyh5Og12XkcFeYFiQ+lItxR7JThdw3GhELWOtN2ExzOIIgIittIYkEShixhxdH/bMhdq82R5dEVNLCeggUdm0ro1bhf0Gq26cc2lHiau8SgU4bfWimF8T1TtzZ7zjS+ZHn8qNijLFvnQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(8676002)(66946007)(76116006)(66446008)(66476007)(64756008)(478600001)(66556008)(26005)(4326008)(2616005)(36756003)(186003)(110136005)(54906003)(41300700001)(91956017)(122000001)(6486002)(6512007)(316002)(31696002)(6506007)(71200400001)(53546011)(86362001)(82960400001)(38100700002)(4744005)(5660300002)(8936002)(83380400001)(31686004)(38070700005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUVjdmVnNW5JVW5DaUVRQ25OK2VwSEdjcnVMRTdhUHEzL0NhUXVwNzRHSDlI?=
 =?utf-8?B?R2ZiY3NGOStXeS9SNy9UVlZvNzhLM3dPNHNNNEVBeVlPcnBaNzdzd0VMdHVI?=
 =?utf-8?B?V0pZQ041VGlCL1lldmk4Y2p3Tng2M0dRR1NNcVJTdEh4NitTTnJ1enpVWVli?=
 =?utf-8?B?UGQyUDRUYVJUN2piUWR3SDQ3QkNNcW1rd2gwY0JBb1lEOURoUHA0alh1ZmhT?=
 =?utf-8?B?VGV3YWZWdzM2YitKTklpcG90eWxnaGRzVlA3YmY0RTNON1RSVVRuLzRnRmVm?=
 =?utf-8?B?aHFtaUxzME1WM1dZd3phT09JeVlSZDFqY0pwaHUvSFRIaFV6TVQrSlFvcDR4?=
 =?utf-8?B?clFQYSthS2M1alk2UFBPYXhNYUZlTVVuU3d2clV6NzljSmd3RkdNUUVsMWJv?=
 =?utf-8?B?SmY3c1NXVEY5TllBVXY0SDV1akdUQXh3MCt6dVR4TE9Eb3hNRVhGNjJTbWNH?=
 =?utf-8?B?bjUxOTdScWM1bEpCZ0VITzREOGV6ZnBGWmxJM2NDK3Y5VGJuMGQ3Q0FCa0Ev?=
 =?utf-8?B?dGZLRUI0cmtnQmx0bGFPaG5GVFNYcTg4dUNHQ2VtbjdobVBxc1NiYjM0bHlN?=
 =?utf-8?B?dXdYZG9BK3JoTDJKdHpPWEdwczlSVzB3TDVLcVlzdVNlMm1LMEhYQ2RNeWtt?=
 =?utf-8?B?R3Zza1dzOExMcmxGajVhSEtaaG1FZUZVWlpNODU2Q0NKc0FxM2svWlpXaHhs?=
 =?utf-8?B?WU1zek4xSnYrQkExSmFvYjdQUG9hSjc2NEVlK05mRUdQcXU4bXBlZVNnTjAw?=
 =?utf-8?B?VnloTm1wK09uQ2RNSmd1MUg3ZzN5NHp4T0pvM21PYnpteHBKMVY2Mi9ITkdY?=
 =?utf-8?B?VkRMMVpHRGVNYS92NEowQkdYdHhGS3BoY0xYQUczVnV6cnJPQktDTEUvcDVj?=
 =?utf-8?B?WEE3K1I3MHBEWmVzS3dKV2VucCtFZjRtMDg5YmdLakNFVE9xZ2hSNmxEUnJ0?=
 =?utf-8?B?YmJFK1p6Tzk4RzluY2RmZzEwNG02Z3NBZVdDT1c4ZkV5V2xpcjZGdzJVbWdL?=
 =?utf-8?B?WkdmaFVoaTl0a2pzMm1FeFZaNGZtbnpIcWQvQUdWWXFaTW9uVVZKUDdtZFdm?=
 =?utf-8?B?d3RReHlzOHRDVmp4MG13WXl2aGJTK3ZkV2paK2lOb1dweGdrUlZFbDhDZFRO?=
 =?utf-8?B?VHNmblhZYXFXaWV1ZFNHSERSam1yd3B5b01vc3pvNTJkeXlOSWxSTzJXNlVU?=
 =?utf-8?B?NXhPY1dsdDFOME40U0J1RTRlWDR6Y2xsY1hWaWtSbllSelphUjZWRkxNYnB0?=
 =?utf-8?B?aUloeXN5NmhhV240WXhWbTFIUWVVdmpsUi9wQjhBOU41bnppYWdSb21ROERw?=
 =?utf-8?B?VXA1YTUzR3NnRmZIUW1rMHNnemFreGNmMVpJZUV5aTFteHg0dENwZjJxNExO?=
 =?utf-8?B?RDNzME0zNk1hZVhuM2cxWkxYbyt3SWFZRUJzd1pxc1kvVXhVNTdFR3hMN0hl?=
 =?utf-8?B?N2VRMTJ1cTQ5dE1nbGdrY1NrMWUySnFIN3YyNzY3ZmpuRm5iY2c2dEU2MGpq?=
 =?utf-8?B?S21ONlk3L3RmRzlEMUhaMmp4VCtRZVZIeitMMWRnSHRMSW9MejZNc05uZHdS?=
 =?utf-8?B?Ti9yQmtKUERqVnAwRU1Bc01XTW85S0JaUmFjREs0UmQvZzhXeThXWkNvSC9t?=
 =?utf-8?B?NUR3dHdVRDNLYWpsc1BlT2JWTlhZa0V4NkdQOGU2cVNyRXJnM3Ywc3EwOFBU?=
 =?utf-8?B?dis0NEVRZmdPN2NJMXVPU1Y3SEc2d1dscWlremlhU09mQWFGVGRTb1I3VVhS?=
 =?utf-8?B?ZUJlWWNkejZ3UXFRS0xxUE5DeDFkNFpFWDlJRDhydHlINE9FN1pxeVQ5MzdM?=
 =?utf-8?B?Z1h1eEJtVWlrVnNTd1RxNDY3dEptRUZOa3FXK21JbDRzNitrSnVqSkpORnlH?=
 =?utf-8?B?NmFkVE1zZFREVjRUZVlCL3BBYkNWZUh5ZW1MQlBPQS9kcFVSQWZyKzN2bmJN?=
 =?utf-8?B?bjVoWmdsZ1pCemw1bHR1bXBjVWNLbUpYMXNub3lFamxzb09rcEtKeWNKUmEw?=
 =?utf-8?B?K0NqeWptQUF4TDVjRUwzR1owa3o2WlIvWE4vQW1ySzhhMkwyRUJ2SFdnTUJh?=
 =?utf-8?B?VmRlQkJndW5tNW5STjZQWGdXSUJNZHg1QVo4ZDArWjFPakdnLysvTnMxY09l?=
 =?utf-8?Q?++dvyKogbUz4BoMxTa8nCZM3R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE266A164A33AD4F8CE9D27984B906EF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5893ec2d-fbe7-4445-37c6-08dada2fd363
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 21:53:37.0690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYSXJm0S3pkl6iOUu4Xh3lMatweNZ4WSeK0zm9wsptdz+CjX7SPygZCNyjLhStWIpJCFcBop7UJpN7eV0B87E9Q6kCBp3fvv/Pg4n0hQYKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6119

T24gMDYvMTIvMjAyMiAxMzo1NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEVzcGVjaWFsbHkgd2l0
aCBvdXIgdXNlIG9mIF9fYnVpbHRpbl9tZW1zZXQoKSB0byBpbXBsZW1lbnQgbWVtc2V0KCkgdGhl
DQo+IGNvbXBpbGVyIGlzIGZyZWUgdG8gZWxpbWluYXRlIGluc3RhbmNlcyB3aGVuIGl0IGNhbiBw
cm92ZSB0aGF0IHRoZQ0KPiBhZmZlY3RlZCBvYmplY3QgaXMgZGVhZC4gSW50cm9kdWNlIGEgc21h
bGwgaGVscGVyIGZ1bmN0aW9uIGFjY29tcGFueWluZw0KPiB0aGUgbWVtc2V0KCkgd2l0aCBhIGNv
bnN0cnVjdCBmb3JjaW5nIHRoZSBjb21waWxlciB0byByZXRhaW4gdGhlDQo+IGNsZWFyaW5nIG9m
IChzdGFjaykgbWVtb3J5Lg0KPg0KPiBGaXhlczogYzAyMWM5NTQ5OGQ5ICgieDg2OiBSZXBsYWNl
IG91ciBvd24gc3BlY2lhbGlzZWQgdmVyc2lvbnMgb2YgbWVtc2V0IGFuZCBtZW1jcHkgd2l0aCIp
DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhh
bmtzLsKgIEknZCBub3RpY2VkIHRoaXMgYmVmb3JlIHdhbnRlZCB0byBkbyBzb21ldGhpbmcgYWJv
dXQgaXQuDQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPg0K

