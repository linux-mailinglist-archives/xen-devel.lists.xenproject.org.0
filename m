Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F38A08D30
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 11:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869387.1280845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBpR-0003EM-5W; Fri, 10 Jan 2025 10:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869387.1280845; Fri, 10 Jan 2025 10:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBpR-0003D1-2F; Fri, 10 Jan 2025 10:01:21 +0000
Received: by outflank-mailman (input) for mailman id 869387;
 Fri, 10 Jan 2025 10:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r1rC=UC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tWBpP-0003Ct-3R
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 10:01:19 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d52b9f3b-cf39-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 11:01:17 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so1646134f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 02:01:17 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9dc895esm46937395e9.13.2025.01.10.02.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 02:01:15 -0800 (PST)
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
X-Inumbo-ID: d52b9f3b-cf39-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736503276; x=1737108076; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YqNXwsBBjRVrnRTVKDJZnSkj54PnJGjlJvQf7Lwyxzo=;
        b=ldCQHhC9pZq1Xz/7KD7/tpEuMF82HVH2WoZxnzH7Lrfbd0tugArHvHdKYNOGGUk68g
         i4JGYqowgV1zUwJJZrRPHyh8/HwUuQM9LIKFyJqhLPY98wmx1fjmY7ttSwOutn/3WDZC
         aofygu6lJ6J27xYtmzfpuvmct9PbAeoAFPHp5w/TwWODTi7A61Zdgt7nVsNLfbOl6ons
         H1xpR9AUH0XOtjJMBWmbqpfccQJLHhkWDf8+Y03HMLgbjU/ciFlToobsP+uRhbRm5mTS
         sz2mxeiEb+qWj54xl82igOAoFgX77mi001TxKsmn4rGH8vpW5Z4un5F/v4sA6VQ5MIta
         csyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736503276; x=1737108076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqNXwsBBjRVrnRTVKDJZnSkj54PnJGjlJvQf7Lwyxzo=;
        b=jV1IXNoPbR2oszRhF34p9AuzbweGa/mJBkfX3krkvYlRH7zKM1Ppt7bjRSX0DyxoMu
         0qcIdtR16YSkwjk2OBWQowDXCqiHXTyoSHKCkVUT15/F08ru3M3HFnIilAN5BcJyLKa1
         MTtOTu+rPbwH4yGcgfHZzQz86hGd0HJNFZL+rXkBJ+EedJvKBjegrPYrpYMkltHT8DUZ
         JNncGvwpkDGULk9sC0eT30EStuPxZBRTdwCGYVTjq7i6YMQ/RfQF76ek7uneZsy8Bggx
         I27gDBiZRKF/RzZB79S9ZJo3Foge2g0cTypXuVnXtLU33+fohltajOMYt2jgT8IUNrYs
         /JHA==
X-Forwarded-Encrypted: i=1; AJvYcCXPfsb5+wUrQEJ8fdmLR78T37o1mtqCtlafejh7+QMQFcWZIf+uqaeJlCMUi5pHnMhzKrtgfrAzwqY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5KO7bBnEuiheBWFv1yoqHh2lRVLS64msgs3a2NRNfyuQiGJ8P
	3ToMsxezL/b6MxLYUOgySa7WuoSLf/HZuv7s+Wy9cVLbuSl7l6t1ycCU43GEixM=
X-Gm-Gg: ASbGnctwX5ep87JiLMAKCkZYJnvrn2pCL5pJH63z8cB3VltHWPDyIEc1KPR13yuNqRF
	9YlxUxU6VJQ9qcW1HKmvtFlOxOvYi/LuIbw+DlpEjAUkO+rzyTq1niKfMdhydCwh/N0Chv1u/P+
	5e+B+TYMpiMlrQNCaVbH5MHywZNUK3P+ufxdNat557SW+Q3N8rnUcdObSOsXOSjI3srbJbnkFIZ
	j2Dt2DYY0HU0A7eCa4W//anIepfLZYtzmn/sxMqirnjyUolRmEvuKLvgk0v+Ghau2wlb4+9sTrw
	2QKo0KJPWp0ctq9lOGvQPw==
X-Google-Smtp-Source: AGHT+IHXWN9Z9dykOvTV6ouEKFxaJmZvNZaGQ9zNkagbHLSAGDh3mtW0ErVxn4BZFrdXHOgFsXu8Zg==
X-Received: by 2002:a05:6000:481e:b0:386:37af:dd9a with SMTP id ffacd0b85a97d-38a872f534dmr9374207f8f.35.1736503276359;
        Fri, 10 Jan 2025 02:01:16 -0800 (PST)
Message-ID: <f4438a42-d8d8-4a46-b89e-d7858da35db5@linaro.org>
Date: Fri, 10 Jan 2025 11:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hw/xen: Add xs_node_read() helper function
To: Roger Pau Monne <roger.pau@citrix.com>, qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20250110093531.23221-1-roger.pau@citrix.com>
 <20250110093531.23221-2-roger.pau@citrix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250110093531.23221-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/1/25 10:35, Roger Pau Monne wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This returns the full contents of the node, having created the node path
> from the printf-style format string provided in its arguments.
> 
> This will save various callers from having to do so for themselves (and
> from using xs_node_scanf() with the non-portable %ms format string.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> [remove double newline and constify trace parameters]
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony PERARD <anthony@xenproject.org>
> Cc: Paul Durrant <paul@xen.org>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>   hw/xen/trace-events             |  1 +
>   hw/xen/xen-bus-helper.c         | 22 ++++++++++++++++++++++
>   include/hw/xen/xen-bus-helper.h |  4 ++++
>   3 files changed, 27 insertions(+)
> 
> diff --git a/hw/xen/trace-events b/hw/xen/trace-events
> index a07fe41c6d3b..461dee7b239f 100644
> --- a/hw/xen/trace-events
> +++ b/hw/xen/trace-events
> @@ -39,6 +39,7 @@ xs_node_create(const char *node) "%s"
>   xs_node_destroy(const char *node) "%s"
>   xs_node_vprintf(char *path, char *value) "%s %s"
>   xs_node_vscanf(char *path, char *value) "%s %s"
> +xs_node_read(const char *path, const char *value) "%s %s"
>   xs_node_watch(char *path) "%s"
>   xs_node_unwatch(char *path) "%s"
>   
> diff --git a/hw/xen/xen-bus-helper.c b/hw/xen/xen-bus-helper.c
> index b2b2cc9c5d5e..0fba7946c55e 100644
> --- a/hw/xen/xen-bus-helper.c
> +++ b/hw/xen/xen-bus-helper.c
> @@ -142,6 +142,28 @@ int xs_node_scanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
>       return rc;
>   }
>   
> +char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
> +                   unsigned int *len, Error **errp,
> +                   const char *node_fmt, ...)
> +{
> +    char *path, *value;

Alternatively use g_autofree.

> +    va_list ap;
> +
> +    va_start(ap, node_fmt);
> +    path = g_strdup_vprintf(node_fmt, ap);
> +    va_end(ap);
> +
> +    value = qemu_xen_xs_read(h, tid, path, len);
> +    trace_xs_node_read(path, value);
> +    if (!value) {
> +        error_setg_errno(errp, errno, "failed to read from '%s'", path);
> +    }
> +
> +    g_free(path);
> +
> +    return value;
> +}
> +
>   struct qemu_xs_watch *xs_node_watch(struct qemu_xs_handle *h, const char *node,
>                                       const char *key, xs_watch_fn fn,
>                                       void *opaque, Error **errp)
> diff --git a/include/hw/xen/xen-bus-helper.h b/include/hw/xen/xen-bus-helper.h
> index d8dcc2f0107d..6478d25be5e6 100644
> --- a/include/hw/xen/xen-bus-helper.h
> +++ b/include/hw/xen/xen-bus-helper.h
> @@ -37,6 +37,10 @@ int xs_node_scanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
>                     const char *node, const char *key, Error **errp,
>                     const char *fmt, ...)
>       G_GNUC_SCANF(6, 7);

While I suppose the same comment still applies here ("/* Read from
node/key unless node is empty, in which case read from key */"), it
would be nice to precise the returned value.

> +char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
> +                   unsigned int *len, Error **errp,
> +                   const char *node_fmt, ...)
> +    G_GNUC_PRINTF(5, 6);
>   
>   /* Watch node/key unless node is empty, in which case watch key */
>   struct qemu_xs_watch *xs_node_watch(struct qemu_xs_handle *h, const char *node,

Mostly nitpicking, otherwise patch LGTM.

