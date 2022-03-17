Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE6E4DBE92
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 06:40:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291354.494452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUirv-0004R0-I2; Thu, 17 Mar 2022 05:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291354.494452; Thu, 17 Mar 2022 05:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUirv-0004OH-EN; Thu, 17 Mar 2022 05:40:15 +0000
Received: by outflank-mailman (input) for mailman id 291354;
 Thu, 17 Mar 2022 05:17:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ek4T=T4=ispras.ru=pavel.dovgalyuk@srs-se1.protection.inumbo.net>)
 id 1nUiVu-0001GL-4z
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 05:17:30 +0000
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89adf9db-a5b1-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 06:17:28 +0100 (CET)
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 5A3F1405A19B;
 Thu, 17 Mar 2022 05:01:08 +0000 (UTC)
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
X-Inumbo-ID: 89adf9db-a5b1-11ec-853c-5f4723681683
Message-ID: <0a1fbad0-0e4d-661d-c25a-7a7d70896eb2@ispras.ru>
Date: Thu, 17 Mar 2022 08:01:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] Use g_new() & friends where that makes obvious
 sense
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Keith Busch
 <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth
 <michael.roth@amd.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia Huck
 <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 haxm-team@intel.com, qemu-s390x@nongnu.org
References: <20220315144156.1595462-1-armbru@redhat.com>
 <20220315144156.1595462-4-armbru@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <20220315144156.1595462-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.03.2022 17:41, Markus Armbruster wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
> 
> This commit only touches allocations with size arguments of the form
> sizeof(T).
> 
> Patch created mechanically with:
> 
>      $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   replay/replay-char.c                     |  4 +--
>   replay/replay-events.c                   | 10 +++---
> 

Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

> diff --git a/replay/replay-char.c b/replay/replay-char.c
> index dc0002367e..d2025948cf 100644
> --- a/replay/replay-char.c
> +++ b/replay/replay-char.c
> @@ -50,7 +50,7 @@ void replay_register_char_driver(Chardev *chr)
>   
>   void replay_chr_be_write(Chardev *s, uint8_t *buf, int len)
>   {
> -    CharEvent *event = g_malloc0(sizeof(CharEvent));
> +    CharEvent *event = g_new0(CharEvent, 1);
>   
>       event->id = find_char_driver(s);
>       if (event->id < 0) {
> @@ -85,7 +85,7 @@ void replay_event_char_read_save(void *opaque)
>   
>   void *replay_event_char_read_load(void)
>   {
> -    CharEvent *event = g_malloc0(sizeof(CharEvent));
> +    CharEvent *event = g_new0(CharEvent, 1);
>   
>       event->id = replay_get_byte();
>       replay_get_array_alloc(&event->buf, &event->len);
> diff --git a/replay/replay-events.c b/replay/replay-events.c
> index 15983dd250..ac47c89834 100644
> --- a/replay/replay-events.c
> +++ b/replay/replay-events.c
> @@ -119,7 +119,7 @@ void replay_add_event(ReplayAsyncEventKind event_kind,
>           return;
>       }
>   
> -    Event *event = g_malloc0(sizeof(Event));
> +    Event *event = g_new0(Event, 1);
>       event->event_kind = event_kind;
>       event->opaque = opaque;
>       event->opaque2 = opaque2;
> @@ -243,17 +243,17 @@ static Event *replay_read_event(int checkpoint)
>           }
>           break;
>       case REPLAY_ASYNC_EVENT_INPUT:
> -        event = g_malloc0(sizeof(Event));
> +        event = g_new0(Event, 1);
>           event->event_kind = replay_state.read_event_kind;
>           event->opaque = replay_read_input_event();
>           return event;
>       case REPLAY_ASYNC_EVENT_INPUT_SYNC:
> -        event = g_malloc0(sizeof(Event));
> +        event = g_new0(Event, 1);
>           event->event_kind = replay_state.read_event_kind;
>           event->opaque = 0;
>           return event;
>       case REPLAY_ASYNC_EVENT_CHAR_READ:
> -        event = g_malloc0(sizeof(Event));
> +        event = g_new0(Event, 1);
>           event->event_kind = replay_state.read_event_kind;
>           event->opaque = replay_event_char_read_load();
>           return event;
> @@ -263,7 +263,7 @@ static Event *replay_read_event(int checkpoint)
>           }
>           break;
>       case REPLAY_ASYNC_EVENT_NET:
> -        event = g_malloc0(sizeof(Event));
> +        event = g_new0(Event, 1);
>           event->event_kind = replay_state.read_event_kind;
>           event->opaque = replay_event_net_load();
>           return event;

