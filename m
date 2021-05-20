Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C624D38A138
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 11:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130819.244841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljexp-0007Wd-8T; Thu, 20 May 2021 09:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130819.244841; Thu, 20 May 2021 09:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljexp-0007TM-4W; Thu, 20 May 2021 09:27:33 +0000
Received: by outflank-mailman (input) for mailman id 130819;
 Thu, 20 May 2021 09:27:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V2Ic=KP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ljexm-0007S8-Jx
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 09:27:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a450d468-e2e4-435a-8911-55d764a6b7c5;
 Thu, 20 May 2021 09:27:29 +0000 (UTC)
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
X-Inumbo-ID: a450d468-e2e4-435a-8911-55d764a6b7c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621502849;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ymDKjaKBVx1WNdaDd2C7ms6i7omM7h+sumnYI/XkCZA=;
  b=NoRq0wetx7MGUJ1m9MKzXyn/SdBDuDYieJOxa16MwAsQV9JoTYKe1azn
   XDgwVLUEvpd25KxQKPSeIDqxSt5YpX3qz8pywO0E6I59eGhC2ZE7NGqcz
   AsTDW9ueEvRi+kbcReao4NnFAeCWvguC36eH7aSE+O6m0YRQdXuVODm3e
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mxztB3+pPQnrO44ZqoGdyyUUhbSuRrkfWUbykDVK9cvROWASrtHN5IG0RcEBDSiM24Xa/vNrd6
 bKii+CB/03qcSIgc/dwjf1B+xj+9rnfEbQLGjIdLvJMlwGLRzLQnzh/3hS4nJ2GFKXAMAZOAkZ
 OlbNzxWv75vJ+FW8y8Py+DxKXdsPwMb+PLbEy+Eh4S3T/VV8hRcNgQQEeIgUXSFtkbWyzfmD2C
 n6QX3R7qKKqrShS4YJ5LmlB/loJnW3KNOmRDip8VevnEW7GTXpP43zEAHtJBHVCj1Ll/f3rNHz
 5oY=
X-SBRS: 5.1
X-MesageID: 44596987
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:54Txo6AzJf+behVW/zTjw5YqxClBgxIJ4kV8jS/XYbTApG8i1DEGy
 mQWCjrTbqzcajbzetp2YIq18B4D6JeEzIQxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaH4EjratANlFEkvU2ybuOU5NXsZ2YhH2eIdA970Ug6w7Ng09Y26TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh15
 41mpMCaCj0FZKr2xeZFYTNUL3txaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM0DF3bveLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcEgGph2JEeQp4yY
 eIHUz9GUD3CTCZMEWtLM6NnoteXoX/wJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSFo
 mPL+UzpDxdcM8aQoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLV/ASxFmUCViRGatEtqIkxXzNC6
 7OSt4q3X3o16uTTEC/NsO3Nxd+vBcQLBWstPQQVESFG2fW5p7tujEr9ZNpfSqHg27UZBgrML
 yC2QDkW3utJ1JRahvTjoDgrkBr2+MGRE1ddChH/GzL9t1koPOZJcqT1sQCz0BpWEGqOorBtV
 lAqnNKCpMQHEJ2AjiCEROhl8FqBvK3eaWO0bbKCBfAcG9WRF5yLJto4DNJWfh0B3iM4ldjBO
 h67hO+pzMUPVEZGlIcuC25LNyjP8UQHPYi9Ps04k/IXPckrHON51HgxNSZ8IFwBYGBzyPpia
 P93gO6HDGoACLQP8dZFb7xEjNcWKtQF7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WuM3GLrtZLdQ5iwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:Ekzdz6AUeDs2vc3lHeissceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QApSWaueAdGSS5PySiGLTc6dCsaq6GeKT9J/jJh9WPH9XgspbnmFE42igYylLrF4sP+tHKH
 PQ3LsLm9LOEk5nIviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIP/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfnWG1YYczAgNkJmpDs1L5z++
 O85ivIfv4DpE85R1vF4ScEgGLboXITAxaI8y7pvZPhyfaJDA7SRfAxwr6w33Pimj0dVepHod
 d2NlSixtNq5CP77VbADufzJmVXf2qP0DEfeL0o/jZiubV3Us4mkWVJxjIoLH5HJlO91Lwa
X-IronPort-AV: E=Sophos;i="5.82,313,1613451600"; 
   d="scan'208";a="44596987"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SS/IO9rv6Rkxsr4jZZFpuqlMTDL+W09+O4btq7MoBBj7qyUvhkDV4lHsgxASTw5ZcudX84+Eesu2ztFS1N25kk4PeQrWIDK8ZZZ8+TuVOoNLTMq1LP0B14ysFtSllsZcKHUpVVqMOxp5q8DtRVtAm9qlp85Yt9DkU/dFgURXZXx63pm6pW7mdXOnnRYn+eIT/babiKdUHyk7zvjimzlDqqR8CBtsPfscoZu+B6RNUF2MD0yhTW4JSYdI6LAiWYOMEIPBL48x6fmtaTw06YmYTPI7Y0Rp0zNanjMXPepipaD3QgGXbMSQTZygxQGfQc6IfAShKtIvXwnCu5qFNpuqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkhkwhZQvzRV/SfNdKFoIZrmzPlqYdtF2VoACyZP/Dc=;
 b=TTVrkU06ei99FcwK/k2JPm+6mms98CLZtff9DD4ip8P25ewzb+fRWBRLGW9Ep1lBFXUr1vFybcDUdl7o/KwGR25ddbVuLvtvuP8MYUbCcmgaAD3F0oNWntw/o6lo2tbECaId+ExKaeogLuC/YZgPCH+Wa+Qys/Bg/fgGbfS22YV66PRArqv6w8SFiRHvTCKBsxgCCB7vetW012KsvKOttGwFKLPN78TgtQHOSKH+NyYR5rF7F/gpp2ggu9IcNW5XZR7LNOIF5nUY5OiGHQ6kojrqsrTyE7oWsyKQBrVMDuZdgGVSYADuD0s/0Dug1ycETSWq1Ze+wQKg02j3vbh/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkhkwhZQvzRV/SfNdKFoIZrmzPlqYdtF2VoACyZP/Dc=;
 b=qduoGhde+uSlVqahcK5zsrbpwCVnCyH6ybyebFk/8vZLiJD1xWL7Ss83uHHDUztJ37XOdNJ98St/kS9+3HdBcIlE2/1rHMsNyEfsbzjcv/46Ee1n/Ji7ypstRKO4hfobXbbHJhMWefje6wyA6D59yvL7Wb/diT65pogVzoN5fxo=
Date: Thu, 20 May 2021 11:27:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2] libelf: improve PVH elfnote parsing
Message-ID: <YKYreLP8N16vcIVB@Air-de-Roger>
References: <20210518144741.44395-1-roger.pau@citrix.com>
 <c645b764-00fe-2b90-3b31-7f2bb6f07c02@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c645b764-00fe-2b90-3b31-7f2bb6f07c02@suse.com>
X-ClientProxiedBy: MRXP264CA0048.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1f70597-df8c-448c-8c69-08d91b717ace
X-MS-TrafficTypeDiagnostic: DS7PR03MB5607:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB56070FB917815CA7A94E9C5F8F2A9@DS7PR03MB5607.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CMPXtcRVILMkhWFRxlTm0cKLQfI+DxVfT1Fe+yj7FRMgDj1UzyuKWQ9buDFXAAolob6uoZL6DwoATplXAM6xbPh40BXALC6XS4iM72RaczfH/Ma3kCKk5KOOHn7/5wG5aiIpdqcHh9RpN8S5b/Cbwye8vpuYFsU5B4FSgk48GuBz/KvI6vu3SB0mFmZld5uU6OihvAc1JUzqSxC5/ySdYpHvs+NaT0P2grC4F9j2UghdFOfnb63mE/TJREDIlWoFmN7YJG/E8r6GIlXezATAFchP8sAZq8+36l0QGeGcHwTwMiL5Z09BLpaajSbHnTxbEoAYaHGDiY1XXSytzrjWb0lAIZxt3fJi/cvSY4UrWsMQJg1PnexyQNd3bexzIzWAu0aexlqLff5G+N6Nz+37ZRFofekGRIEPB9+EyfotutnrAEJP8IeWlo+Zr9jrnuoeh2IosUaiBbXSu5AQgz3Ab1yC84KcjHprzAKrXOfmGGUHapEjmwkY6lgurILo0AMg7ScsFLeFK5dejBxMLO/AgBT2YxXjbdEsAoDpGBUYATdqnaCs3vOgZpk9Fl9qox2ohusXKF+XANcxwLCv38DT7c5h5Pe/AIHLvcLmM/qOpTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(376002)(396003)(366004)(39850400004)(4326008)(9686003)(66476007)(478600001)(85182001)(5660300002)(66946007)(186003)(66556008)(16526019)(2906002)(956004)(6666004)(38100700002)(86362001)(83380400001)(6496006)(8676002)(54906003)(6916009)(8936002)(26005)(6486002)(316002)(33716001)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QWJnaFAyaVIzV0FBTlZxbUR4emRoVGxtTUUzcnBQR1BGZlFBTFFmSWZjOENt?=
 =?utf-8?B?NVhSOGw0STV5ZlVhSFhYZjg2Vlo5OEE2MWdPUDY5M055S3FWNzZrdFVHOFZD?=
 =?utf-8?B?UU1jMGVhMjFUTHFidmhBTDU0bFV1R0lzOXFIeWhOUmY3V0RneXRDeUhyNnAw?=
 =?utf-8?B?TGdmL3NDbHJSc3oxVFl4VC9GMWV5ZFFQYlhLa1FheGhvTU9LVjYvbEdxWm5F?=
 =?utf-8?B?aHpHU0VyengzMis2VWVnQzhkcnRjNUtvc1hhcU51TXVuQWZNMDA3MFJUWDdh?=
 =?utf-8?B?b09sdTlIY3ZydFVlNEFyeGY1Z09uL0tHUHpmRVZXRDNqM3lMcWN1SjVJNUxq?=
 =?utf-8?B?c1lPUmZBSGYrT0ExcGxnRHcvTmcvSTdyMFJVMk8wcFpNaU81aFZUUG9hVlE0?=
 =?utf-8?B?SUtZdENMN1J3bEtza0NRK3JnVCt6WSszSFp0K2g1VDVGS3JtUHhoVXhJWFZq?=
 =?utf-8?B?cHFtYUE2M3NtRnd3dXRMdXhVN2oydVBtUUJQNEVqeDVYUHVqejlKMHplR0ZV?=
 =?utf-8?B?dkhTVStGYXVhbXlDUU9kaFpLRnMzUmVLbDJuV2xVSDI4bnU2TU5XNUdZd1Zm?=
 =?utf-8?B?SDRPN1d3ZlVUZXl3aFpzSU0xcW1kZ1Z3S29TMDF1djFNMVV1MmxRa3RUcHNY?=
 =?utf-8?B?N0dIRHByUXNqWTBXZVdUSHBZY1R4djFoa2NTUDhkSXhFdmorRGh0R01keVY2?=
 =?utf-8?B?WjZEVGFnTFN6OHdxaVdhTmNneWVFSVBNcStka1dCL2xBMmNGZDdXV01QcEJn?=
 =?utf-8?B?MjlnYytCTEErb3VuYnpvR3pVSlJBS3k3c2J4WENLN2dDRTdRSXhJNm90OHFF?=
 =?utf-8?B?UzlCZ0NiVTNhVkpKNXhQajVBU013U2JON2s2eVRzZ3gxRUJSZHB1OHhiZ3Bp?=
 =?utf-8?B?amg4em9pamRFNHg0TjNzbW05blpRdjJvSDR4cGpjajl4ZDZuempJbnVqU2xz?=
 =?utf-8?B?ajZybTNyWTNnc0lvbHZVWURhRVdzTHVkTzB1R3VHdlM2T0hzVGJLSVVJTHhL?=
 =?utf-8?B?T0VjS0w4ODhxQmZKOVUxVjIwMkVleWdxcGNPQlVXY3orUmVQb0dSWEJ4NWIw?=
 =?utf-8?B?RW9oTjZkVTBKMks2SWZxRTJ1T2I1a2oyY3JxZTQ3WmIrQVhLSkNmQUtXV2xo?=
 =?utf-8?B?ak9ka1NDV2pKcmt1WEJsZmQ5REhYeTVtM0RHSnZQK1dzZHNLbHFnNzFidGVV?=
 =?utf-8?B?Rmg5VXJWekw2bDBkYTczYnRKb0RlbjhSTnJCNk1FNXQybTlTOHluR1ExVklU?=
 =?utf-8?B?TWJSaGlzcktzNkZ2ZDE2T2U0Vzd0QU56Q0ZVYkRrNlBrRzU1QTJDTkk4N2or?=
 =?utf-8?B?SXJITXlPdC9Sb3lmZDd1cmdjd1hjOERDdDgyMnkwVUxtZHNzaHpGSXBiSEdk?=
 =?utf-8?B?bFR4dExtamhmaTZvM3EzV0cyQmxvOVlSVGV4KzlBb2kzbnRQYVBONUE3d3pt?=
 =?utf-8?B?K3dTalZtUW43Zks4TVErUGVyaURFRUprNmhnNys0a1BQZkRJQlhWNnF6RjFu?=
 =?utf-8?B?clJXQTVXMUNFUWEwbjA1NWE3Z1cwR1cxSm5tdFYwTFhrSU1CT3k5WmlpdVNk?=
 =?utf-8?B?OGwxT01xTzNEdHJNMldsUVAvYlRJTTYwcThaNDRTencwM1Q0amRxVnJESkVv?=
 =?utf-8?B?eW01bkZUNGhmUDA2Zko5MWlHNHZIOU5aenIxYzBITzgwNldobVd1YitPa0dJ?=
 =?utf-8?B?ZzgrL2dWSXpHdnowM3Zlck51ZDlCTmlEZ0t5clJuSTZEbmlLOERTYUlYTmlh?=
 =?utf-8?Q?bV9ar8RmaBoBJSbloE26Qg25SkZFR+DA32e1Orf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f70597-df8c-448c-8c69-08d91b717ace
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 09:27:25.7636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+l5OnW6HY69yTxh0kY5gj87s679xmvqn62pDuMb+Rr1mt17DhApmF6/89CFwuKp2S8HpImst3fK2bWjHBadiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5607
X-OriginatorOrg: citrix.com

On Wed, May 19, 2021 at 12:34:19PM +0200, Jan Beulich wrote:
> On 18.05.2021 16:47, Roger Pau Monne wrote:
> > @@ -425,8 +425,11 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
> >          return -1;
> >      }
> >  
> > -    /* Initial guess for virt_base is 0 if it is not explicitly defined. */
> > -    if ( parms->virt_base == UNSET_ADDR )
> > +    /*
> > +     * Initial guess for virt_base is 0 if it is not explicitly defined in the
> > +     * PV case. For PVH virt_base is forced to 0 because paging is disabled.
> > +     */
> > +    if ( parms->virt_base == UNSET_ADDR || hvm )
> >      {
> >          parms->virt_base = 0;
> >          elf_msg(elf, "ELF: VIRT_BASE unset, using %#" PRIx64 "\n",
> 
> This message is wrong now if hvm is true but parms->virt_base != UNSET_ADDR.
> Best perhaps is to avoid emitting the message altogether when hvm is true.
> (Since you'll be touching it anyway, perhaps a good opportunity to do away
> with passing parms->virt_base to elf_msg(), and instead simply use a literal
> zero.)
> 
> > @@ -441,8 +444,10 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
> >       *
> >       * If we are using the modern ELF notes interface then the default
> >       * is 0.
> > +     *
> > +     * For PVH this is forced to 0, as it's already a legacy option for PV.
> >       */
> > -    if ( parms->elf_paddr_offset == UNSET_ADDR )
> > +    if ( parms->elf_paddr_offset == UNSET_ADDR || hvm )
> >      {
> >          if ( parms->elf_note_start )
> 
> Don't you want "|| hvm" here as well, or alternatively suppress the
> fallback to the __xen_guest section in the PVH case (near the end of
> elf_xen_parse())?

The legacy __xen_guest section doesn't support PHYS32_ENTRY, so yes,
that part could be completely skipped when called from an HVM
container.

I think I will fix that in another patch though if you are OK, as
it's not strictly related to the calculation fixes done here.

Thanks, Roger.

