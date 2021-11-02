Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEB2442D2A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 12:50:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220146.381300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhsJ5-0006Wz-Nk; Tue, 02 Nov 2021 11:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220146.381300; Tue, 02 Nov 2021 11:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhsJ5-0006U2-Jk; Tue, 02 Nov 2021 11:50:23 +0000
Received: by outflank-mailman (input) for mailman id 220146;
 Tue, 02 Nov 2021 11:50:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XxgO=PV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mhsJ3-0006Tw-Kc
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 11:50:21 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0de5522d-3bd3-11ec-8556-12813bfff9fa;
 Tue, 02 Nov 2021 11:50:20 +0000 (UTC)
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
X-Inumbo-ID: 0de5522d-3bd3-11ec-8556-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635853820;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qQw/gpZoEhKpydfP8VdBNj1Lmx+vinRGD7any+m+QLI=;
  b=Q1KmWv2SPaFuPDcEsaDM8N7ThORFTpcIG0eAJU+up4jQn9ETV+Tuw6Fi
   S+F2Ol/H5hiXvI75sJvxjrz1f+pPnwZebB2yx4GJHAwIuEhHvvRexmSHn
   LhztbGJT3aS1/fLsit9zrFoeeTyvV5m5mIewSIEjyVAsOYqB2a85Zdv4f
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tSdULL7iwhlcvra0Fz8xJiRtt0shpsc0Dm5Drqk52qrYwMgO+DYIVJ6d+QWnQxr7AllWsO8pUL
 ZXRdbRsgabJGEM6U296aL3i70Si8u4wRRuN5E8dmkf8Ke8YmQEGQgg3U16wY4ettZmvXdxRBj5
 /1ey3IMOn6lCb2zSpNnOLcoT+7+P7sNaNhhjk4apwZrGZVIwoh1Jd4vasr5zKmz5SzNg3kJ82m
 IqefYaiEIULPjFci7w9PQYfmZPixZk2kWhOhTwrn04rtg3rEI3quVs/utcegdDE+Q0MDFRDI79
 gWJKdWuq6l5LwZqLj98E+jdP
X-SBRS: 5.1
X-MesageID: 57260034
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+0d6matEHjFWxT/O5eqbsqxjZefnVJdYMUV32f8akzHdYApBsoF/q
 tZmKTyPaPvZYDP1f9t/b4W0oUhUup7QzoQxGQs6+yhkRXwa+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2YLhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl5LatVVgrJf3wk9sWSBV/VDBmEqsB5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY258UQ66GP
 JZxhTxHPT+bOkZ2JUstUcgbpb643Fz5XzwIpwfAzUYwyzeKl1EguFT3C/LPc9yXQYNOn0CXp
 krP5WG/CRYfXPSVxCCZ6HuqiqnKlDniRYMJPLSi87hhh1j77kUJFBATYn6qrvC4h1CWVspWL
 gof/S9GhaE0+FbxFoGldxK9qX+A+BUbXrJ4Fuwx6AiJjK3O8QudLmEeS3hKb9lOnMgySD8x3
 1mFheTgAzB1raaVQnKQ8LSThT6qMC1TJmgHDQcGUA8E7t/LsIw1yBXVQb5LAKOzy9H4Bzz06
 zSLtzQlwaUei9YR0Ke29kyBhCijzrDLRAMo4gTcXkq+8xh0IoWiYuSA91/f6vpRKZeDeVOIt
 nMEhsu24fgHCNeGkynlaOIJEbKy7vCJKgrAkEVvFJks8Teq03O7dIUW6zZ7TG9yKdoNczLtZ
 E7VuCtS6YVVMX/sarV4C79dEOxzk/KmT468EKmJMJweOfCdaTNr4gk/T1OMgGL2wHQnrqokN
 bDcYN6DCzEFXPEPICWNe88R1roixyYbzGzVRIzmwxnP7YdydEJ5Wp9ebgLQM7lRALes5VyMr
 o0Bb5fiJwB3CbWmOkHqHZgvwUfmxJTRLbT/sIRpe+GKOWKK80lxWqaKkdvNl2GI9pm5d9skH
 FnhCie0K3Kl3BUrzDlmjFg5MdsDur4k9RoG0dQEZwrA5pTaSd/HAF0jX5U2Z6I70+do0OR5S
 fIIE+3ZXK8SFWWdo2tHN8ChxGCHSPhNrVjXV8ZCSGNnF6OMuiSTooO0FucR3HBWZsZIiSfOi
 +L5jV6KKXbybw9jENzXeJqSI6CZ5hAgdBZJdxKQeLF7IRy0mKAzcnCZpqJncqkkdESYrhPHh
 ln+PPvtjbSUy2PD2IKS3v7sQkbAO7YWI3e26EGCtuvrbnaGpjLLLE0peL/gQA0xnVjcoc2KT
 e5U0+v9ILsAmlNLuJB7CLFl0eQ14N6HmlOQ5l0M8KzjYwv5B7V+DGOB2MUT5KRByqUA4Vm9W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3Q2iZTG6R4bdE+y
 uA7tc9ItwHm0kg2MsyLhzx//niXKiBSSL0us5wXWde5igcixlxYT4bbDyv6vMOGZ9lWaxF4K
 T6InqvSwb9bwxOaIXY0EHHM28tbhIgP508WnANTeQzRl4Oc1PEt3RBX/TAmdShvz01Kg7BpJ
 2xmF0xpPqHSrT1ms9dOAjK3EAZbCRzHpkGokwkVlHfURlWDX3DWKDFvIv6E+U0U/j4OfjVf+
 73Emm/pXSyzIZP01yo2H0Vkt+biXZp68QibwJKrGMGMHp8bZzv5g/DxOTpU+kW/Wc5h1lfao
 eRK/fprbfypPCEdlKQ3Fo2G2OlCUxuDPmFDHals8a5h8bswo91uNexi83yMR/4=
IronPort-HdrOrdr: A9a23:Gmg33qPInCH0scBcT13155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY55as854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nI/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Svl
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DPeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6Np+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeTf003MwmM29yUkqp+1WGmLeXLzAO91a9MwY/U/WuontrdCsT9Tpe+CQd9k1wva7VBaM0od
 gsCZ4Y4Y2mePVmG56VNN1xM/dfNVa9NS4kEFjiamgPR5t3cU4klfbMkcIIDaeRCcU18Kc=
X-IronPort-AV: E=Sophos;i="5.87,202,1631592000"; 
   d="scan'208";a="57260034"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCxEhMU5qaI8O7bOlumbD2Oq950TI1W6r8e2CJRUtpV8CDjNS86AIzFli0Ots7FK2CtfV0ClxM22+uof7zxyjHJcbe4v9tgsJxYNqDM3N2SUGdLrHOCIqnlMtQI4M7Md5VDgHnxW8LNl4eFwYY9w9QXsHbfPNc2sN9HCdS9jeeA7i1Sx7CZ6r0VudwrVScXFFgu8rdUQ/mNexj4dB8urjRmlGysaDBvNxBymi7PDLFdOpFPsMGUaKZhFsikUwraTOP44L9FX+zkqQovoE7FLS7NnQP8G3J8PPizYcNKnnMyagUTTAY2JBmWszGcTGvsmjR6dvJgrC+RDrPwYQH65jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+yQ8/y5sayzRStPWYzSe98D7nsZ/KIY5dztZJpKUBk=;
 b=l1erpj3JkzepKWXxc25PIzXuUjLwVkgw82POf+PBCoWariLuUH9eyZfLPNCC5WWylTqMSs5Yd0jjsaGpXJg6AoJ8VNW30FrqnAtlRZhw5MM8KP0OmmUCuPVhKZZCk0s9SekWacxaGPvSO7zHOOu9VJenxEk9ZXQHZhwPWDRZwrWEE2hC/NSPfGSDz21iE0yJCs5o7F+e9aiaAyFOt7YyMjyNP2syTzsI+NgsUywGaUg2pvRdL/Qav3kbn+uRiz0kvapWyNBeaXJRr1LVJFqpeqPSbzm1q7uEBlXaLfuQVUxOygGFbN3GPlxxiJCvti0XeMQiG8Tm9LXXWhslULB5kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+yQ8/y5sayzRStPWYzSe98D7nsZ/KIY5dztZJpKUBk=;
 b=FP7SPRp72J/DsKdv3Rt1vQbCt789szbVPbUnAUaCTMaYrgy/6wAkQ1AuJ0/ni0ZuVVcpHIeztSXVUzigIDNPGvxzKH2Y6U+Q6XWmx+Sr65yIn6WmwNviM0TLLfkllx56duBt68iUakau1MvBk/bYrRNkixy3Egup07Tg6PaMBaI=
Date: Tue, 2 Nov 2021 12:50:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Michal Orzel <michal.orzel@arm.com>,
	Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Message-ID: <YYEl8h+WtSZwNPn7@Air-de-Roger>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
X-ClientProxiedBy: MR1P264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 003c50aa-204d-451c-e963-08d99df6ef04
X-MS-TrafficTypeDiagnostic: DM5PR03MB3065:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3065683B85C55FF940C956508F8B9@DM5PR03MB3065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qawe/tdJuBkOjLhsoM4g8AFrlIU9EoFWiSJXi4VKi+qUIEWj1YHOFDzcQDSKWFHPyK8u47xjWcPDAdX8sjZ0KMWY48/UL3rt0Sp/S1pFWmwKTm0W25smFJmErWDctQTU85XN+lp2h5p2KJgRKwgzNEQEFm1oz3qFE37MKWY0OPqibZDVCkpFeDG7jDvPvKE1SCGy+lGy6UlYdcgMcmmRYsS9OmbOhbw/wBdv7HMytuiYqhgytmTHncbAu/AaqnyA0aeXwY9J5qXECVnZ6WSG+2WnOpyckY3YyABr0N/lSAahyJaks7DnEGTsyXxFCp9GD/5sEOe04gJDElVfyMn6f20h2sKh+bvKXkfa+9jBlqlm+Nx3NIbuw0rQvzNgtwUOfQDDer0ASMQWgf7Ea37bdvKLulrjEDczbV+NuXyhz8Y+MkwpmE0ZURDbKQO5OZJ4/g62t1Estuv0NPZS1B9Y3k4jYbPtzJdJ3xVi6wPdzV82s/M+hLbwkhompz2FDAkmDmt1Uy1UgIR76PFUfr8QT8mVMEno5v/d4HPPgYmeWKIDF+BOUSXOMPUcwE6bIjJnDj3nXHjtPdSEGagU77plE+k2FmyyH7hoIhW9PSc3+Bx8QB/oZ6w4btqehWVO8eiDNp2MRARDRcDZYp48lRdawH9SwMGbp6XCVseRs6mXRU1tUck32sTgC/GCUEyTzolqnUnUBfmpQfxCAqq+F1BRiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66476007)(66556008)(82960400001)(4326008)(9686003)(186003)(508600001)(8676002)(5660300002)(33716001)(6916009)(86362001)(7416002)(316002)(6666004)(53546011)(54906003)(6496006)(83380400001)(38100700002)(66946007)(956004)(2906002)(8936002)(6486002)(26005)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWVqMzUxTitZd2kzSW9lUnp0NnVya1Y5UFVSdWFobTFrREtjTnhlTit5TlpI?=
 =?utf-8?B?aFhGbW9HSzU4d0xFeVp4YWVDZ1hYbHdhTVJhK09YcHFMeFZzeFdDZHZjeWFZ?=
 =?utf-8?B?TE5CNHFxaUF3N1dtVUU3dW5GTE9leHBBSVB5M0F2TkFFOTNQb2xNNHdJUG4y?=
 =?utf-8?B?QS9aZlJFbjYvU0lNRjFISXdXa3cwZ2V5b0ptWERWaUdHYXkycUppLzZUdHRk?=
 =?utf-8?B?aG9IYktMV2k3V2owWDhWNENnMGhnMVRtWmp0NVVMTXYvR053bWZDOStjWW9J?=
 =?utf-8?B?Qm5oQWQ0NUVIYmJPRE9tR3p3UmE5bjFGVVZ3ZGFFRUNtNXlaMzVuWGZnSitz?=
 =?utf-8?B?cC9HTnQvUjVwQTA3RVV3R3Z6b1htcVhBQXdlZVcwWDh5UnJROHdkakdGRTk2?=
 =?utf-8?B?RnF4dXdObjU3bW11M09EVHYzL0lialRBYkR4LzExUEIrV0w0S1JyOXVERTJ6?=
 =?utf-8?B?UUplUU00Sk01T1lsT1VISndHZ2JMK1JQSHc4YmQ2L09kcW5WcFRHWnM5VUxV?=
 =?utf-8?B?Qkl6b3VQYitPcnEzM3NDZFVEbVpDaG14MTVIZTdNRXFIRlM0MHh0dFNYT3JR?=
 =?utf-8?B?THRVQTlEdW5TekN1dW42MlJaU0V3dDk2cmhJVU5TdTNvUVl2ZVhONmY2aVhI?=
 =?utf-8?B?d05KRkloMFQ5M3JmOTRBT2lWT1NBcjRsNktoVytiNytUT0tSVTNBbkVxSko0?=
 =?utf-8?B?SDhuZ29nR0tnWUFhd2NiOFhMRjhVNktSRTBJWXk1V0xlS3pnNldiUldTZHB1?=
 =?utf-8?B?VjFQdCttYkw1c1cyNjFuRGlLVUNsS0QxQks3M3BIRXpqY0thaXd3bTNHR0pB?=
 =?utf-8?B?U0ZDS1hmZVlXNmFBWGNUd01oR3hRNDRhbEwwNFRyOTRubVlEWkd2Q1I5WEp6?=
 =?utf-8?B?RmE3U1lMdkdzR0pLVTFFNWdlQ3V6bG1NK3BUMk04SlVKenVzNXJkVEFWR3gx?=
 =?utf-8?B?MmZ1aXFhU1dDUE16cEtWdHdSNEdHKzlsU0Y0VmNITVB0aUhYbG1ibUJxZ1lx?=
 =?utf-8?B?bXdXbUFyYjQ2Tnh3bDd6L2pCajlYVlk1NkhQMXYxSmxwU3dJNXBsOXJHNVdL?=
 =?utf-8?B?NElvM1BGK2VtSzJ0VkVnV1FwemZhcmRBOGV4VGMzWFR1NytJK3g4VjEwYmxm?=
 =?utf-8?B?OVo5ZWQyWkRLU2tCblZ1S253Z1RwWDJPSDlpcGlZZkFkMk42a2t3bVNBU1Nh?=
 =?utf-8?B?VTE0SmZLcVJvR3VWZTZxTzVDdDQ4YXc3eDdCcHR5RjcwdjFNaTVlNktxZXBo?=
 =?utf-8?B?Q0pZYmJtT1JQb2p2eFZvN0xDakN1UElKMXRkVHUrY053d1RaZEdVSmFsSmtW?=
 =?utf-8?B?UE5ldlNNQXVvQVNOQThEZlFuZ1FOOUxaMVhXb215SjNDclUzZGdkOC9KNDN4?=
 =?utf-8?B?OGR2Tmx2aDZYM1greGcrdzJucW9VdW1EYklVc2E1MlhpelM0WmVDYVh4QWli?=
 =?utf-8?B?ZDlpL0o5Y2h5MHVDRHRwbTl6UjVIa0dPYjl4RDRGemxGT3czNmM5V0FOYVNR?=
 =?utf-8?B?dTBicmJwNlFuM21uOUp5eHhBUHgrMktDa3NGQjFzaDlTSER1OS9yVmFTamdK?=
 =?utf-8?B?V2VLRDFnSEp6YitLN3RNWFA2Y3N1QmI0K3ByMVFkQ3gvbnBVdHhSbUtkVXNu?=
 =?utf-8?B?bTJNYVRObXBuS3J4c1hUVUdWaCsvSGZjWDJiLy9kd0xEc3ZBU2RNVUQwQkh3?=
 =?utf-8?B?bHBJNEZaYTRCb1lkcHNoUnpzZ1dZL2VVWWFyTWdiVmhjRWpkcEVVY1hlYktq?=
 =?utf-8?B?QWhmUE9weUF0MGtSUk5seXNRaC80ZFVBZFpqbEUwKzdERWIxb0FxSXBDNUxx?=
 =?utf-8?B?TGw5SjFHWEJ3bkVxMXhJTzhXUFJwNW5ROE9Vb0hFWkc4R0JEbVNEZWladmEx?=
 =?utf-8?B?VkMyU2VidkM1YjRPd3dobDMwTDFsYlhmUlZIbmJzNmtkbS95UVlxWm0rcFRN?=
 =?utf-8?B?dm9JREI1R3g5RXRDc2UwVFJaT1puWjVsNVpTL2FuQ29nRzg1NkJ6RFg3RUU0?=
 =?utf-8?B?SStmbXBocXVHWmIzWVJUMUhjWXNhQ2pSMVNQelVEZ3RHSXluU29US0V6bHY5?=
 =?utf-8?B?T29QTXBUWkNjSFpTTVpKWVNxTDNBSjcwODNKdUJnNlhEZ2x2TzNidXdaSnRY?=
 =?utf-8?B?amxxYnJUQ1NKWDR2RDB0Y2RJRTZ0N2ZTSzlNOURWTmtlRDlyM3dPaFkvSm4w?=
 =?utf-8?Q?TPkQk+7MPBeOEigTp4EikOc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 003c50aa-204d-451c-e963-08d99df6ef04
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 11:50:14.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3P03ViU/lhzIm9MFKeaNxV2U+7LoS2zQ0+Q/4ojaMZUXd8Ak0y7y3MYZxtpWEGOQ/gZHeCMl5fyeQBjIsHe5fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3065
X-OriginatorOrg: citrix.com

On Tue, Nov 02, 2021 at 12:19:13PM +0100, Jan Beulich wrote:
> On 26.10.2021 12:52, Roger Pau Monné wrote:
> > On Thu, Sep 30, 2021 at 10:52:20AM +0300, Oleksandr Andrushchenko wrote:
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -451,6 +451,32 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
> >>          pci_conf_write16(pdev->sbdf, reg, cmd);
> >>  }
> >>  
> >> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
> >> +                            uint32_t cmd, void *data)
> >> +{
> >> +    /* TODO: Add proper emulation for all bits of the command register. */
> >> +
> >> +    if ( (cmd & PCI_COMMAND_INTX_DISABLE) == 0 )
> >> +    {
> >> +        /*
> >> +         * Guest wants to enable INTx. It can't be enabled if:
> >> +         *  - host has INTx disabled
> >> +         *  - MSI/MSI-X enabled
> >> +         */
> >> +        if ( pdev->vpci->msi->enabled )
> >> +            cmd |= PCI_COMMAND_INTX_DISABLE;
> >> +        else
> >> +        {
> >> +            uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
> >> +
> >> +            if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
> >> +                cmd |= PCI_COMMAND_INTX_DISABLE;
> >> +        }
> > 
> > This last part should be Arm specific. On other architectures we
> > likely want the guest to modify INTx disable in order to select the
> > interrupt delivery mode for the device.
> 
> We cannot allow a guest to clear the bit when it has MSI / MSI-X
> enabled - only one of the three is supposed to be active at a time.
> (IOW similarly we cannot allow a guest to enable MSI / MSI-X when
> the bit is clear.)

Sure, but this code is making the bit sticky, by not allowing
INTX_DISABLE to be cleared once set. We do not want that behavior on
x86, as a guest can decide to use MSI or INTx. The else branch needs
to be Arm only.

Regards, Roger.

