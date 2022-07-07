Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C505C56A68F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 17:04:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363022.593337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9T3H-00088G-Eg; Thu, 07 Jul 2022 15:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363022.593337; Thu, 07 Jul 2022 15:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9T3H-00086S-BU; Thu, 07 Jul 2022 15:04:23 +0000
Received: by outflank-mailman (input) for mailman id 363022;
 Thu, 07 Jul 2022 15:04:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q25n=XM=citrix.com=prvs=18057f629=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o9T3F-00086M-Tb
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 15:04:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1264744a-fe06-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 17:04:20 +0200 (CEST)
Received: from mail-dm3nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jul 2022 11:04:11 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BN9PR03MB5996.namprd03.prod.outlook.com (2603:10b6:408:135::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 15:04:10 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b4c7:a1fc:f10d:8b9d]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b4c7:a1fc:f10d:8b9d%3]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 15:04:09 +0000
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
X-Inumbo-ID: 1264744a-fe06-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657206260;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=Jmb0kh5NjF+pGvoFIlAhHsXAw8ZYM5cPqKW/FimTJWQ=;
  b=OB7XP9XY7jgFLNnjlPRQS1lxOcinQjNM8TVQgrNverfAM6prKfv6lBCW
   MrptBGF3kLP987S7hUGWY+dE+siidaJmxJL5rL+EjIFMvmjphq5Yy8sZ5
   MkvizV+JXFLVBMLQxEoahqN3E5jR5EQy0kot6osCXUroS9o6V5jmibfRI
   E=;
X-IronPort-RemoteIP: 104.47.56.46
X-IronPort-MID: 75115363
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DWyXiqjLjT1OjTZBFOJB8kouX161ZxAKZh0ujC45NGQN5FlGYwSy9
 lOraxnFY6jUMyawOYxoOc7lxf41ycLVyd9lQANtqCs3E3sQ95PJD9rAJE2uNC/MIJacRU9u5
 p1BM9DKdZ4/FiCN+EihOOjr8iF22azWGbD1A+WYZHwZqWOIMMsEoUsLd7kR3t446TTAPz6wh
 D/SnyH+EAKv0G4rbT8eu/7S9Boxsaz752tH4wQ1PK9F5gGHzyVIXc4Tfa2/ESD1E9JedgKYq
 0cv710bEkfxpUpF5gaNy+6jGqEyaueOe1DI0BK6YoD66vR4jnVaPp0TabxNMy+7tx3Tx4ork
 IoV6sTqIesUFvakdNo1AkEw/x5WZcWqyJefSZRomZXOp6FuWyKEL8RGVCnaD6VBkgpEKTgmG
 cgjACIMdni+a9eem9pXfAXOavMLd6EHNKtH0p1pIKqw4fwOGfgvSI2SjTNUMatZammj0p8ya
 uJAAQeDYigsbDVJCAYcMcwfnt6jrTrlVQZVqFaSuaoetj27IAxZiNABMfLzU/nSH4B5ux3do
 WjLuWPkHhsdKdqTjyKf9W6hjfPOmiW9X58OELq/9bhhh1j7Km47UUVKEwfk56TnzBLgMz5cA
 xV8Fi4GgqU17kOmCPXgWRmxuFaPvwIGWsoWGOo/gO2I4vWJul/EXTZfJtJHQNcdlZAEQxst7
 A6inuvKL2Ztl7LEQG3Io994qhv3Y0D5N1QqdSICCAcI/dTniIUylQ7UCMZuFravid/4Ei22x
 CqFxAAhg50DgMhN0L+0lXjFjCirvYPhVRMu60PcWWfNxgFzaZOhZoeowUPG9vsGJ4GcJnGDo
 XwFls62/O0IS5aXm0SlW/4RFbuk4/KENjz0glN1GZQlsTO39BaLQ4dU5z1vIVZzBewNczTpf
 Uz7tBtY4dlYO37CRaV6eZ6rAsImi63pD834V+v8Z8BLJJN2cWev/jxoI0iZ3GnvkU0luaA5J
 ZqfN82rCB4yCql5zTzwW+YU15cqwDwzwSXYQpWT8vi8+b+XZXrQRbJeNlKLNro99Pnc/FuT9
 MtDPcyXzRkZSPf5fiTc7Y8UKxYNMGQ/Apf17cdQc4ZvPzZbJY3oMNeJqZtJRmCvt/4P/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:nWbIf65hs6NfY65+PwPXwWSBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qADnhORICOgqTPqftWzd1FdAQ7sSircKrweAJ8S6zJ8k6U
 4CSdkzNDSTNykdsS+S2mDRfLgdKZu8gdmVbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9o1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUWpDKh8KoCOCW/sLlWFtzesHfsWG2nYczHgNkBmpDt1L/tqq
 iKn/5vBbU015qbRBDJnfKk4Xid7N9p0Q6s9bbQuwqcneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2KJoM1T3am7a/n7/nDE3kbKvNRj+UC3a7FuIYN5vMga5gdYAZ0AFCX15MQuF/
 RvFtjV4LJTfUmBZ37Us2FzyJj0N05DVCuuUwwHoIiYwjJWlHd2ww8Rw9EehG4J8NY4R4Nf7+
 rJP6x0nPVFT9MQb6h6GOAdKPHHQVDlUFbJKiafMF7nHKYINzbErIP2+qw84KWwdJkB3PIJ6e
 P8uZNjxBoPkm7VeL2zNcdwg2HwqU2GLEfQ49Ab4YRlsbvhQ7euOTGfSTkV4r6dn8k=
X-IronPort-AV: E=Sophos;i="5.92,253,1650945600"; 
   d="asc'?scan'208,217";a="75115363"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxuHEakBIrZPHwB06uHBG0RsNEMogCaIODJ5b+RVKJBx5yXCOJEhBKUhuu1uvl0XlQiVA9dbX2jnGTXBmu+IhAZQQd2xOduMJZPrQKBvPcPx0QyR7yPF5iuywIqC3mWiFHpXGzC70v+O1MahKvIgAZdXUJm/3v+l0zB5405hqTauG9FythUyYaHXTlG8I+YmXSFYCLpgYN8D/SxxfBAB2LqBXJIWIN1Vp+Nj5bJgM+7P5+69QBnmVKYmjRkBF4i6NqHLCyqVkEElF0VpKMO+LUx5Z+LLFRELJqB2OdOwZVPUND8vdEDF3Artne2pimIXhWyxqZNJTcjQ2TSS4qrnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJwQoERK+bfaDkMb10H+k1Khi6cTZR3AJZfP05UEqEE=;
 b=oGIkJhF5jIEHePR66RPWn/SyzDSSZmwTrHQ4R9RgPv6JuFt4r6bae9IjrvHXfG+VY17jsCkCC0RYxrg0xJ9EG+wfxsavuXZmvfqhtAQZ0TLeq8JOKeg0vcaVZmrJqIIi4304klroJnb/0HvyIJxIvKQ+y6gRs5kNubXTqMFkijEnmelTOuvDBl6h8LuFmqPsj55eH9p+rv1218DXnwFT1bHBBKnYApTIsXEOva6S7KE9fF7YxRYtRlhkdAXnEEbLQUYp21G7/TXN2udhjb7vewfZ4uwi1gvpnxPMPvWEL27qhY8Lfii/f5ql6kLNOpBIK9CYZfmGBlq8pTs5a3gjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJwQoERK+bfaDkMb10H+k1Khi6cTZR3AJZfP05UEqEE=;
 b=UZdunpZf0niIWmTqd+Z+GLsi5jYULsP4orSLirFGTvBOI1feNTjeRPAjzIOjmrlDSwxq1OqYW2LUj12hlHz4I2eKqdtG7GOQJXobxJIFSEQVBrjAI6+U8KkmWBCd15msuevt5nxJWiR5/u0MoGFaYfZP2as42l/MKLefNIYQjjY=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v10 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v10 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYTyjM9+S75qV8UU+hKsd4jxf1861zh0sA
Date: Thu, 7 Jul 2022 15:04:09 +0000
Message-ID: <F21042DC-FAB6-4E6A-B201-5EAAC34E5D55@citrix.com>
References: <20220413112111.30675-1-jane.malalane@citrix.com>
 <20220413112111.30675-2-jane.malalane@citrix.com>
In-Reply-To: <20220413112111.30675-2-jane.malalane@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6032c4fa-d1c0-403b-e7be-08da6029f226
x-ms-traffictypediagnostic: BN9PR03MB5996:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LYMk9PP76BvS4sa9lbCAIEmXKF87PF7t8yxoNSa1LRiiJwpAyE969c3PuQ6fyfA2fRRarR1WRIAsoXzCaXbte5HE9qOu4Oizp3JanXuvNdOTC37qiJI/Bn2H4MjBpCQthdNMimQVCyobg1D8tEyfASn38zkMmvLaaEW2su8w1p53EOdg/4Fw4pF1ZIfnPVCgdUkNpex/JZAK4jl+cN6SKcVaDG1GwZ/zYQzeu8bN2VesA56mKTP/E0CX8O2g2XinjBDPv84Qquzv90hhBDB/ZMc8ilbKuEg+Ks+VY2V1n3qVKwa4D0H5GfhjpLZzRYGHKfoGa8STKY8B444XEDHrjE0qOWimcTzJUCnr9oAVQTW+1cz0pfQuv3U7X7fVSQm8jGiawgcc+GU+bLPzIL9byFoqWBqK8mWKO8kDE3ZI5y5MDIJgH7v2yfWOzoW1+gwQjarsEDb6YJbv6DlDb1POEZRrjFVEameGdFUUlRw8roxpf7XrC21qpniZm++VQUR6ZziqyGj19N/abguZxt1KJvzgTsEM1wjf0u2vUApCH9MzcYlzABCNSrTJ6N9tSo2Pux2r/D0lzk6UDyxEapRBuWAG6ZI5r4CQNJA44eRExxX9MvKqTAVwp0PZp4f665jMrfCfuAzAGN4EJIhjtQQOSyqFKLzOCqNLBjKs/FhdyxlO4dlBBnkZzTcly6LINmzv8aBmg1ob9mWDHXdyVWg9VxTQkI7GSgWd5DWOMvP61b6OS2eiXkQjd0svQqZghsvnEHoRCsYXYeCzjucE6AdLvh1DIGYswlPURedYj2Htcku8DQ6IFJD4mce11hJzJBMhww0UhUaiLR12A4hiq/fE/eIkF292QMMFkhDTzzhvvQw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(107886003)(186003)(2616005)(38070700005)(316002)(36756003)(91956017)(71200400001)(76116006)(8676002)(4326008)(83380400001)(38100700002)(6636002)(37006003)(54906003)(64756008)(66946007)(66556008)(66476007)(66446008)(478600001)(6862004)(86362001)(53546011)(8936002)(6506007)(5660300002)(6512007)(33656002)(6486002)(7416002)(122000001)(82960400001)(26005)(2906002)(99936003)(41300700001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NnM4MnRkWk5hSzhMejNMY2o1L1h0U08rbERObk52SGhzdXBKZXI2STdCM2N1?=
 =?utf-8?B?THcyUHgyT3VSWmJTWUM2U0R3WVlJREZ5RVMwa1FlekNFcEhXUWdRZitON3FR?=
 =?utf-8?B?aHNsN3hEbnBkS3BCR1NlckNwM2VnaWpIZ001QU40TlVQd2NRblcwZm5HTVlV?=
 =?utf-8?B?K1o3ZFpvWEdOeGZUWm5ZR0Y2dWZUTVJ2cE1kQXZmQ0dnZ3NJZjI3KzJCMlVL?=
 =?utf-8?B?Y2xZU0k3ZVZpalRYSHg3WmJBSmtONDN0OWtyTlppdTUyUDNyc1VoWmJTT0JK?=
 =?utf-8?B?M1Z1TWZ5cnYvYTU5SlpTNFJGZVJrMEdTZ0ZUeEtqRDI0K1F1ck83Vy90YnBL?=
 =?utf-8?B?NllZY0JzbC9jY2ZYSThxOGhvOE1nVzg5dStzTDc4Zkp0dFVUcVFBNmEzM0Vi?=
 =?utf-8?B?NUlZMFBrdkpQS2VZclQ5WldkS3ZYektUVHZ6MExiTkN1TU1YNzUwMUwxVGNw?=
 =?utf-8?B?djhqbmxJS1hGU0M2QzVvekppL2ZRUERWUDQ4N1Y3TVlhN3pGRjcya210ekEw?=
 =?utf-8?B?Q3FmUVV6SEpFQ0RNT1l0WnJOak9IcmpIUGdaaDRXMWFRZ0FDRHRhRXRLUnMv?=
 =?utf-8?B?UkU1dmhudG5ydWlsbUZYNGc5SGlGTkJodkxFa0lHSU5lRC9lenJ2OFVzbmx3?=
 =?utf-8?B?YlpqZ3AwTThPWGY3cWRDRTN5aWFxQmFQalhpZEp5NXJGWnlkUXQ2TnRzZmRq?=
 =?utf-8?B?SVhLUkZybCt2L1lRdGJ4UlJFalc0NHZFTHg3M0FreUxXU1JtelI3cEpIM2JU?=
 =?utf-8?B?eHc3R0tZWFk1TEhPVFJ1N3ZMaGxHRlpBQ2ZUUXFnRlo4YnUzd1VtWTluUG9B?=
 =?utf-8?B?YS9HL2NrbjBJN0hjSWNtWWZZcWhockY2dWJWbHVoSUdpeW9tb3RFK0QvMTJS?=
 =?utf-8?B?alFPZ2VaallZNXRpNjlPYkZ5dGRjSFVpaWF4b29SUTZzNDBuZWdWdVdBNjR1?=
 =?utf-8?B?NHdmTlhFVnpwN1BoRVZpMERueHRyRVV6MlZyUGNtMjdoKzNJNHY3OFBHb0pk?=
 =?utf-8?B?dVZvTCtqUjRlek16eTRic1VFZEVLMkN2RklFZUx4Q0JPTUNUdmJYRUp0empo?=
 =?utf-8?B?YUp1eHM4ODdmdUFwTGlPamU2TFNFSjRYWXk4R3ZjTUE5U2dzY3dQQTFhaGUx?=
 =?utf-8?B?L0RtOElJT2RxZ1c5aFZndDV2SDlqRmlZWU1xaXR0UkNSb1IzTWZ0TGdBakxr?=
 =?utf-8?B?R2NrVlZ6ZHRTZGI3SWtzb0MvQitOWEkyTGlYSVpDTVNvU2VyMXlQMThnV2Vr?=
 =?utf-8?B?YWhXbGUxYjYxNkVuVlVmYWF0M2VtaXlwNXlvcjdCanpSbTZnRWFNQUFOR2Iy?=
 =?utf-8?B?R21uMWNZeFZ4OWNqS0g5eVQ3WXlqeFE5K0N6UGdhRk9XdnR3NDU1Wm5rZlpK?=
 =?utf-8?B?R21wZ0dHYSt2YVNxVjltZkd4TVlhaVZNVkVUdENzM2U3VC9OMnpLdlJPRmtM?=
 =?utf-8?B?cko1MEpKZTR6SGxjdGpHOEhjTWNVT0Q1QnFMT0tTbHRtZTZMcmpWc3MvZ2tH?=
 =?utf-8?B?RmxabEhoOVM2YVVOVXpmN1BFV2QwTDJPOXlxMytXNno0N0hLMDVNQzlxL2x4?=
 =?utf-8?B?QnYyRkQ4Z1JwQzJoeWdQVjlxS3lES1VaQUc0bDV0VkpPZUJONy8zZ0xRY2l5?=
 =?utf-8?B?dzFGOTFwTk16a3VQSE4rV0ZzcmYvZ3RtRVF1S3RmWUZaMWZwdUxPS29yNFRm?=
 =?utf-8?B?TFR6eWpRWG9oUjRTRndWQ3ZLdVN3RVdBbWlPNTQ4bjNDMVp4Rm80TFp2ay8z?=
 =?utf-8?B?QXV3T0p3S3VDam0ydjVQcGRvbkZ5MEJ1RXRSSDY4TzVmcjdRMmFGVDZXMlZa?=
 =?utf-8?B?K3R5TWVGS29ibGVYeVlNaGRTbWVFeWh0NVZCZ3pVVlo1TTF4UUd3V0pLaHhX?=
 =?utf-8?B?bzczQ1dPcTJpMDRVMHR6czJ4SktFNk9ERmVqUXVQempqQ1hmMDJ2ZEVpYVMz?=
 =?utf-8?B?QklxVmpGeEduajJKR25rY1JBQ0NQV3pNTlZyTFlIZWlFZmlnS0JvNTlEbk4r?=
 =?utf-8?B?R3BwYjBKeHkyU01majQ3MzkvZWI2b1RUY0t5YjNMYjYyTi8yeGltaXllbXQz?=
 =?utf-8?B?RjdkQXR6UXh5SnFaSCs3dG9XMjJRWHc1dEVjSTRsa1J6T3o1M2gxQitZUXdw?=
 =?utf-8?B?VXVuRldPOTcrajVzN2VTa0trNDZLUDFGa3V5QURpNmRXZVQ0MjE1VXE0SCs4?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C5CA3C6F-4080-4848-812C-4FE2935DB469";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6032c4fa-d1c0-403b-e7be-08da6029f226
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 15:04:09.8751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nnL6ykz539zmOf3MQLbFuvgl/o854NEWszTgQkxBtL7BoG7FqjFHNol8OkNZec8uipygSzUKY9deTUfo/fAUtRyjsOVj9k6Y0FB9dWv+Mac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5996

--Apple-Mail=_C5CA3C6F-4080-4848-812C-4FE2935DB469
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_EE3D3734-4774-47EE-B9B8-C6F68DD4840E"


--Apple-Mail=_EE3D3734-4774-47EE-B9B8-C6F68DD4840E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 13 Apr 2022, at 12:21, Jane Malalane <Jane.Malalane@citrix.com> =
wrote:
>=20
> Add XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC and
> XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC to report accelerated xAPIC and
> x2APIC, on x86 hardware. This is so that xAPIC and x2APIC =
virtualization
> can subsequently be enabled on a per-domain basis.
> No such features are currently implemented on AMD hardware.
>=20
> HW assisted xAPIC virtualization will be reported if HW, at the
> minimum, supports virtualize_apic_accesses as this feature alone means
> that an access to the APIC page will cause an APIC-access VM exit. An
> APIC-access VM exit provides a VMM with information about the access
> causing the VM exit, unlike a regular EPT fault, thus simplifying some
> internal handling.
>=20
> HW assisted x2APIC virtualization will be reported if HW supports
> virtualize_x2apic_mode and, at least, either apic_reg_virt or
> virtual_intr_delivery. This also means that
> sysctl follows the conditionals in vmx_vlapic_msr_changed().
>=20
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
>=20
> Note that this interface is intended to be compatible with AMD so that
> AVIC support can be introduced in a future patch. Unlike Intel that
> has multiple controls for APIC Virtualization, AMD has one global
> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
> control cannot be done on a common interface.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> Reviewed-by: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com =
<mailto:george.dunlap@citrix.com>>

Sorry for the delay


--Apple-Mail=_EE3D3734-4774-47EE-B9B8-C6F68DD4840E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 13 Apr 2022, at 12:21, Jane Malalane &lt;<a =
href=3D"mailto:Jane.Malalane@citrix.com" =
class=3D"">Jane.Malalane@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Add =
XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC and<br =
class=3D"">XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC to report accelerated =
xAPIC and<br class=3D"">x2APIC, on x86 hardware. This is so that xAPIC =
and x2APIC virtualization<br class=3D"">can subsequently be enabled on a =
per-domain basis.<br class=3D"">No such features are currently =
implemented on AMD hardware.<br class=3D""><br class=3D"">HW assisted =
xAPIC virtualization will be reported if HW, at the<br class=3D"">minimum,=
 supports virtualize_apic_accesses as this feature alone means<br =
class=3D"">that an access to the APIC page will cause an APIC-access VM =
exit. An<br class=3D"">APIC-access VM exit provides a VMM with =
information about the access<br class=3D"">causing the VM exit, unlike a =
regular EPT fault, thus simplifying some<br class=3D"">internal =
handling.<br class=3D""><br class=3D"">HW assisted x2APIC virtualization =
will be reported if HW supports<br class=3D"">virtualize_x2apic_mode =
and, at least, either apic_reg_virt or<br =
class=3D"">virtual_intr_delivery. This also means that<br =
class=3D"">sysctl follows the conditionals in =
vmx_vlapic_msr_changed().<br class=3D""><br class=3D"">For that purpose, =
also add an arch-specific "capabilities" parameter<br class=3D"">to =
struct xen_sysctl_physinfo.<br class=3D""><br class=3D"">Note that this =
interface is intended to be compatible with AMD so that<br class=3D"">AVIC=
 support can be introduced in a future patch. Unlike Intel that<br =
class=3D"">has multiple controls for APIC Virtualization, AMD has one =
global<br class=3D"">'AVIC Enable' control bit, so fine-graining of APIC =
virtualization<br class=3D"">control cannot be done on a common =
interface.<br class=3D""><br class=3D"">Suggested-by: Andrew Cooper =
&lt;<a href=3D"mailto:andrew.cooper3@citrix.com" =
class=3D"">andrew.cooper3@citrix.com</a>&gt;<br class=3D"">Signed-off-by: =
Jane Malalane &lt;<a href=3D"mailto:jane.malalane@citrix.com" =
class=3D"">jane.malalane@citrix.com</a>&gt;<br class=3D"">Reviewed-by: =
"Roger Pau Monn=C3=A9" &lt;<a href=3D"mailto:roger.pau@citrix.com" =
class=3D"">roger.pau@citrix.com</a>&gt;<br =
class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>Reviewed-by: George Dunlap &lt;<a =
href=3D"mailto:george.dunlap@citrix.com" =
class=3D"">george.dunlap@citrix.com</a>&gt;</div><div><br =
class=3D""></div><div>Sorry for the delay</div><div><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_EE3D3734-4774-47EE-B9B8-C6F68DD4840E--

--Apple-Mail=_C5CA3C6F-4080-4848-812C-4FE2935DB469
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmLG9egACgkQshXHp8eE
G+1wjQf9Gga/GYbfMnLk0FMu3c0Nrv9BQsLyTM4/V141Lr13jxRnXikju/JxOC3e
tTx7X4xx8vlsS4Ln8VoXp7SWtQDLH4Cr/snoCR9o2z+0H5bzPKTaOfiRUA57I2qx
+TDA1C27d9JYhKexTIdq8tgwJWEKt0CDVt1MStLxgldmiuG3fcjdzCwyaqmIYrE9
Z28SuIuSG8p6DyNX1NSk9HBqYQyWuGK39BVKF8QqfBo4xf+ALQqpaUf622pLJVPx
Kkz2WCWMA5upAtRS3SOxeooZgjJMBndSZXlty0n/qy7/d4AdW5FXuErsXj2H1DpN
t4xSNJn9N9mQL6M7FDlVCzlxa9L6sA==
=OXgs
-----END PGP SIGNATURE-----

--Apple-Mail=_C5CA3C6F-4080-4848-812C-4FE2935DB469--

