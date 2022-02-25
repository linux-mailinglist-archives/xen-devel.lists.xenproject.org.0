Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0BA4C3FF7
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:22:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278800.476183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNVrX-0000zC-Iy; Fri, 25 Feb 2022 08:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278800.476183; Fri, 25 Feb 2022 08:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNVrX-0000wl-Fl; Fri, 25 Feb 2022 08:22:03 +0000
Received: by outflank-mailman (input) for mailman id 278800;
 Fri, 25 Feb 2022 08:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfiy=TI=citrix.com=prvs=0484f4aa7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNVrW-0000wd-9i
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:22:02 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00087e18-9614-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 09:22:00 +0100 (CET)
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
X-Inumbo-ID: 00087e18-9614-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645777320;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=SU2yN9Q1lEKlxdyV4yT10+E7f1BL0BrER8rYX+/tAnE=;
  b=XyGKixw4QNDfABKvZbdeo81gKqvJVHfrk9yBRh8trwdOuCJmkLhEHOPe
   zf4Qi5dr4cGWbBPJ2U94XQ+CEZ0ds41lH5yC8B2/DYvgFFVl/qnU6NZZ7
   8fDA4v2qQ/4a/XD0KwrfjmsfoSFg/7iqL47J7u3AKuWP2V56yvKJuz92k
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67238741
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hnJyXaBKHpkrgxVW/+7jw5YqxClBgxIJ4kV8jS/XYbTApDkm0mADz
 DEYXGyGPvnZazPzftt0PITnpB5Q6p7Qy9ViQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Rj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhWy
 Ol8jZK2Tz0DO7fxmcEzYjx/IythaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGg21r1p8SRJ4yY
 eI6UhpBV0nkPydkJ0gsA7Mcpbr5xWbGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ/PNwnEeawGBVDRQMTEa6utGwkEv4UNVaQ
 2QW8Cczqak59GSwU8LwGRa/pRaspBccRt4WCOw85wGlw7DRpQ2eAwA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9bnKhx4+aqzWIEy0PEG4nSx4hajsP/Iy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxl4hPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWA0DaD/LF7rlxBHkJPm6gKsVmSw28zb645lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIYTPcQoKFLfpHk2DaJ144wLuBJ9+U3YE
 c3GGftA8F5AUfg3pNZIb711PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3mGmaZOfAtiBSVqWvjLRzl/K7frzvxOQzp6VZc8ANoJJuRYokiivryQr
 yHlBxQBkwKXaL+uAVziV02PoYjHBP5XhXk6ITYtLRCv3X0iapyo96ARa908erxPyQCp5acco
 yUtEylYPslydw==
IronPort-HdrOrdr: A9a23:bfXFlKuZLPblowWK25s7nYbE7skCmoMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkDuRYTzrdHGeKjM2YabQQ/
 Gnl7Z6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WjAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 RT5fnnlbhrmG6hHjHkVjEF+q3tYp1zJGbNfqE6gL3b79AM90oJjHfxx6Qk7wI9HdwGOtt5Dt
 //Q9RVfYF1P74rhJ1GdZQ8qOuMexvwqEH3QRSvyWqOLtB0B5uKke+z3IkI
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="67238741"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIsdafmqmtayZ48S6seSN0jsxXT18jYKmZjZk5AYON/W8ici1nIPqcLck0JcH3olzYGiIE0beOJkL0xTEkWJxCPMZWX1R8nbReNSzBGTODfGH4WRR4e95Pyft5iLqdzi8wfXWWtwoQ8mjfi+Pf6KqEGQwsILvGmWShOQleUC5lKUp7BQf5pU55M1l5JHWL47A8MEYtdifzx3hbuu45nOy8ERhJfsOFmCmzAm4aScK6WmGb4wTou61b+eWHRIbr/N2SiCfrdW/lk5Yrc+mQTsSRg4i5u5xFuOos9ewj+rWhcIecDh0UWsFfmgHgSLMcs606lm8x2OweHVatmnZryfug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oP54Ot7PWMoy2ZY2U1Ti9Nruaac6CbGjFHOhndATzFY=;
 b=BoNbPT8X+a0AorE/Eu/hNL2Ad5fk72upHRKvZXhdvqrrz5y5DKwYn9cWSRpntRBWqt9DbuJ0YSj4SgO6x+Qz2IvIvS4hD6EEBIrnXQra19boZbJOcQjyRjj8CJ5qO84h2betmU8Zt8L+OrnvqCmMZW+k81rCfVWmJdP+SELZEBs6ke+3ajOdZXM0nBq+HLw5JxOhVTn/nry7/jmznT7ltwalmttp4kuld2Cqx9uGbC1qL+fHZBcmuyt6ZFo1z6RuBdF31M/UclnK+uSdcHxWbzsEu/vNfRcIQAQ2gufddrbR4HpPBKKkHUvw1JrpKUh3XYLNhpwdxOP8lKNq2c2mzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP54Ot7PWMoy2ZY2U1Ti9Nruaac6CbGjFHOhndATzFY=;
 b=cNkbKXvI/bSNm7xcQJLJvCZauxjQ80H0P8WYiQg4L2EFRVSG1p6gR6UbBbSGhZU65ILZQDO1lIC2CZ89v4ZOwtJ2P7pzgd0MWADlGFofRiUW4B4gBL5v/bxPHBL/O7B/WeW+FIGV+L3JmJslLCwrwJobt7fsxvyeG1/UscDWDa8=
Date: Fri, 25 Feb 2022 09:21:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <rahul.singh@arm.com>, <bertrand.marquis@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/3] xen/vpci: msix: move read/write call to MSI-X PBA
 entry to arch file
Message-ID: <YhiRnmgajgeat/fP@Air-de-Roger>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <3e47316052dce3c85bde04ab6b72ba4f48fa0bb8.1644937405.git.rahul.singh@arm.com>
 <c8f54e83-95c9-04aa-d788-da755e284c42@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c8f54e83-95c9-04aa-d788-da755e284c42@suse.com>
X-ClientProxiedBy: PR3P189CA0071.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4aa4472-69b8-469a-c221-08d9f837e215
X-MS-TrafficTypeDiagnostic: MN2PR03MB5264:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB5264616AFE044B137053568D8F3E9@MN2PR03MB5264.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FF/zYNVWqDpM9cj5d2j+gIKWKdZMQvmy34yiUFfX8uE5BzTYnO3fiNAYXCIVO5tdi+SbSj4B0gd4zVSp6vfch0zKvndiaSna0MCcuzoxUp6n/88GrvkHYKi4WZ1KNoL03VwStVjM/FUZTrOdu5iPmk3D9oy+1DbH6E4e599SRtzuUUAqfOIButHRFfBmCRtOL+KwbA40MfA/Qp3W4WUhVHragc/cZnk8R+KXoq4Vjyq7IERcf+58+CFawqFg3To19kJTU0iYfIASsxwN3MIsa1aNu22iJBOZuUqwjw3EODq2C0AE30z39xc8xOWso3FDj3pknYJCQ9fycLA0bwqx49gzeIkyUo5rWVGgFmW+twv41bJIq2PY/XEckAEbpCDiZTWvUSp4j7FhIChSOUc8PRYM3/TnKq9xFkj+m2on44CoLQuaMQuyvtu9+R4E9rW92HAH2ddd47Y55zB2P7bZeoozNLCzQXZfvnHolhUpD9Eg8eWw29plRctYke1P08gPWB6xJMgDcFF8SMjI1vXSxyoQk9OVufFkhjKE9S15dYYGBtJN1+WZQ6PcLZGc3LdFZGNcK75eOXY/cSPpJt2XoPLlPl9jxeSB849YnAUuqPZn+waQcjL2aP4zbQxMYm6jrAwCyMR/qg+Q4esvNIowAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(2906002)(8676002)(4326008)(66476007)(66556008)(66946007)(508600001)(6486002)(316002)(53546011)(54906003)(6916009)(82960400001)(38100700002)(9686003)(6666004)(6512007)(6506007)(83380400001)(8936002)(5660300002)(33716001)(26005)(186003)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG41Yk1UNGNOMTl2YmtFTGx2bzR5WktWRjE5RzBlSE8rNk1hdGc2d3VUckQz?=
 =?utf-8?B?TVh3K1BHaDB1U1IxTXVPSTMydkpJdmJkZktIdmZFTXByR1p4amZCVGdsK0Iy?=
 =?utf-8?B?dU5uRnF1NVJSbWIxc2VWMUQvNnlmcTA4a3pLQmhvc3VPaGYrVXZqWTVaWTl1?=
 =?utf-8?B?WmpoRWY2WTlkS1FON3BsTlFkd3lZUjZuV0RwMWRqZkszWUNPWStoMDNVYm9j?=
 =?utf-8?B?K01ya2pNMndEbEdKSkQvQzRCYndkSXdDZGxsckFrUVhUaHBnTldCWDAvWFlZ?=
 =?utf-8?B?VUpxZnU4TDdGTjJIRWxxK0QrczV0eEpmdVBOZDBxSEEycXczSjMzc1FUY3p4?=
 =?utf-8?B?dHdsdWZ4SGltNzYzR08vaFpvUERJSmdKaWh3UlR5bEp5VXpvdDhKU2FhV0RI?=
 =?utf-8?B?TDFxRlpvNVVWdmJDUDZQUWF5c09od2pVdGFsaDFoMTRxL0ZwdzNSZXpHZE1m?=
 =?utf-8?B?RVJ2UmlGaXAvdTE1NSs3SWNNTk1hMjNFSmxNVDdKVExUN00vY0ROVHVoR3Js?=
 =?utf-8?B?OERxL1FHN2VwUlJoSFF1V09zenNhMnpINFZ2WnRjR2RiOGhIQktYZ3lPQkVJ?=
 =?utf-8?B?MnNNdWRKcGJkN3B0aXdYYmZOUVlIZjJ0OGUwM0QrZmxJS2xZaTFIazYrcnJ5?=
 =?utf-8?B?RWtoaFVxVnJieTdHS1JXYmJzNVE5R1E5VXdWTG1xNVhZZFFFNHBiRExSWWRI?=
 =?utf-8?B?TjFIdE8xV0U0TWt1Vnp0ZlhMRlp0WGRQTHI5bDVTV00wcTd2MkZaRzhhZmhi?=
 =?utf-8?B?THZuWFZLOFgyaTA0cjluak1YUVg5NW1jaGhwYXUzK1VMSmw1TTBPUjNoRCt4?=
 =?utf-8?B?OHdOKzhGMU14cG8xaXdZTGxkak5aaUxnWlozZG5VWG8zd1hFclhXbTY0eDlT?=
 =?utf-8?B?UzRRUDdhQTZIZDlXd0ZlMXFobHo3QVEyWjZJajBPclJvenlteWlJd213MEhV?=
 =?utf-8?B?WEhOWmkvT1orWTNtTjQrc0FxbjlEdmIyaHZlbnV4YXFGd1NQaGZ2UlpLN0g3?=
 =?utf-8?B?Q1h1MFMrZ2RYdUYzT1Ezc3RGbkpFMk5NVUVtZDFNb01LUUJuSXpzMDc4SGN3?=
 =?utf-8?B?RkZkejNhY0lNTjloTWxNRnhvTlRQbThoczVQUEl0TmY4djl3b0gzaUMyb3Y1?=
 =?utf-8?B?cldjVVFSYzYxRFFoemFZcUtHdnZLd0JNVUY3d3BmOEUyWVpOR2lGd2owQnJ5?=
 =?utf-8?B?d3F3dG9QVFhaYU03bEtQREVESkcwdEtqYnFjOS9JOVp4SG1abUprdHAxQkhu?=
 =?utf-8?B?V1dNTHV0YkxQQVIxZHFocnNFY0J1cU5FS2kyZVlEdEFBQlFIZG5UcllyWGZx?=
 =?utf-8?B?d25rWnpQaE5CeE95VTU2Y081NzFEaXNmVmpNWjdaUm4xZGFTcXgrZFMycmw0?=
 =?utf-8?B?T253c3pQZlhzd2ZvV0lxT0xtWEp5Y1ZpTElLRUxicVFkSWozc1VPR01MSmRW?=
 =?utf-8?B?WnJMYmd4b2tvRTkwU2s2UXhrZHVqYjhEQXhLQmhKU3VoSXFzQXArbks0a0xx?=
 =?utf-8?B?L0tMZm1PamFMU015UFBFcFBtQ0dPZHdHcmtDOVRXSHArMkN0Ujl6V0drZWxm?=
 =?utf-8?B?MHYxZFVyd2FZMEh2MDE0Y0lVTnpQWDBzcVBNWlFDYVhDdVpnVko3aTZhR2pB?=
 =?utf-8?B?V0tlOXgxQzI3OVdFZHI4RE41YXIzRlU1R2diN2kvKzZwZk5aZVd6WlJKOHVz?=
 =?utf-8?B?VUZjMlJsVVlqdkE2cWNFdjYydktXUWhrSDViYlJ5ejF2TTVpa3NuaU1URlF4?=
 =?utf-8?B?QUpab1BJYnUrSE96U3pIREpETmdqVG5ON0habWE3UnBaNk5BdjV2TjFCaFBZ?=
 =?utf-8?B?KytSUHRweWNVYkNJRE1LajZjSjZwR0puN1VaWVNneW9jWkhCNSt0d3lZT3BB?=
 =?utf-8?B?bjNILzJYWWF0ejNaZ2k5K05vSWl4SEZVTktSbHFoTkdreVo5cnN1dngyMHI4?=
 =?utf-8?B?RlBmUWV2ZUJZY3BWWjF5NEEzK2NuWXR1cVRrL3dORFRWVTM0YzFza3VDWHVI?=
 =?utf-8?B?ZnFwU1gwcjBqOFloOVE5Y0srZU1zUmlPeDhlakdaWkszaHZwcWZDWVF3YS9H?=
 =?utf-8?B?TkhrUmZ5SGMwMDVhV2dxR1d2bGpwVG4waXdjTFFsU0s1VFlQMTlzTTE1RFJY?=
 =?utf-8?B?SlV5MlFCaTRyeDJxQnU2SDJEbHkvWkt1U0tJTUpTTUN6WVF3aE9qdngrekxr?=
 =?utf-8?Q?cvK1UTO+Am14+NFPh+MF0CI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4aa4472-69b8-469a-c221-08d9f837e215
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 08:21:55.2414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDrSKP7+rvEhQ+pINw63pL3tn1PDuIL3rpN5zB9O5oJjL/GndKNQIGJ7FGraSZY8S10aLQXe/edz0kuI24EAyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5264
X-OriginatorOrg: citrix.com

On Thu, Feb 24, 2022 at 04:18:31PM +0100, Jan Beulich wrote:
> On 15.02.2022 16:25, Rahul Singh wrote:
> > @@ -170,31 +170,7 @@ bool vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
> >          return true;
> >  
> >      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
> > -    {
> > -        /*
> > -         * Access to PBA.
> > -         *
> > -         * TODO: note that this relies on having the PBA identity mapped to the
> > -         * guest address space. If this changes the address will need to be
> > -         * translated.
> > -         */
> > -        switch ( len )
> > -        {
> > -        case 4:
> > -            *data = readl(addr);
> > -            break;
> > -
> > -        case 8:
> > -            *data = readq(addr);
> > -            break;
> > -
> > -        default:
> > -            ASSERT_UNREACHABLE();
> > -            break;
> > -        }
> 
> ... in the comment ahead of this switch() (and the assumption is likely
> wrong for DomU).
> 
> But then, Roger: What "identity mapped" is meant here? Surely not GVA ->
> GPA, but rather GPA -> HPA? The address here is a guest physical one,
> but read{l,q}() act on (host) virtual addresses. This would have been
> easier to notice as wrong if read{l,q}() weren't allowing unsigned long
> arguments to be passed to them.

Urg, indeed, thanks for noticing. I will send a patch to fix this
right now.

Roger.

