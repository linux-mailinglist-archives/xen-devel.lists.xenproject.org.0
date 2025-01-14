Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F964A10540
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:24:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871194.1282234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXf1s-0001d3-Oz; Tue, 14 Jan 2025 11:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871194.1282234; Tue, 14 Jan 2025 11:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXf1s-0001Zu-ME; Tue, 14 Jan 2025 11:24:16 +0000
Received: by outflank-mailman (input) for mailman id 871194;
 Tue, 14 Jan 2025 11:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcbX=UG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXf1r-0001Zk-UN
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:24:15 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 157a167b-d26a-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 12:24:14 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-30613802a59so29689311fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:24:14 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c7a57sm17694471fa.89.2025.01.14.03.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 03:24:12 -0800 (PST)
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
X-Inumbo-ID: 157a167b-d26a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736853853; x=1737458653; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ov7SGz9floGkFITp6OmiwsetogpeF9lsC3i30Wh9+/w=;
        b=XKhwHJtIkEwcIRWhglIxFs0ZcGavoBwRruRRury8KYOixOvYGhmBm8T0gjQ9ydujuB
         B9RdXratLB8h1v39il2xTH/UidYgWMO4vDKnuYV6du7CnYX4g38/Hhs9qFTucm69MY+S
         DxnVPZTJu68RrAtbaReXHnRSo5rbo/bXMqZPWoHCX87zIW0Op2P1H6YFIZH151L+BLUm
         hJ4SfP3GrP8jxbU3XqKcFYEVQxdgsV2vEqgJW8y0cnCDqNf8/eEkC3rowDCXADE1oYtr
         NiDl0d/mDQvongvu58Qn8rz9P2OgpmLlFzs4IwyHp+tMkMVlK8vc1/WUXmArhyKhL2XD
         PKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736853853; x=1737458653;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ov7SGz9floGkFITp6OmiwsetogpeF9lsC3i30Wh9+/w=;
        b=C3DSkRx8wxXifUQq0goj38H/8MiNGUrGLRYrMsejNW7KrP8PfFMguwJL35sJPkEQ7G
         iYwmi1263HAq7EdvRJO4baiJbho+GLSkhHcopMSrGsNOBlubSI5JQBNuRVnX52i6fWcq
         3ANvtTW3a2WM57K67X/brsn//cX8L+WLQHdYY/c3GUACJwwLnznmmTxEja2eEUtA3TMG
         nxncnkq/FkBnlkhLBknjqgM6VTw8zJtW/KqavB4L9t4XiI6T1WP2bcCZ+ZjkBVW1Ug7Y
         Ke2SoxY2GWJgUPlNXnhVyF7GxJuUaCv0DiZMCA4mPyYhGWBL2piQAGGIzZ07kJSHDWaN
         UOVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbWc4lGYHM4H/NsU3Uko1v4rZW8eTxsKEj2nC8CLavfnodpPeCDyj8zYUmQcBoo5zOIsAvKPfog5Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+okZ+EpjJFmi5WJpC9eboJTTU7nnAdz29i2vJuPqsTj75Mggk
	Mm0J+RYIJUq26SoAtxkOe3uscad0Y4DKFAYWZSrdRqjyaC2XcjRsD26l5w==
X-Gm-Gg: ASbGncstVbL0vPllvqs8ohKYM5VOmw7fyricFE7lZsQqRWwwhl2S2G5qMFyC30AfxOo
	CL2KfOf65R64JiQyGfMPmuWb4s54cjLJcBqNgzvXyooR4nlwAoyLMU83yRD6hOXoeg1iPHHd1NC
	DGH9EUY4H6VnPnE3BShyH4n3D9F0UEzNOYF75P+xLBTD6oT82uyCuuChG/e1mWvN8KGdKDGMnBa
	J9RkgsxPFHmCwAar1SO9ol8g+/kQSUtqkYddcUSCdS5DiQVn6RQHu4STP0inJhMNOYF4w==
X-Google-Smtp-Source: AGHT+IEwky2WvzlsN6SIFGHJ/opnNHZSBoFIvdYL9wMAxbCJAe4KJo/jwMJuo35+lTGYSzUXqFvEuw==
X-Received: by 2002:a05:651c:b1f:b0:306:f7:c40a with SMTP id 38308e7fff4ca-30600f7c566mr72289961fa.18.1736853853236;
        Tue, 14 Jan 2025 03:24:13 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------G3qNQP67PgfeNq0TetJoPCYa"
Message-ID: <0a4fb910-14f4-4b89-8ab6-33518cec8b85@gmail.com>
Date: Tue, 14 Jan 2025 12:24:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xentrace: free CPU mask string before overwriting pointer
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <fedf2b9d-a475-4062-b8a4-5e33c7dd6305@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fedf2b9d-a475-4062-b8a4-5e33c7dd6305@suse.com>

This is a multi-part message in MIME format.
--------------G3qNQP67PgfeNq0TetJoPCYa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/14/25 9:12 AM, Jan Beulich wrote:
> While multiple -c options may be unexpected, we'd still better deal with
> them properly.
>
> Also restore the blank line that was bogusly zapped by the same commit.
>
> Coverity-ID: 1638723
> Fixes: e4ad2836842a ("xentrace: Implement cpu mask range parsing of human values (-c)")
> Signed-off-by: Jan Beulich<jbeulich@suse.com>

R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> --- a/tools/xentrace/xentrace.c
> +++ b/tools/xentrace/xentrace.c
> @@ -1105,8 +1105,10 @@ static void parse_args(int argc, char **
>               break;
>   
>           case 'c': /* set new cpu mask for filtering (when xch is set). */
> +            free(opts.cpu_mask_str);
>               opts.cpu_mask_str = strdup(optarg);
>               break;
> +
>           case 'e': /* set new event mask for filtering*/
>               parse_evtmask(optarg);
>               break;
--------------G3qNQP67PgfeNq0TetJoPCYa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/14/25 9:12 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:fedf2b9d-a475-4062-b8a4-5e33c7dd6305@suse.com">
      <pre wrap="" class="moz-quote-pre">While multiple -c options may be unexpected, we'd still better deal with
them properly.

Also restore the blank line that was bogusly zapped by the same commit.

Coverity-ID: 1638723
Fixes: e4ad2836842a ("xentrace: Implement cpu mask range parsing of human values (-c)")
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>R-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>Thanks.</pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:fedf2b9d-a475-4062-b8a4-5e33c7dd6305@suse.com">
      <pre wrap="" class="moz-quote-pre">

--- a/tools/xentrace/xentrace.c
+++ b/tools/xentrace/xentrace.c
@@ -1105,8 +1105,10 @@ static void parse_args(int argc, char **
             break;
 
         case 'c': /* set new cpu mask for filtering (when xch is set). */
+            free(opts.cpu_mask_str);
             opts.cpu_mask_str = strdup(optarg);
             break;
+
         case 'e': /* set new event mask for filtering*/
             parse_evtmask(optarg);
             break;
</pre>
    </blockquote>
  </body>
</html>

--------------G3qNQP67PgfeNq0TetJoPCYa--

