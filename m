Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6EB4B513A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:11:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271856.466558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb7z-00057u-EB; Mon, 14 Feb 2022 13:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271856.466558; Mon, 14 Feb 2022 13:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb7z-00054w-96; Mon, 14 Feb 2022 13:10:51 +0000
Received: by outflank-mailman (input) for mailman id 271856;
 Mon, 14 Feb 2022 13:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb7x-00054q-De
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:10:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85963637-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:10:47 +0100 (CET)
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
X-Inumbo-ID: 85963637-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844247;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Gjteq4o6ekOhtftPo0iUqz/+mLLuuNCqewER07oN4P8=;
  b=a53yvlqlNNuF3NQ9SBZu8nVKdeBbuLAGYFXU0+KHaXkzjusyOpzoMHNC
   969ueDqus6pzq+UFjinLY6bHeNzi0kEs75PH9ThdeBVWUTkN1ehl/z5SG
   uATpycheoUPmqI4mDEpFUjzQwqklWSy4Qiep6QQXrfKsJTSx26Hs6HeSU
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tHlTv38JLab9bUI9A+a6q9S+zbLJ6lUMZ7iVN/xfBWm6EKu0gblU1eEH8JJFMJbQxmvsHKfl0a
 jKDgHEJND+K1ZQdtSsaZZeRh69shZzoikndwHJ+exsUylcNMSiI/qc0ptAOTBPJclDpe1eQavP
 FPLJT/FXq3a0SulLYuVdg+xq/g1GBEvdQ7W+pD0ZdwdwMWKzeWMAWWYF28LEV7CaKplGyuN0Y4
 VOZOCXxpfg3r6q3XurFJq6DC1aKTRPMSrLLv38MJiJrc9lR718IJ63onRnj9aouytw/9iPXGSC
 qEEsfdX24C8OLMVSlmo1+kjF
X-SBRS: 5.1
X-MesageID: 64149892
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:H5wrZayFi0HmngOUiPR6t+d7wCrEfRIJ4+MujC+fZmUNrF6WrkUHm
 2dJCm6Fb/2NZzH2KN0nbI/noUNT75XSzNM3TgQ/riAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9t47
 d5IhIe6ciEgB5eSkbUxVTJHHAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JwXQaeON
 pBxhTxHZiXKXDplGQkrMLUSjsz1tEX0NB51kQfAzUYwyzeKl1EguFT3C/LXdcaNXt59hVuDq
 yTN+GGRKhMHMN2SzxKV/3TqgfXA9Qv+UZgXHae19dZrhkOS3W0ZDBAKVVq9ruK9g0T4UNVaQ
 2QY4jErrLQy3EWzQ8PhQgajp3qZoh8bXcEWGOo/gCmv4KfJ5weSBkAfUyVMLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcbSSMV7t+lp5s85jrUVcpqGqOxitzzGBnzz
 iqMoSx4gK8c5fPnzI3iowqB2Wj14MGUEEhlvW07Q15J8CtybauuYr2z42P95M96co/IYl+qo
 3ctzp32AP81MbmBkymEQeMoFb6v5uqYPDC0vWODD6XN5Bz2pSf9INk4DCVWYR4wb51aIWOBj
 Fr75FsJjKK/KkdGekOej2iZL80xhZbtGt3+Phw/RoofO8MhHONrEcwHWKJx44wPuBV2+U3cE
 c3CGSpJMZr9If45pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnsP/b8FWIr
 o4GbJHiJ/BjvArWOHe/zGLuBQpScShT6W7e96S7idJv0iI5QTp8Wpc9MJsqepB/nrQ9qws71
 irVZ6Os83Km3SevAVzTMhhLMeqzNb4i/SNTFXF9Zj6Ahil8CbtDGY9CLvPbi5F8r7c9pRO1J
 tFYE/i97gNnFGiWpWRFNcOlxGGgHTzy7T+z0+OeSGFXV7ZrRhDT+8+ieQ3q9SIUCTGwu9d4q
 Lqlvj43i7JZL+i7JMqJOv+p0X2run0RxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkQ8S4YpxGrpm14wk4N7rq+MIxwhoBiyTPV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNIfVgrdOWO0/0QiwL+1/VtLRWo/jJz8ZqGTV5WY0uGhhtCIeYnK4gi2
 +og5pIbslTtlhowP9+apSlI7GDQfGcYWqAqu5xGUo/mjg0nlgNLbZDGU3Kk5ZiOb5NHM1UwI
 y/Sj63H3uwOyk3Hens1NH7MwesC2she5EEUlAcPdwaTh97Ipv4rxxkAoz04QzNcwghDz+8ua
 HNgMFd4JPnW8jpl7CSZs7tAx+2V6MWlx3HM
IronPort-HdrOrdr: A9a23:XFMRdKh3bdeGPvrg8W1JfGP4Q3BQXtgji2hC6mlwRA09TySZ//
 rBoB17726MtN9/YhEdcLy7VJVoBEmskKKdgrNhW4tKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QFJSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149892"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJjqPJd+g8G4O16hgABXbx9yZKnsgx3Cl/7TeFdry+HEtmDu1Ms5fZTRw+Nn1XZIEc7yUl1JhYg20DWT0qUzN4b8T78r7/cWPGUp7zfsksmGJD43u9lu2+Vokkka+Gjo991zH8QuGADORXaJeVdKLpwHZSl+zOGLtNsEx3cNpwwQ7jEGGtihMWtGms5urRXK6Pv+rI40/0jfxPVF45ycWhX3kwqdL/Kv2CgHA+snzhFH3XSwES8pjbsN2BpqrAoIpZ37YSSscEmkO5NWi/UaU9ONQH2TL9kGjQnrf9s7pvVTbwOTjXEEZD9UHHF0CWZ7l1Lkz6y/tKhQ/5XQ5aeCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gjteq4o6ekOhtftPo0iUqz/+mLLuuNCqewER07oN4P8=;
 b=hCXZhO1ZaFsw7D8isrfZfEqtiujvOXXKsm7Oeh9w39GkejNiDvZ3rdVpuikVE3gaRI+k1lq5fGYaRFlogbh6X6q3pjENhEeanvrLXVQct6rmfmqGmJSHhPbyNB9lD4JrUhdmdcug+aBTSpTAYEO30+eH7LLOu5ya1v3WqGGAu92p2y3TPm1Hpwmnk61MYRhNNzhYvTSAwU138KMBEAV0nFa0Bq/OPxD32/H359MVi5R6Sgw/rmm4u8Q2UIYdrGJE5LxlrWYoyocILKnU8efj4KBSUoFLWjDLA62WM2cLynD6BkHHydkWLb+fi6hTUl1ZbF691U/kXMMAcskjonmOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gjteq4o6ekOhtftPo0iUqz/+mLLuuNCqewER07oN4P8=;
 b=HhwzBu53IxOrRmhODmQQbrUMTJdX+4Haxaq0rFo1J+GLw2LEFqe1xynngoC7V+GPcmKZ3HCCsapGFqKh8doUmSKcoGFO1v8cIBpJsGgpJY140yjwWOZcjnftrnbjPPeSyiVL7wl6mGl/1YwdyN0pUiJNF6sUe9qAz/j41Lewz2I=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 00/70] x86: Support for CET Indirect Branch Tracking
Thread-Topic: [PATCH v2 00/70] x86: Support for CET Indirect Branch Tracking
Thread-Index: AQHYIaGi+1XAXGQfKUGTLygtpBu/SKyTBUWA
Date: Mon, 14 Feb 2022 13:10:41 +0000
Message-ID: <c471dcc2-8a91-60b8-ba5d-58874752e4d7@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42c2eea5-40c4-4d85-437b-08d9efbb673a
x-ms-traffictypediagnostic: CY1PR03MB2313:EE_
x-microsoft-antispam-prvs: <CY1PR03MB23138B312C7B3EA43E4DADC3BA339@CY1PR03MB2313.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HhALCAXDuP4Xjexs4nzH/EORrm5pafhN5IJPQnohuebDNFy8GVWox+a9Px40OtGGaFKel5HxvqwKWSxm6msu81rNyn6H4uIPIRRdI/28kLQu1WDh7BdKAjeW/pxhK98X+1GY1zfonl1ATWZZz2fIxzFhL5PQ0njx0R6TsORYihrelBaDaAlyLCIweR3ZWQOvEALPmfSzhryiOwmQyr19EvgsumlwJ5Scb9uHuPMptxO8lM193dx3IGUK/U3ytSG9jgDOUM56231q8KfAo9CwS1ZxZvOwTFhqSQ1fCtZLz+zwXljgxtZD49i/e4ICYwAt6ZEaK97+Uu1Z495oUkXlFaOAJ0WY5Ngo2PD9RT3Xz6/vzfZHtycQQp5TYfyNROq1GrX8G3qOyz4yXnyBk0pb6H1i5dVyHxDI00j0MiKV6Skk1ReW8uyrPT2jzgoTkC9Ua3TCoLvT6v5pXaYURzzDzbWHF18+vxq4ETXkV4yP9cHj3N+hlErdCB9/mHgvJKtFKSTTcyvh54Dhykz1Rwwygj+oOfBKRAJL29WDgMr59FrqAzxq88pCWQA2PVrIlvTifUI8trUNnP3yr/hdE4bAFLunCjjAhaWIQY9PYJVdBJtV2RbO9j913nwPLz3K8Grhoj7P1HXO2vY2MnP1ELaUq5dHm/qeapBc7yHHVPhW/1xvTugzpUmicwkdsafd3DOLpZIZ28YSYwey/TL4fAiDOnkLPyCatCtkhlwew/3nCem/GREuRvfhMaQO4nYmI1pRrE71UO291hSEA9TPhLT2V5HLs/AYoxM4uUAHg4xTctFmWoYQnIVejL5/aHXFFKj1GMiih13Gn4HAtKilhtU3oV0Mwjig0JQaDkP7iJxaey0kdh8Io7gf326huCFjtDqtsMYAbcVnp0sGQdAvqRTU7Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(2906002)(6486002)(53546011)(86362001)(966005)(31696002)(82960400001)(38070700005)(316002)(5660300002)(71200400001)(26005)(76116006)(31686004)(64756008)(66946007)(66556008)(66476007)(66446008)(91956017)(38100700002)(186003)(6916009)(8936002)(4326008)(8676002)(508600001)(6512007)(54906003)(2616005)(36756003)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmQyREhQeGlSS2lkQVk1ZFg0V1pOZWVocVQ2OXJ1eTBGSzhleU9oR2JBM0ZI?=
 =?utf-8?B?NFQ1Y1pKR1RCT201Kzh1RHdjNXVPR1FLSkZ5ZFk2UDgrdEpxQ08rczVUdGMr?=
 =?utf-8?B?cjI3L0dTMmM3OWlwLzRabjI2ZzRSVWdjcFQxWSsrRVpXMXNRaTNmTGJiWnA1?=
 =?utf-8?B?MWZaNHVKbDJ1OXRUc3RiYWlyNmhMQm54dWV1SEgzWnJudmwvQnNPaEpjbGdu?=
 =?utf-8?B?VWxuRUhjL0pQZU5MbnlyN3FzeEFGUXEyQUZ4bENVa1Body9YZFF2ZkMxOGxW?=
 =?utf-8?B?aEhZV0tWRUtzdzBYNnJxRFdMZDZwa2tVS1ZzTUxQWnVUQXJvVnZYenRjRnl5?=
 =?utf-8?B?MnlzWHRyOWYxeGFiT3JOc3ErL0ZtSnZWMExBSlQ2TitBYmNzOUdtb2NNbXpv?=
 =?utf-8?B?RjJSQ013ODkyL093WlBzMGtobEtyT3gvSkdZNjE1cExOb1pERXhZaWs3MGZq?=
 =?utf-8?B?anZ2NUFPdHFLeFZRUUcrRzk0c3ZReW9qQytPd0M0NWdrWk94UWtheEYrVmZG?=
 =?utf-8?B?RWdtSExWRVFaSS9LNHQrUDJNT211U0xUTE9DTUZ4WGwxQWl3Qks0SVFvdDYz?=
 =?utf-8?B?bzJKVDlGOVN4Z3plN09vR0hBejZ6a0hzZytJdXRZQUdibXE0dXd0clpFNW9m?=
 =?utf-8?B?UjZQc1FwV3grWXZpQ0xoR1dKNS9HR1JTWjY1RmpmbzExRU5Ganp3cG9MeHYr?=
 =?utf-8?B?aFVGQ1k4cUhIZGlFUEZJV2ttN1FINHQyU2RQR0tPYmdNdCtnbDhwR0ZrMnZ4?=
 =?utf-8?B?TDdPZjhLUGFYSlBaTlNYeTJYblR2MTNqakZSM1R2cnBDNi9wTXY4SHQrMGJo?=
 =?utf-8?B?d3JlamFVbGMrSlB5NUVvVDRuUGxUc1hoUjZuZHN1NUhBNmNuWXFtays0c2c3?=
 =?utf-8?B?UzY4RW5tdDhxcXpKVmxRMHBJWEdVdUtCbkcyM1dXZUN5RXpoVGV5UXNVMGVI?=
 =?utf-8?B?Q2ZRek8wdm96NDQzOTZua25KQVhZdC9NQlFFM3cyNVJDT24yY21VbGM2WnhN?=
 =?utf-8?B?SlJkbjdpTFE1eFlEUVZ1cnZzQmJJU2dncHhiaStYNmpUR3NpWDl5ZHpWb3R1?=
 =?utf-8?B?U2UreUt2dmZjQVFoc3hGcTZuL2FTdXV6T0g2aTh4dXFmb0FlSG9oaHFUU3Vp?=
 =?utf-8?B?QkxXT1U3QnlMeUJGNHRUQlo4ZlZ5NVlZWDErazBKNkZlb1Awa2F3SXpTNjRh?=
 =?utf-8?B?Q0MrSG03bVZJMU5vZ2Z6OGJpcVZ4MmxoblhraFZDR25UdFpTeXhTK1Z2eGVi?=
 =?utf-8?B?S3lDMWdLKzc5cWFNNi9LTW1BbmsyTEhQWkdad1RmVk10bk9GdFlNRGRVQXRK?=
 =?utf-8?B?ejJmenZZZ1BER21PSmZVbHVSZWE1ZTJBUU1tWjNRNlFhaHg2Wmw4VWVSSC9M?=
 =?utf-8?B?ZTZQMGYvcUhNSlhmN3cwTmNNQk9yU0M5VHRqUWpZQ1BHU3pnUGllZHUzOGNW?=
 =?utf-8?B?eStNR3NBK2FJdERBcEpJSWEvbWZXSVhFdzFxeStSZ1VNTy9IMEtxdWtsU0tx?=
 =?utf-8?B?TG5mL2p5K2UvUVhaUkt5eWxVV3NNN0J5UzlzY0xaSDJFVVVxRVJZalpGMVpk?=
 =?utf-8?B?VzladGtTb04vUlRBREl2RUkrOEpFK3c3SzN5VEk3MHdBMnVPOVlHY1A2NVJC?=
 =?utf-8?B?emc1bWM5QlRpWktUTkxtQUkxNWl0ekc2T1dlUTZsMGUyOXZYek9HSzJOMTRB?=
 =?utf-8?B?SGtrZkpUNXdTOU14N0NaaHJtWjB1Smh4QlJXd2xkcFJCTlAwc3ZTNzBxWUYy?=
 =?utf-8?B?S1gzS25CdXZhQmJtbTJJQ3V6R1hmWHdRV0dUbkhtWjB3RnpGYXoyZzhjaTEz?=
 =?utf-8?B?S1lWY0g3VlAvYzdsSk8zQTFNRWpaU3dpMWJTWm1jblZsN0x3UGdTSUVDVW80?=
 =?utf-8?B?MVNRU2pCR2NEQ1JreGdxQ0JsTGh0WXFTVktWZHJleUhEUEkvdk9DTS9BKzdG?=
 =?utf-8?B?eXZKZnhBbjl1WjBNRUdWN1ZSVS9MRlZxQVpBTFhlNXREQ3FvSzZaWW5zNVVm?=
 =?utf-8?B?TXgyVFhJVU9IZ0I5TjZpcjV1TW5GRTN6cXFlTCtEbUI3MDdXYmRja29MRUww?=
 =?utf-8?B?TkpZbVFjcnZPd0pqTkRlanYyVnR2ZDlFOVgrSHdUa3ZnRDdISE94c25iY3dx?=
 =?utf-8?B?TVdXSm1NZUhPZFVMVUZUMnlsTjNqSDIyTWc3SDVYK1JUNGFTYzVjeHVrVzF3?=
 =?utf-8?B?THVRcTdyOVVtMzRlMUJQMnZDZmdmWEgxMWZVVEZXYzdtM3lIVTZMSFNyU1lw?=
 =?utf-8?B?WnRFd1B3K3VHd1hhK2JSWWVmdE13PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <653242B37BA05E4D9E4993B86E3E7F13@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c2eea5-40c4-4d85-437b-08d9efbb673a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 13:10:41.6930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9fxuiVsV4zznkOILQOHd3ITvp/z8GE0rZHN09schussZ1XuYfbjG/rl8lSewntYqwWKvFHFsr1tRqWxiqscXT9HT1M9W8C4zQddnV7PiHKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2313
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxMjo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gQ0VUIEluZGlyZWN0
IEJyYW5jaCBUcmFja2luZyBpcyBhIGhhcmR3YXJlIGZlYXR1cmUgZGVzaWduZWQgdG8gcHJvdGVj
dCBhZ2FpbnN0DQo+IGZvcndhcmQtZWRnZSBjb250cm9sIGZsb3cgaGlqYWNraW5nIChDYWxsL0p1
bXAgb3JpZW50ZWQgcHJvZ3JhbW1pbmcpLCBhbmQgaXMgYQ0KPiBjb21wYW5pb24gZmVhdHVyZSB0
byBDRVQgU2hhZG93IFN0YWNrcyBhZGRlZCBpbiBYZW4gNC4xNC4NCj4NCj4gUGF0Y2hlcyAxIHRo
cnUgNSBhcmUgcHJlcmVxdWlzaXRlcy4gIFBhdGNoZXMgNiB0aHJ1IDYwIGFyZSBmYWlybHkgbWVj
aGFuaWNhbA0KPiBhbm5vdGF0aW9ucyBvZiBmdW5jdGlvbiBwb2ludGVyIHRhcmdldHMuICBQYXRj
aGVzIDYxIHRocnUgNzAgYXJlIHRoZSBmaW5hbA0KPiBlbmFibGVtZW50IG9mIENFVC1JQlQuDQo+
DQo+IFRoaXMgc2VyaWVzIGZ1bmN0aW9ucyBjb3JyZWN0bHkgd2l0aCBHQ0MgOSBhbmQgbGF0ZXIs
IGFsdGhvdWdoIGFuIGV4cGVyaW1lbnRhbA0KPiBHQ0MgcGF0Y2ggaXMgcmVxdWlyZWQgdG8gZ2V0
IG1vcmUgaGVscGZ1bCB0eXBlY2hlY2tpbmcgYXQgYnVpbGQgdGltZS4NCj4NCj4gVGVzdGVkIG9u
IGEgVGlnZXJMYWtlIE5VQy4NCj4NCj4gQ0kgcGlwZWxpbmVzOg0KPiAgIGh0dHBzOi8vZ2l0bGFi
LmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYW5keWhocC94ZW4vLS9waXBlbGluZXMvNDcwNDUzNjUy
DQo+ICAgaHR0cHM6Ly9jaXJydXMtY2kuY29tL2J1aWxkLzQ5NjIzMDgzNjIzMzgzMDQNCj4NCj4g
TWFqb3IgY2hhbmdlcyBmcm9tIHYxOg0KPiAgKiBCb2lsZXJwbGF0ZSBmb3IgbWVjaGFuaWNhbCBj
b21taXRzDQo+ICAqIFVFRkkgcnVudGltZSBzZXJ2aWNlcyB1bmNvbmRpdGlvbmFsbHkgZGlzYWJs
ZSBJQlQNCj4gICogQ29tcHJlaGVuc2l2ZSBidWlsZCB0aW1lIGNoZWNrIGZvciBlbWJlZGRlZCBl
bmRicidzDQoNClRoZXJlJ3Mgb25lIHRoaW5nIEkgY29uc2lkZXJlZCwgYW5kIHdhbnRlZCB0byBk
aXNjdXNzLg0KDQpJJ20gdGVtcHRlZCB0byByZW5hbWUgY2ZfY2hlY2sgdG8gY2ZpIGZvciB0aGUg
ZnVuY3Rpb24gYW5ub3RhdGlvbiwgYXMNCml0J3Mgc2hvcnRlciB3aXRob3V0IHJlZHVjaW5nIGNs
YXJpdHkuDQoNCkNoYW5naW5nIG5vdyAoaS5lLiBiZWZvcmUgSSBjb21taXQpIGlzIGVhc3kuwqAg
T25jZSBjb21taXR0ZWQsIGNoYW5naW5nDQppcyBmYXIgaGFyZGVyLg0KDQp+QW5kcmV3DQo=

