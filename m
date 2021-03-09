Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6DA333164
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 23:13:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95801.180830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJkbn-0005cy-Rf; Tue, 09 Mar 2021 22:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95801.180830; Tue, 09 Mar 2021 22:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJkbn-0005cY-OJ; Tue, 09 Mar 2021 22:13:43 +0000
Received: by outflank-mailman (input) for mailman id 95801;
 Tue, 09 Mar 2021 22:13:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oiBP=IH=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1lJkbm-0005cT-6N
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 22:13:42 +0000
Received: from mout.kundenserver.de (unknown [212.227.17.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b9d4691-b3f3-43f7-8a02-2d64de81927d;
 Tue, 09 Mar 2021 22:13:40 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MaIvT-1lDrLg2j3N-00WEYS; Tue, 09 Mar 2021 23:13:29 +0100
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
X-Inumbo-ID: 8b9d4691-b3f3-43f7-8a02-2d64de81927d
Subject: Re: [PATCH 1/2] sysemu/runstate: Let runstate_is_running() return
 bool
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Amit Shah <amit@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210111152020.1422021-1-philmd@redhat.com>
 <20210111152020.1422021-2-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <07895651-8d3f-5029-f53d-c85046a4d671@vivier.eu>
Date: Tue, 9 Mar 2021 23:13:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210111152020.1422021-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:12XOd/fQZjSctmbivNeZ1JZuQewWmbkfNL57bgUQXmbdKx9dqLq
 HByZ1sycMG2xd1f+Y6yoJ/TNHv1q6ARh/FZPZEs0rYlTXo9PPylXUW3db8Eoe56W/2ymSKS
 /crueO/Fx3A1swwtZA4GcywniuEYh2T+g3qQCTjORZGEdqbUjOU+rQWriBAh+Sl4PrvEl7W
 vTfr73lCewZh9adojPJ2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0bXVhwhndoo=:bFHdv36pWdMKsFzU/9x10J
 fmKQKyh8l7iyerCElMGY2yYMA3QZwQ6jbBMMIVsI6KEc+S2AIhKNe7HuCowVP5x4JzeuftrFe
 e1+4vqqbDGJ3WGNzmpMYAhJ0Njbl6/EAgMbtJQKAqVaryqK3xVT9dpbAwX3JzDGJqUfhAXoyN
 JdHgfLNttj3xq5oyOsgInECsqt4mS31a+Lqlsy422v8f/DZtEkiOmSHFr077kI8kzB2J7k7HL
 Pq97nLqxOVL/HO97G3GmXoeFA/rtuZlezrPfR0HVlsWTR+XvzwO9rqlp5Web+tuIavvic7Vu+
 m8uJOnVXHSJSFQaDy0PAXdj4FDanqvaZ9O1bOj3zb6DcA1MOhXI+XZ/DB4Tt3isCVhPMAk1oI
 uru20n4qviPJbzX7PPt7Bo/L3VJeJyDIUhcqJHkgj+lgqfnL42QDBDbdSpSHhQ3q3VgvXUM2Y
 KfFETldzFg==

Le 11/01/2021 à 16:20, Philippe Mathieu-Daudé a écrit :
> runstate_check() returns a boolean. runstate_is_running()
> returns what runstate_check() returns, also a boolean.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/runstate.h | 2 +-
>  softmmu/runstate.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index e557f470d42..3ab35a039a0 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -6,7 +6,7 @@
>  
>  bool runstate_check(RunState state);
>  void runstate_set(RunState new_state);
> -int runstate_is_running(void);
> +bool runstate_is_running(void);
>  bool runstate_needs_reset(void);
>  bool runstate_store(char *str, size_t size);
>  
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 636aab0addb..c7a67147d17 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -217,7 +217,7 @@ void runstate_set(RunState new_state)
>      current_run_state = new_state;
>  }
>  
> -int runstate_is_running(void)
> +bool runstate_is_running(void)
>  {
>      return runstate_check(RUN_STATE_RUNNING);
>  }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


