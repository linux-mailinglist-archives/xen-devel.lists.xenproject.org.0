Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB10365D2B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 18:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113926.217049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYt79-0007ja-35; Tue, 20 Apr 2021 16:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113926.217049; Tue, 20 Apr 2021 16:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYt78-0007jB-WB; Tue, 20 Apr 2021 16:20:38 +0000
Received: by outflank-mailman (input) for mailman id 113926;
 Tue, 20 Apr 2021 16:20:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYt76-0007j1-LB
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 16:20:36 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb7eeff7-746a-401a-adcf-675e8b15ee76;
 Tue, 20 Apr 2021 16:20:35 +0000 (UTC)
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
X-Inumbo-ID: bb7eeff7-746a-401a-adcf-675e8b15ee76
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618935635;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gFBNJM5fd+n+HOGxtY0YJLgtc5DvedFRvX3RqvgMWeM=;
  b=XNnnwyr9MPaWsk7HobMnIq2OucPwpKWwUlOyhhiijSjl+krVvPSIgFzy
   AQGtklii3u+RfrQ+2y2UXfm07qfPmKHd52IvwajPR7vkOGwYLQbEIIZ/R
   v8OcOjejEhVS1B3K8S0qaEY7K+JjLR7+tBQRQOaFlAN2BNCUl+v1MuEDw
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YBtJB7CD9b9hU6cOqjo5Mn4jqLDWhksxSfJuBmj4qFXKgTQsFxe++7JcfFCpPNU7ReZtcN0vx4
 dKqPFaw9+LQkwoftMKJhw3A0AstTg29Hx9ttfUOV+5Xi+Zrnjcm0ktia0Dj0sQNvXxEl9+8tmI
 dpJ/LDFs1yJi/x6MuZeKYM5QdtATsa+Lq/FJZL1gr9X8wJLCiuHWGoKUfC95m1SWWDq6MviDV6
 irJA8Y6Zn7+gJrLZeBPdz8yDOZuQ1V/E1aRL8Vbgn/ThrxCqkpVDP+M5AQC8AXwGwPuTi5vJhp
 +nw=
X-SBRS: 5.2
X-MesageID: 41997929
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
 4QozDxwIlEyLtd0X1kZA==
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41997929"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzB272LokCoySgp+t5CJgtg8pWmgSFRi8h/NKbEO/nvT7vYSl7FMgOs5XX/ctkMhJavzh3hQyPv2VQ95x8fuHfxUuXLocZkR+9dnhA9TzlEZrfSdAYLa28RuOFNK1Za42ybpZvX50NtwKU99k2qUFRJLOge9KJuOkRySZkfZ3WZ3ueDBx+mCP1cv2/Xz9Dw3B9CrutWj+2xhjpg3HaCog/pxKlJz0VmcrYSEBtarlEVvTVIR4F38BN6iQX8ikp7yH5pHknnp8/RKXpwor5N+TwkdNZFEZGOSOdySADo9ZpTZcpDeA5k/NADe+ep0dygTxhTlmj+1uZU/vH8+bAAFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTNew35HM0SBbU/IeSL5QNmXpeBjH9cogBjo6SbWW0I=;
 b=RSaR26sQkJ8XeOzGfr1nhPRBf9Nsciv0dIPW+qYjUUHgoJMnHAPhme38WkgPFXMoNGtsxbXByb3jJAJazfLApeFOStp06tiHH4V82gxTtzu3sX9WTcN0I/07UiPbSTHGZ1NCuwGXFNGvSv3i2zfKPHZm0uf6uwiYif0Xvt1pcVbz0tfkU6+TOHtrXDzlz7ohIcsSTHPbMILzeLQi3u991pOz90nE8DZ4m4uJvuf9K68/gbfHzqis3snn0y+1OAvxyCSatiehSSaNxq8rRkAF8YJ2X6NKbpChe/DMzAeNXpq2PlcO0ULZXfwhkseBGHoW/h7VnJA70b4T679Xsrn4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTNew35HM0SBbU/IeSL5QNmXpeBjH9cogBjo6SbWW0I=;
 b=FCBJT6iBRnnuRdeyobCtwapdHN2ap1t8ICleiqvGda1Sp7rrM8pfMt7SunL0xq1mwWze5bf0RfjJ1W1jSmEGVO9oFirP8fhSnlUKilLrf+GbWhFb+dcJSrCkXc3wfhhTOxsl+D7jO4sQOtGmCZdC526f/75bTF9xsj5ZOLZzGKI=
Date: Tue, 20 Apr 2021 18:20:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] build: centralize / unify asm-offsets generation
Message-ID: <YH7/SvkrB2yGgRij@Air-de-Roger>
References: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
 <YH7zXpPz03+kLzEr@Air-de-Roger>
 <e9de883b-604b-1193-b748-5a59795a9f31@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9de883b-604b-1193-b748-5a59795a9f31@suse.com>
X-ClientProxiedBy: MR2P264CA0051.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4da7653-b427-42a2-e995-08d90418387c
X-MS-TrafficTypeDiagnostic: DS7PR03MB5607:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5607C9BDD69A6D95A2C6DBF38F489@DS7PR03MB5607.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YPSZkgDO7L8aFzFSk9hvOt4MFWLkCd8ZYZ4YxV3VZeo/bmk9s/3Xwxm1nfzbe24Ro4mcLchRLUcCIpe8Wi+anSJlWNorVivc+5dWNsFCGf/yqGJZiLrtYpwm0cRXN1w75KjjiYQ3d0dpVKwICQ9+BcUB781kwGFijngCX//u3ctThnCJUVBPyGzAHncas9CAMwCoZu0O96pEddaSUTDCpGOdpv21abYVwTrRjD3obHkDN7AnUMUhOOfKBAdeeLnrI8fEtSg9sX9JlFm056/BTJbfmiBFsJJ6SzE3UGQO4lOQESRrYFGGN+1bAJ4k/aN6/YLxe+7rpQG/g4yYQV6ujQDxQOPWfk0uQqn5J1tJEO+asb7x9/lohbycegrVV5YQHtRApTgYP5CAoOu2riGt7JCKgv8Mic+EZpeRZ1lhPLIK5c4crOUj+x+brz0977aaj5tqQ4/tyFYJefTfhKPLoPBwd6Bjjq7rAvsCKxQa9kQb0D0yjY/L59TuB/oFQkkx4YpO8U0tEy5lgcS+B5cSE2nOalUMTALfhAp1lGUFuCbNz7MfeDatWALydWRuuyjHLEQAa85Co0Qc+Zq8dJMXy+4qkTgicd96Unp2YTscZ18=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(5660300002)(38100700002)(6486002)(6666004)(33716001)(16526019)(6496006)(85182001)(9686003)(66476007)(86362001)(2906002)(956004)(8936002)(26005)(6916009)(66556008)(54906003)(66946007)(316002)(83380400001)(186003)(8676002)(478600001)(53546011)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NERyMG5aT2ZUOXhzRER2dGNiS3ZRa2N3NktpWnBGZk9aVXBxTmlyUjNBaWFj?=
 =?utf-8?B?THBjdVFnbjJtTDVOU3pTWUxOQjRtQ1RTQ2FFZ2ZSWG1YZys4Z3lZTjZ4eFdn?=
 =?utf-8?B?d2FUemhEaFR6OE5xRm1pdkorS3RNeFUyMGJ2cVR4MzU5Rmk1b09QWkpHTnJ5?=
 =?utf-8?B?bFlYZjJHTldRVHFDMDJoQ003cjZJdUNWcGx2S2orc1VMbGUxSm9VdVZvUTkr?=
 =?utf-8?B?V2Z5dURTU2hTczllbzVHQzN6ckdMTEhueUtIZUdRdnZtcXd5Q085NlNYRktq?=
 =?utf-8?B?b21VQ3c5SmhNMWJ2bDdNMGUvSVh5ck0vZXU5VGZrSXZNbEpMVW04dERXOGcx?=
 =?utf-8?B?RnNqT0FWYjNnM1pvaklRVGhtcXFWcGtqa1NyMzJvNy9Vd0YyeGRvK0J0Y2JI?=
 =?utf-8?B?Z2JNQnV4b0Z4VTNscEtPSnNRbGtwQis2eCt1bXVMTnhGdU9HREtPZzYycWtK?=
 =?utf-8?B?eEhPa3NadTFEUEs5NzFwWktTOHlrcXVydTR2TlJxcmV3QUxTMnYzRDRleW9y?=
 =?utf-8?B?bXZJT1RUSWljYnBtd3RSeTFic2tha3BCNS9DblpWU2Y2dEhxOVlrZU0zamxT?=
 =?utf-8?B?b2wydURNZDAxbi9HRWYvR2RqcVB5NGxkMCtrKzlKSFZ6UkpHNjJXbFFGcThB?=
 =?utf-8?B?Y1R1WVU1VldBSUtCdmxFUjBSN0VKV0pNbDlvamhhdFFSd3NDdE11cEVwZVJ2?=
 =?utf-8?B?NnlZakRlcFZvWkR2UkJUSnhTRmlzZEo4S2VuamFhOWtWSWdBWTJkOEwrc0lW?=
 =?utf-8?B?Q3FHRkVxMENjWnB2UWMvWXlSWmlId1h2L1VDVnRJMWpKY2dMNU11YTA5MUdN?=
 =?utf-8?B?TzR5dWtKamtZb2xSYW5INXBLdDlGdjRvaVpMMWNZam1zT1BtU0xkYUVkeHl3?=
 =?utf-8?B?QXN3TTJTVURUL2xLVDdIMDhDSTNEUmI2bVU5bXdNU0kxQmlXWCswMzczVXpq?=
 =?utf-8?B?YkE1ZHFJdDV6bkcraGpyaThEbVpYUzhXUXBmV2lLVXpuRW1BOGxyMUlGMHNv?=
 =?utf-8?B?eVFMMTRnbFZXbXFTOEVqckRBeWNpQWpiaVdFazNrdGlieHFVdU9pYkwyY1o4?=
 =?utf-8?B?eTFXOEx3c2VaUFErVDVucDlBUHFpOVQvMXh0TXQ4UHBLSk5VTEtKTEptRUIz?=
 =?utf-8?B?NXR2WTN0OXR0eVhlaUdRci92eXhLSVh6Y1A4QWM3c09BMHNKQTR0ZktnZnQ1?=
 =?utf-8?B?NGx3cVpoOGE1MlJLYmwrNVpGaUNUWlpBa0Mvbk9GaHdENGdZdXg4NzRjb2o1?=
 =?utf-8?B?b0RCVUY3TjA1VmIrZG5LdmRyM1ZueG9pTUVjQnl6Q2t2OWY0cXRFUENvK1kz?=
 =?utf-8?B?MS9IdlV1V2pBYmF0NkNnMjNyTXVmRXRoU0duZHNGTDNNOXludk1JTHBoTXhB?=
 =?utf-8?B?d2NFK1l0QmJkT20vYlYyY1ZlUmlwL25lKzcwaisxZW9vb0VOelFOVTFNSmE1?=
 =?utf-8?B?YXg0T3hQNmxMSGVRVC8zeU5pNUg5VkRVeFAxSzVCcjg0TndVZFY4Ti9zdUlv?=
 =?utf-8?B?ME1lc09KUmJtSVBRT3BGaW5RWjFZUjJmS1FCWmN0S2lOSnNOVDAxQjl5b1Ex?=
 =?utf-8?B?UDhVZTV2dEd3YnpIYU1leUFoS0x0MFZNUEJpQ21uQ0JBWitWUlF6ZTZQUm5N?=
 =?utf-8?B?Skxvd3Nrc3ZWdW10ay9iOUFCc2hjZjRJaGhkYStJbjVjTVg2dXdhMEFkckZ5?=
 =?utf-8?B?eGh3bTZaUitISnE4LzJZWnAvemxGMFlZcndObTBJaDhwcmF4YU0zN2FaTUZt?=
 =?utf-8?Q?cIISoXPqrCsxiDlRcliE42r7Ka9R8Ytp8z+iDqJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4da7653-b427-42a2-e995-08d90418387c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 16:20:32.5103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+3U/Wmtz1J1IAv26OTbYpiXWnV7ccZ4bSfPAkDUwZwaxl2Wpswox+YdRHRT8v4rivhGa/3DcKYYZFgDNqTWCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5607
X-OriginatorOrg: citrix.com

On Tue, Apr 20, 2021 at 05:47:49PM +0200, Jan Beulich wrote:
> On 20.04.2021 17:29, Roger Pau Monné wrote:
> > On Thu, Apr 01, 2021 at 10:33:47AM +0200, Jan Beulich wrote:
> >> @@ -399,7 +399,11 @@ include/xen/compile.h: include/xen/compi
> >>  	@sed -rf tools/process-banner.sed < .banner >> $@.new
> >>  	@mv -f $@.new $@
> >>  
> >> -include/asm-$(TARGET_ARCH)/asm-offsets.h: arch/$(TARGET_ARCH)/asm-offsets.s
> >> +asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
> >> +	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
> >> +	$(call move-if-changed,$@.new,$@)
> > 
> > Won't it be more natural to keep the .s file in arch/$(TARGET_ARCH)?
> 
> Yes and no: Yes as far as the actual file location is concerned.
> No when considering where it gets generated: I generally consider
> it risky to generate files outside of the directory where make
> currently runs. There may be good reasons for certain exceptions,
> but personally I don't see this case as good enough a reason.
> 
> Somewhat related - if doing as you suggest, which Makefile's
> clean: rule should clean up that file in your opinion?

The clean rule should be in the makefile where it's generated IMO,
same as asm-offsets.h clean rule currently in xen/Makefile.

> Nevertheless, if there's general agreement that keeping the file
> there is better, I'd make the change and simply ignore my unhappy
> feelings about it.

I don't have a strong opinion, it just feels weird to have this IMO
stray asm-offsets.s outside of it's arch directory, taking into
account that we have asm-offsets.h generated from xen/Makefile into an
arch specific directory already as a precedent in that makefile.

Thanks, Roger.

