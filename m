Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4B94B2486
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 12:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270399.464677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUF8-0004WF-0l; Fri, 11 Feb 2022 11:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270399.464677; Fri, 11 Feb 2022 11:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUF7-0004Tz-TO; Fri, 11 Feb 2022 11:37:37 +0000
Received: by outflank-mailman (input) for mailman id 270399;
 Fri, 11 Feb 2022 11:37:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S5m1=S2=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nIUF5-0004Tt-Up
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 11:37:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00305508-8b2f-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 12:37:34 +0100 (CET)
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
X-Inumbo-ID: 00305508-8b2f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644579453;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=26khc7dGywFtIThPhk0sIzdIOIh0TJ1xvcNRrfHCh6o=;
  b=fcCx0FoQWjZfa5fKm/lt8TQn8vKT8XaIoxtKwz3q6jum64b7+AShbwvw
   giOK6k5Ki0zQKURdcmHlbqHjb1ZmaoOukfv77P6xh3iNSxf/Es2xlc6Ft
   vF3FFeO9DXEN5kqvnSoIf4U8I8bs98HlndqpFGmME01Inlwo2KScYOU+2
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UCC40YeFMc/zhbTE+uQHwQe2OiaLG1LpmsJsEl0laqGkpCE5k5BwodoB8a3tJzA8ax7fJNt6GR
 sD8EjvmzyLUB75UuSXo2HTht9H6f61hXC03i3Rzwa0KOXbWv8iUKp2OLNotYeqeGtg/SUS5mOa
 vxcMmHihleBFcBR5j2pwDn/OdG4Mh4Uxxs39u5pa49HJCWBzQKLaEqYEEAEmXdFUREKBcG8Wrp
 2kZyOhad83/yE2LurZR5xCS81iqlW/3YgtYABN/Tt1Dz9eqKeFS3eE/0e8GYjZokh+37iEE7nL
 EFAhhc3upMNSUX6ny9Uop16K
X-SBRS: 5.1
X-MesageID: 64414836
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BKLUj6z2kQJsvvY49nZ6t+fuwSrEfRIJ4+MujC+fZmUNrF6WrkUOz
 2ZJUGGAPf6KYzb2eIxwadni8U1V7JLXxoRlSgA+qyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdg2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt49J0
 9gX6YebcjwwOZWVwrsgdjVUIQgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JwSRKqOP
 JRxhTxHV1PcR15iAAguAcgil+CVrCfZLRN4twfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZDY8FdSbEhwzq2063sulzGO00oQgxoPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPQ1
 JTjs5LAhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvG0jfho2bZxZIGeBj
 KrvVeV5vs470JyCN/EfXm5MI55ykfiI+SrNCpg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3DrGgPHmNrNJ7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4ACXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:TXdSPa86kS6MaY3PB7luk+F8db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFr7X5To3SIDUO31HYbb2KjLGSjAEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadh/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHjWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mHryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczBgNl1mpDr1L8Zqq
 iKn/4SBbU015oXRBDtnfLZ4Xil7N/p0Q679bbXuwq5nSWzfkNENyMIv/MmTvKe0Tt8gDg06t
 M644rS3aAnfC/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvtn+9Pa1wVB4S0rpXW9
 WGzfuskMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wuK4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Fqd2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLH3QIwFllu5EU5HHNcjW2By4OScTepGb0oYi6+XgKo
 OOBK4=
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="64414836"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpgDSEEBwOu9cQdMxlZBcEE8AYjZhvvdn+8TePom3GJbp1jurJB/iUJct5rinDYY/vRDz69m5ggFCfKvuAXlGtZjbQfh5IqLYgIemYq7aSnhbhGsl7g8JRkOQV3DZ1rAF0L2K2uYATkk20dX5Y0sKwMPWODoy7U+sGIIqKfFGOj35t67ObcK5FfG8gvQOY5Y1clcxqPddgH38hwuuewE48ip2R6VSUdqCml8pvVwmG1Zhwp+Cs60zKNWyfScH6DEKafL0zzfRRDaAee8+HMg35ATmFgObW4Oz5ykqimZRO64koG9Rjpu5UjaQRJj1F1VmEE1BzhCagCgQ3lEpwAqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26khc7dGywFtIThPhk0sIzdIOIh0TJ1xvcNRrfHCh6o=;
 b=NI4kjCFuOPIiMWe7gk9OTmnokVN6dSQzm1mfvyhZLtrzQEefaPucaU1pvBIWK7w9AYoYr7Dof/y4VdltDAF4/NG6TA08avWTe1baJsFv4Lj43ZBkH+KiKq/gh9kwr0Kp1HFBCsI72yu/Ys9OeptgOWy1sJBRjktZpYupSN9mTHds7g1nPBRvaunBxMwh4TbapXrNn8rC//ufXctKf2nydxuHfCbHbWHZLnL5HZcXhBIu0KAogmfnV21fHNiR5OtpK45ClfJHcjAMI2TyjkoV9ZWpL22lfEfA98VuDanoVCHvro0+xzStPF1N39AYBWucQ5Gs/WRv8DuVYHmZCral/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26khc7dGywFtIThPhk0sIzdIOIh0TJ1xvcNRrfHCh6o=;
 b=kwrnvx3Z4aGaymOKxm+a9XMTK2+Fty6LdvU4cOZWsAUjOEm7xjt+pT3Q3OxO9/1fXXRVIRhdkl4lbTEHXA4yMfUgNdq9WsWHDfR7+mXicm88cyRMpB9tE16EZ3dAfQQOsUINWAeZpe0xn046esY1kdIr7pDxqmkSSyplduliAJQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul: work around gcc11 bug in SIMD tests
Thread-Topic: [PATCH] x86emul: work around gcc11 bug in SIMD tests
Thread-Index: AQHYHzbiiLtJAnQKXkmJAKoqDTbVn6yOOQ4A
Date: Fri, 11 Feb 2022 11:37:26 +0000
Message-ID: <a8d8ed37-174f-54da-5ddc-808e056140d5@citrix.com>
References: <83d3077d-76ad-b35f-4be0-5e968fbcae19@suse.com>
In-Reply-To: <83d3077d-76ad-b35f-4be0-5e968fbcae19@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e835b5b-55bd-4938-0140-08d9ed52e10e
x-ms-traffictypediagnostic: DS7PR03MB5637:EE_
x-microsoft-antispam-prvs: <DS7PR03MB5637E419D9CAC8DEC74CFD2BBA309@DS7PR03MB5637.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aOwpnPp9dUVstmvehS33REskQ+/+mm71knec7L/mB4P2USHe3klhSAsGSCKWQM+FZITpptbb3g7f35VC9y4Xo2IqnKTVWe25poL/Phr/WZLfpVvjiPsT2oXYQiIY44N6uMJe3zA3jOQhw1/hd0wjrwGp08jvsG2VE4x13dXzrCIHGiYyPMQlJY8zbrlQ9UcjjQzO457WlQIvZYpumbmQ1y5iH+abt4SaZ2DImuR1+nbwtdU/qPNPZKm8/6AwND+DL3Zi7Mrx4drQtmf6jMNto+xw0S9+JY9s/6C/Mun/uMvnPHJtFLE5SIiBjn0AOJLtquPEQXzSXxRAdjF3n17vJjyaGkXP8tZz5ZiYs0/fQU6wRVkiiZNIK22oe65yWDEtL6c6xkPw/NELxc/BUMK9YLs6cFa+RhHSggDkD2NkkQTUPM7hPW+AxUTvAnB/Njh43ceYYQngnNJl76Nh0s+JA3vvwDzDbbUmiml5/XOE/7UWoevi1UZNDNjh0rk3KGq/gjMCVhlWRWtysqmKeqxIBz5CULaxEAMO+b2a4maA+Keh3UheOdQOsxMmmeWpXErDOnbY+JZZqFXhq31D4/a4ov6gBaIU9VXCKw3aD6174lof4IXZO5giuOj8tPg80+jxGV2EwPUa7c0DtiCe5rUa9r64IW/GZklM2wRNvQ7IogL0OuMjfanFpqIdPCgWWA0P6EmRDy1SP/3Q7T3KS6rJcKFh86/KHfzP8jzrnRLVmSzdUb6e10h/6cK1/lqo+ngOcNIz4CRb+MYp+ROZK9ynkBb76aSDr7klzx9tJEzdZKvxo/hygrOO7HZk1YOtBVE/FNlTRK5OZQthPQhKpcDoBOoADWbfkS2bHmEOsYkat0A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(38100700002)(54906003)(8676002)(508600001)(186003)(5660300002)(2906002)(66446008)(8936002)(53546011)(107886003)(316002)(26005)(2616005)(36756003)(91956017)(4326008)(66476007)(66946007)(76116006)(64756008)(66556008)(71200400001)(31696002)(86362001)(966005)(6506007)(82960400001)(6512007)(558084003)(6486002)(31686004)(38070700005)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejh3azN2NTVKT0dhNHhtS1VLdE1RMmhlSDRmWnVDNjVaYTVHRXJhZnN5amtV?=
 =?utf-8?B?d0o5dEtRNFFpNUoyWFExWjcrUDVPM3pNUkViMFBjQ0FnbUptWFRERks0YUIy?=
 =?utf-8?B?UEh3UjRxSzZyMTd2QVowSExOaUVTMEpFZER5VEsxQVdDLzZtNklraElaMXVo?=
 =?utf-8?B?UGNCbGFpY0l0alBJNlhMd2o3ZlNzd1ozREVGYUMyeFhuRHVpdGsvTjk3SWYw?=
 =?utf-8?B?Ty9ZYlZqdTdkQkF6YVQyWE1UZDNzbE5PamxqY3ZhM2tWdU1oVG5naS9YVzZp?=
 =?utf-8?B?R3NaK2RsbTdrL2tlOGZXeXcxQlBTUSt1ZW8vWEZyVVRXLzhreSt0cFJCdmRU?=
 =?utf-8?B?QWcwSFlPblh0ZzlTRk5nRnRPSGM3MENLbmluVm1LYzZqNVIyUk95OXFFWVRK?=
 =?utf-8?B?TjZIcVhPamFneG5BZmRxK2tpRStPOGpWZE9zcXZJTTIzeUEvTlFmWVJGdlNI?=
 =?utf-8?B?OG5MUzdvRGhjZEo2elN5WTBFVTNLMnI0Qy8wNGk0WjkxcC8rdUg5NzRqK1d4?=
 =?utf-8?B?dDg4NWkydklhOVZTRHcwY0o1UG1WSHkxWmxrbUt1UTg0WWpCc0p5YUR1TFV4?=
 =?utf-8?B?M1RydEJFY0NlR0dld2pSWktDazlsaXNad3I2ZEZQQi9GQkpkV0YrZHA5dHF4?=
 =?utf-8?B?dlFkUFh6YWxJOWJQRmxHL2pkUEc3OVFaVDg2TFRvVlFEZmI1RXIyZFJ6S290?=
 =?utf-8?B?SmNnTzF3Z1UyOGRoSUlHY0pzb1UzSVoxTXVsSW4vTE9nM0p3YkRPZ1lsUWdO?=
 =?utf-8?B?Rlk1Uzlmd0E1RHFlcmNaYUN1UHJ6RzhYZGhzNXJxYWR4V3pmT1N2ZXJweU9u?=
 =?utf-8?B?b0tTcVlXVzVLV2NVSyswL3BkV1V0YmlRMUl6dkFWaXpjd3VLcHN6QmxyditS?=
 =?utf-8?B?VVdGdXZONXF0NGRadHhueDFyVVN2aERlaG52SDNEM3UwTUFjNnc5R3N1TExH?=
 =?utf-8?B?U05zWkE3QUFQc2c1UTlBZVpuQ2huc0tROEt5QVZEand0R1VIMWM3eEVqVkFC?=
 =?utf-8?B?ZEQ5em8xOTU3QkxqeUZ4QmtWVzVuejI5R2pZMlUwRE11dFR1bTh5QzQxWUtK?=
 =?utf-8?B?cDBFQmRrdjV1ZU8yMjI3ejZSRUxvd3dSVmpFM1h0N2NsK2NEWkhtalFxczN2?=
 =?utf-8?B?UExGWDBCUnJDbVVHZS82UzZxMEFSdEYwU09kb28wazB2NmdkckQ4b29NSytS?=
 =?utf-8?B?U2g0bWFTTHg3MVp0ZVFGcjgxM2V2VmVCZDlWSnJDT2hUcHRHRThzQ1NnRjhz?=
 =?utf-8?B?M0hGWlNMRDd2SzVZZHc4NU5RSUJncXRRN3JXcXc1RzhmRTNhSDhKdEMyaDVT?=
 =?utf-8?B?NVk5M21YbUorOTBZQXIycFEyM24ya1V0UElIZnhDSlBRaGwveEVlNjVIbjJj?=
 =?utf-8?B?LzZJMFVHdG1WeDJWMXJnVzExYW5kUTRUb2V4bFpMT3NKcEljRXl0V1ZRZmxr?=
 =?utf-8?B?QS9DdW1mMHZFK1VWcytxTmdCS0tLTDVZSGF6b1VwV2ZPdzMrV0tiV3dnR3Fq?=
 =?utf-8?B?aXdGWWREcCtydG9PVTZ5RElDcTZJTlJuRXVmZ081MzhPbjlDWmlRaUxnOVFE?=
 =?utf-8?B?UktqSXdWejJvQVpiZHpQK1ZpKytIWGFIQ1FyUUxLeGtSaXFWNWw4VGJ3MEoz?=
 =?utf-8?B?cExBVzdaZ2ZZZ2hyU1VGelZjMklrRW8zWmdadEhsSkZoU1pDcUI0LzR2MEtq?=
 =?utf-8?B?eU5YMVV5bnNaM1BtWVMwOUhyVlgxb2pUQ09Jb0xFMnkxN040YnZpcG5RYnlu?=
 =?utf-8?B?TXpYcTZDdHVlZHdqdWM1UW5IMTNBWVpEOTFuUStsZkNWb0tXOGFzUkpja2ti?=
 =?utf-8?B?SDcydjVzTFBTRVpwelRKVFhGYVNTaSt3OFY2cGNxM0psVjhlVGRYWnV3Wm1h?=
 =?utf-8?B?a0wzUnJpMVZWZ041UHp0dEVabXNrWHJqUnZqTmVES0s0cGk2c1FEZ0tuZ3gv?=
 =?utf-8?B?ZGVmU0EzOHM1QUVIQS9xejRwWWFSNnhzMGpTV0lmUHVNMlJZOExFSUl3M29R?=
 =?utf-8?B?a0IzYlc2RmVWTTNtczNkNXBTc1p2N3U3QWxsZmdya0Y4d0h1UjQxODZ6UlVJ?=
 =?utf-8?B?Nk85cE1wN05CNWlLbGRGcEgrTldLYk1jVW5aSWJ3L1dYcTdmWlFZVTJOTkho?=
 =?utf-8?B?V2NKSThDeUsyckM0emUyU1MvMmo0dXRTbVZvY0Z1cHptampZTW5ON2J0TGMx?=
 =?utf-8?B?eUNMQ3VrV0pRUjFBQUZNMUVKdXkzYWp1UE94bVBjTmVhY3pSTUxWOGRCMkE5?=
 =?utf-8?B?MEdJb2dXcWRHV3YrRWxVNE5HLzRRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C60370E3BB81F41A507DF4D8D385CE0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e835b5b-55bd-4938-0140-08d9ed52e10e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 11:37:26.7278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CvaaBVxQHc3TH9DPBh2RvF0gSGSUuZUyYBagkjMy+DgRi089xIdAK53R4obZc7/rKkydXIvxPCQQIe3VXj82fkVC/cilqYCM7zi75tZy5eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5637
X-OriginatorOrg: citrix.com

T24gMTEvMDIvMjAyMiAxMTowMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEdjYzExIGxvb2tzIHRv
IGhhdmUgdHJvdWJsZSB3aXRoIGNvbmRpdGlvbmFsIGV4cHJlc3Npb25zIHVzZWQgd2l0aA0KPiB2
ZWN0b3Igb3BlcmFuZHM6IGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dp
P2lkPTEwNDQ5Ny4NCj4gUmVwbGFjZSB0d28gaW5zdGFuY2VzIGNhdXNpbmcgU0VHViB0aGVyZSBp
biBjZXJ0YWluIGNhc2VzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0K

